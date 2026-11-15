# frozen_string_literal: true

require 'fileutils'
require 'digest'
require 'json'
require 'open3'
require 'optparse'
require 'rexml/document'
require 'tmpdir'
require 'time'

# 使用安装后的真实 target UUID 组装临时 Scheme，不修改 Pods 工程或主 App Scheme。
module JobsSwiftPodsTests
  module_function

  def capture(*command)
    output, error, status = Open3.capture3(*command)
    raise "命令失败：#{command.join(' ')}\n#{error}\n#{output}" unless status.success?

    output
  end

  def installed_targets(root, selected)
    project_path = File.join(root, 'Pods', 'Pods.xcodeproj')
    project = JSON.parse(capture('plutil', '-convert', 'json', '-o', '-', File.join(project_path, 'project.pbxproj')))
    objects = project.fetch('objects')
    project_object = objects.fetch(project.fetch('rootObject'))
    raise 'Pods 工程根对象不是 PBXProject' unless project_object.fetch('isa') == 'PBXProject'

    targets = project_object.fetch('targets').map { |uuid| [uuid, objects.fetch(uuid)] }
    selected.map do |name|
      label = "#{name}-Unit-Stability"
      matches = targets.select { |_uuid, target| target['name'] == label }
      raise "#{label} 必须有且仅有一个 target；请先 pod install" unless matches.length == 1

      uuid, target = matches.first
      unless target['isa'] == 'PBXNativeTarget' && target['productType'] == 'com.apple.product-type.bundle.unit-test'
        raise "#{label} 不是独立 XCTest target"
      end
      sources = target.fetch('buildPhases').map { |identifier| objects.fetch(identifier) }
                      .select { |phase| phase['isa'] == 'PBXSourcesBuildPhase' }
                      .flat_map { |phase| phase.fetch('files') }
      raise "#{label} 没有参与编译的测试源码" if sources.empty?

      product = objects.fetch(target.fetch('productReference')).fetch('path')
      { name: name, label: label, uuid: uuid, product: product, source_count: sources.length,
        project: project_path }
    end
  end

  def buildable(parent, target)
    parent.add_element('BuildableReference', {
      'BuildableIdentifier' => 'primary', 'BlueprintIdentifier' => target.fetch(:uuid),
      'BuildableName' => target.fetch(:product), 'BlueprintName' => target.fetch(:label),
      'ReferencedContainer' => "container:#{target.fetch(:project)}"
    })
  end

  def workspace(output, targets)
    path = File.join(output, 'JobsSwiftPodStability.xcworkspace')
    scheme_path = File.join(path, 'xcshareddata', 'xcschemes', 'JobsSwiftPodStability.xcscheme')
    FileUtils.mkdir_p(File.dirname(scheme_path))
    document = REXML::Document.new
    document.add_element('Workspace', { 'version' => '1.0' })
            .add_element('FileRef', { 'location' => "absolute:#{targets.first.fetch(:project)}" })
    File.open(File.join(path, 'contents.xcworkspacedata'), 'w') { |file| document.write(file, 2) }

    document = REXML::Document.new
    scheme = document.add_element('Scheme', { 'version' => '1.7', 'LastUpgradeVersion' => '2700' })
    entries = scheme.add_element('BuildAction', { 'parallelizeBuildables' => 'YES', 'buildImplicitDependencies' => 'YES' })
                    .add_element('BuildActionEntries')
    targets.each do |target|
      entry = entries.add_element('BuildActionEntry', {
        'buildForTesting' => 'YES', 'buildForRunning' => 'NO', 'buildForProfiling' => 'NO',
        'buildForArchiving' => 'NO', 'buildForAnalyzing' => 'YES'
      })
      buildable(entry, target)
    end
    testables = scheme.add_element('TestAction', {
      'buildConfiguration' => 'Debug',
      'selectedDebuggerIdentifier' => 'Xcode.DebuggerFoundation.Debugger.LLDB',
      'selectedLauncherIdentifier' => 'Xcode.IDEFoundation.Launcher.LLDB',
      'shouldUseLaunchSchemeArgsEnv' => 'YES'
    }).add_element('Testables')
    targets.each do |target|
      buildable(testables.add_element('TestableReference', { 'skipped' => 'NO', 'parallelizable' => 'NO' }), target)
    end
    File.open(scheme_path, 'w') { |file| document.write(file, 2) }
    path
  end

  def run(command, log_path, timeout)
    started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    status = nil
    timed_out = false
    termination_reason = nil
    process_reaped = false
    File.open(log_path, 'w') do |log|
      log.sync = true
      log.puts(JSON.generate(command))
      stdin = stdout = wait = nil
      completed = false
      begin
        # 不使用 Open3 的 block 隐式 join，避免清理异常时再次无限等待。
        stdin, stdout, wait = Open3.popen2e(*command, pgroup: true)
        stdin.close
        signal_group = lambda do |signal|
          Process.kill(signal, -wait.pid)
          true
        rescue Errno::ESRCH
          false
        end
        group_alive = lambda do
          Process.kill(0, -wait.pid)
          true
        rescue Errno::ESRCH
          false
        end
        heartbeat = started
        stream_closed = false
        leader_exited_at = term_sent_at = kill_sent_at = nil
        loop do
          now = Process.clock_gettime(Process::CLOCK_MONOTONIC)
          leader_exited_at ||= now unless wait.alive?
          drain_expired = leader_exited_at && !stream_closed && now - leader_exited_at >= 2
          deadline_expired = now - started >= timeout
          if !timed_out && (deadline_expired || drain_expired) && (!stream_closed || wait.alive?)
            timed_out = true
            termination_reason = deadline_expired ? 'process_timeout' : 'output_drain_timeout'
            signal_group.call('TERM')
            term_sent_at = now
          end
          # 主进程退出不代表后代退出；宽限后仍对本次独立进程组补发 KILL。
          if term_sent_at && !kill_sent_at && now - term_sent_at >= 1
            signal_group.call('KILL')
            kill_sent_at = now
          end
          break if stream_closed && !wait.alive? && (!timed_out || !group_alive.call || kill_sent_at)
          break if kill_sent_at && now - kill_sent_at >= 1

          if !stream_closed && IO.select([stdout], nil, nil, 0.05)
            begin
              chunk = stdout.readpartial(16_384)
              log.write(chunk)
              $stdout.write(chunk)
              $stdout.flush
            rescue EOFError
              stream_closed = true
            end
          elsif stream_closed
            wait.join(0.05)
          end
          if now - heartbeat >= 30
            puts "[Stability] 执行中 #{(now - started).round} 秒；日志：#{log_path}"
            heartbeat = now
          end
        end
        process_reaped = !wait.join(1).nil?
        status = wait.value if process_reaped
        completed = true
      ensure
        unless completed || wait.nil?
          # 中断、日志写入失败等异常同样只清理本次命令的进程组。
          begin
            Process.kill('TERM', -wait.pid)
          rescue Errno::ESRCH
          end
          wait.join(0.2)
          begin
            Process.kill('KILL', -wait.pid)
          rescue Errno::ESRCH
          end
          wait.join(1)
        end
        stdin.close if stdin && !stdin.closed?
        stdout.close if stdout && !stdout.closed?
      end
    end
    { command: command, log: log_path, exit_code: status&.exitstatus, signal: status&.termsig,
      timed_out: timed_out, termination_reason: termination_reason, process_reaped: process_reaped,
      success: status&.success? == true && !timed_out && process_reaped,
      seconds: (Process.clock_gettime(Process::CLOCK_MONOTONIC) - started).round(2) }
  end

  def source_fingerprint(root)
    paths = Dir.glob(File.join(root, 'JobsByPods', '*', '**', '*.{swift,h,m,mm,metal,podspec}')).reject do |path|
      path.split(File::SEPARATOR).any? { |component| %w[ManualBySwiftPods@Pods .git Pods node_modules build DerivedData].include?(component) }
    end
    paths += %w[Podfile Podfile.deps Podfile.lock].map { |path| File.join(root, path) }
    digest = Digest::SHA256.new
    paths.sort.each do |path|
      digest.update(path.delete_prefix(root))
      digest.update(Digest::SHA256.file(path).hexdigest)
    end
    digest.hexdigest
  end

  def verify_test_tree(tree, targets)
    nodes = []
    visit = lambda do |node|
      nodes << node
      Array(node['children']).each { |child| visit.call(child) }
    end
    tree.fetch('testNodes').each { |node| visit.call(node) }
    bundles = nodes.select { |node| node['nodeType'] == 'Unit test bundle' }
    targets.to_h do |target|
      expected = target.fetch(:product).delete_suffix('.xctest')
      matches = bundles.select { |bundle| bundle['name'].delete_suffix('.xctest') == expected }
      raise "结果缺少测试 bundle：#{expected}" unless matches.length == 1

      cases = []
      collect = lambda do |node|
        cases << node if node['nodeType'] == 'Test Case'
        Array(node['children']).each { |child| collect.call(child) }
      end
      collect.call(matches.first)
      raise "#{expected} 没有实际通过的测试" if cases.empty? || cases.any? { |node| node['result'] != 'Passed' }

      [target.fetch(:name), cases.length]
    end
  end

  def main(arguments)
    options = { audit_only: false, build_timeout: 1800, test_timeout: 900, jobs: 2 }
    OptionParser.new do |parser|
      parser.banner = 'ruby ScriptsByPods/jobs_swift_pods_tests.rb/jobs_swift_pods_tests.rb [options]'
      parser.on('--audit-only', '仅核对已安装测试 target，不构建或运行') { options[:audit_only] = true }
      parser.on('--pods NAMES', '只验证指定 Pod，逗号分隔') { |value| options[:pods] = value.split(',').uniq }
      parser.on('--destination DESTINATION', 'xcodebuild 的 iOS Simulator destination') { |value| options[:destination] = value }
      parser.on('--output-dir PATH') { |value| options[:output] = File.expand_path(value) }
      parser.on('--derived-data PATH') { |value| options[:derived_data] = File.expand_path(value) }
      parser.on('--build-timeout SECONDS', Integer) { |value| options[:build_timeout] = value }
      parser.on('--test-timeout SECONDS', Integer) { |value| options[:test_timeout] = value }
      parser.on('-h', '--help') { puts parser; return 0 }
    end.parse!(arguments)
    raise '不接受额外位置参数' unless arguments.empty?
    raise '构建和测试超时必须大于零' unless options.values_at(:build_timeout, :test_timeout).all?(&:positive?)
    unless options[:audit_only] || options[:destination].to_s.start_with?('platform=iOS Simulator,')
      raise '请用 --destination 指定真实 iOS Simulator（platform=iOS Simulator,id=设备UUID）'
    end

    root = File.expand_path('../..', __dir__)
    specs = Dir.glob(File.join(root, 'JobsByPods', '*', '*.podspec')).select { |path| File.read(path).include?(".test_spec 'Stability'") }
    names = specs.map { |path| File.read(path)[/\.name\s*=\s*['"]([^'"]+)['"]/, 1] }.sort
    raise '没有找到 Stability test_spec' if names.empty? || names.any?(&:nil?)
    selected = options[:pods] || names
    raise "未知 Pod：#{selected - names}" unless (selected - names).empty?
    raise 'Pod 选择为空' if selected.empty?

    targets = installed_targets(root, selected)
    output = options[:output] || Dir.mktmpdir('JobsSwiftPodStability-')
    FileUtils.mkdir_p(output)
    results_path = File.join(output, 'results.json')
    raise "输出目录已有结果，请换一个目录：#{output}" if File.exist?(results_path)

    result = { started_at: Time.now.utc.iso8601, selected_pods: selected, targets: targets, audit_only: options[:audit_only],
               source_fingerprint: source_fingerprint(root),
               destination: options[:destination], success: false }
    save = -> { File.write(results_path, JSON.pretty_generate(result) + "\n") }
    save.call
    if options[:audit_only]
      result[:success] = true
      save.call
      puts "[Stability] #{targets.length} 个独立测试 target 已核对；未构建或执行测试。#{results_path}"
      return 0
    end

    workspace_path = workspace(output, targets)
    derived_data = options[:derived_data] || File.join(output, 'DerivedData')
    common = ['xcodebuild', '-workspace', workspace_path, '-scheme', 'JobsSwiftPodStability', '-configuration', 'Debug',
              '-sdk', 'iphonesimulator', '-destination', options.fetch(:destination), '-jobs', options[:jobs].to_s,
              '-derivedDataPath', derived_data, 'CODE_SIGNING_ALLOWED=NO', 'ONLY_ACTIVE_ARCH=YES', 'ARCHS=arm64',
              'IPHONEOS_DEPLOYMENT_TARGET=15.6', 'ENABLE_TESTABILITY=YES', 'OTHER_SWIFT_FLAGS=$(inherited) -j1']
    result[:build] = run(common + ['build-for-testing'], File.join(output, 'build.log'), options[:build_timeout])
    save.call
    return 1 unless result[:build][:success]

    bundle = File.join(output, 'Stability.xcresult')
    result[:test] = run(common + ['-parallel-testing-enabled', 'NO', '-resultBundlePath', bundle, 'test-without-building'],
                        File.join(output, 'test.log'), options[:test_timeout])
    save.call
    return 1 unless result[:test][:success]

    summary = JSON.parse(capture('xcrun', 'xcresulttool', 'get', 'test-results', 'summary', '--path', bundle))
    tree = JSON.parse(capture('xcrun', 'xcresulttool', 'get', 'test-results', 'tests', '--path', bundle))
    File.write(File.join(output, 'summary.json'), JSON.pretty_generate(summary) + "\n")
    File.write(File.join(output, 'tests.json'), JSON.pretty_generate(tree) + "\n")
    result[:summary] = summary
    result[:tests_by_pod] = verify_test_tree(tree, targets)
    result[:source_unchanged] = result[:source_fingerprint] == source_fingerprint(root)
    result[:success] = result[:source_unchanged] && summary.fetch('result') == 'Passed' &&
                       summary.fetch('totalTestCount').positive? && summary.fetch('failedTests').zero? &&
                       summary.fetch('skippedTests').zero? && summary.fetch('expectedFailures').zero? &&
                       summary.fetch('testFailures').empty?
    result[:finished_at] = Time.now.utc.iso8601
    save.call
    puts "[Stability] #{result[:success] ? '通过' : '失败'}；#{results_path}"
    result[:success] ? 0 : 1
  rescue StandardError => error
    if result && save
      result[:error] = error.message
      result[:success] = false
      save.call
    end
    raise
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    exit JobsSwiftPodsTests.main(ARGV)
  rescue StandardError => error
    warn "[Stability] #{error.message}"
    exit 1
  end
end

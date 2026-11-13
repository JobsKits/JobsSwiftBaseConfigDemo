#!/usr/bin/env ruby
# JOBS_TERMINAL_STYLE_GUARD_V1_BEGIN
if $PROGRAM_NAME == __FILE__
  # 直接运行时由 fork 父进程保护配色；子进程继续原文件，不重放 Ruby 参数和预载模块。
  def jobs_terminal_style_bootstrap_v1
    return unless $PROGRAM_NAME == __FILE__
    plain = lambda do
      ENV.update('PLAIN_OUTPUT' => '1', 'NO_COLOR' => '1', 'FORCE_COLOR' => '0',
                 'CLICOLOR' => '0', 'ANSI_COLORS_DISABLED' => '1', 'npm_config_color' => 'false')
    end
    notify = lambda do |message|
      encoding = $stderr.external_encoding || Encoding::UTF_8
      $stderr.write((message + "\n").encode(encoding, invalid: :replace, undef: :replace))
    end
    return unless $stdin.tty? && $stdout.tty?
    return if ENV.key?('NO_COLOR') || ENV['PLAIN_OUTPUT'] == '1' ||
              ENV['IS_SOURCETREE_RUNTIME'] == '1' ||
              ENV.keys.any? { |key| key.match?(/\A(?:SOURCETREE|SOURCE_TREE)/i) }
    return if ['', 'dumb'].include?(ENV.fetch('TERM', ''))
    if File::ALT_SEPARATOR == '\\' || !Process.respond_to?(:fork) ||
       Thread.list.length > 1 || ENV['TMUX'] || ENV['STY']
      plain.call
      return
    end
    tty_name = IO.popen(['tty'], err: File::NULL, &:read).strip
    groups = IO.popen(['ps', '-o', 'pgid=', '-o', 'tpgid=', '-p', Process.pid.to_s], err: File::NULL, &:read).split
    unless tty_name.match?(%r{\A/dev/[A-Za-z0-9_./-]+\z}) && groups.length == 2 &&
           groups.all? { |group| group.match?(/\A\d+\z/) } && groups[0].to_i > 0 && groups[0] == groups[1]
      plain.call
      return
    end
    owner = ENV['JOBS_TERMINAL_STYLE_OWNER']
    if ENV['JOBS_TERMINAL_STYLE_TTY'] == tty_name && owner && owner.match?(/\A\d+\z/)
      begin
        Process.kill(0, owner.to_i)
        return
      rescue Errno::ESRCH, Errno::EPERM
      end
    end
    require 'io/console'
    require 'tmpdir'
    if Thread.list.length > 1
      plain.call
      return
    end
    tty = File.open('/dev/tty', 'r+')
    tty.binmode
    tty.sync = true
    keys = ['10', '11', '12'] + (0..15).map { |index| "4;#{index}" }
    palette = %w[000000 ff5f56 5fd787 ffd75f 5fafff d787ff 5fd7ff eeeeee
                 9e9e9e ff8787 87ffaf ffff87 87bfff ffafff afffff ffffff]
    targets = { '10' => 'ffffff', '11' => '000000', '12' => 'ffffff' }
    palette.each_with_index { |color, index| targets["4;#{index}"] = color }
    query = lambda do |key|
      tty.write("\e]#{key};?\a")
      bytes = ''.b
      deadline = Process.clock_gettime(Process::CLOCK_MONOTONIC) + 0.3
      loop do
        remaining = deadline - Process.clock_gettime(Process::CLOCK_MONOTONIC)
        return nil if remaining <= 0 || !IO.select([tty], nil, nil, remaining)
        piece = tty.read_nonblock(256, exception: false)
        next if piece == :wait_readable
        return nil unless piece && !piece.empty?
        bytes << piece
        return nil if bytes.bytesize > 256 || !bytes.start_with?("\e".b)
        break if bytes.end_with?("\a".b) || bytes.end_with?("\e\\".b)
      end
      match = bytes.match(/\A\e\]#{Regexp.escape(key)};rgb:([0-9a-fA-F]{1,4})\/([0-9a-fA-F]{1,4})\/([0-9a-fA-F]{1,4})(?:\a|\e\\)\z/n)
      return nil unless match
      components = match.captures.map { |hex| (hex.to_i(16) * 65535.0 / (16**hex.length - 1)).round }
      { raw: bytes, rgb: components }
    rescue IOError, SystemCallError
      nil
    end
    snapshot = lambda do
      values = {}
      tty.raw(min: 0, time: 0, intr: true) do
        keys.each do |key|
          value = query.call(key)
          return nil unless value
          values[key] = value
        end
      end
      values
    rescue IOError, SystemCallError, ArgumentError
      nil
    end
    original = snapshot.call
    unless original
      notify.call('终端不支持完整配色保存，或启动时收到其它输入；保留原配色并使用纯文本。')
      tty.close
      plain.call
      return
    end
    directory = Dir.mktmpdir('jobs-terminal-style-')
    recovery = File.join(directory, 'restore.sh')
    original_bytes = keys.map { |key| original.fetch(key).fetch(:raw) }.join
    recovery_source = "#!/bin/sh\n" \
      "[ -t 0 ] && [ \"$(tty)\" = '#{tty_name}' ] || { printf '请在原终端运行恢复入口。\\n' >&2; exit 1; }\n" \
      "printf '本操作会覆盖此终端当前配色。确认恢复脚本启动前的配色，请输入 YES：' >&2\n" \
      "IFS= read -r jobs_restore_choice\n[ \"$jobs_restore_choice\" = YES ] || exit 1\n" \
      "printf '%s\\033[0m' '#{original_bytes}' > /dev/tty\n"
    File.open(recovery, File::WRONLY | File::CREAT | File::EXCL, 0o600) do |file|
      file.binmode
      file.write(recovery_source.b)
    end
    notify.call("本次终端临时使用黑底白字；强退后恢复入口：sh \"#{recovery}\"")
    changed = false
    applied = nil
    # 比较仍生效的本轮颜色，只恢复未被用户另行修改的项。
    cleanup = lambda do
      current = applied && snapshot.call
      unless current
        notify.call("终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh \"#{recovery}\"")
        return false
      end
      conflicts = []
      restore_bytes = ''.b
      keys.each do |key|
        if current.fetch(key).fetch(:rgb) == applied.fetch(key).fetch(:rgb)
          restore_bytes << original.fetch(key).fetch(:raw)
        else
          conflicts << key
        end
      end
      tty.write(restore_bytes + "\e[0m".b)
      if conflicts.empty?
        File.unlink(recovery)
        Dir.rmdir(directory)
        true
      else
        notify.call("检测到运行期间的配色变更，已保留这些项：#{conflicts.join(' ')}")
        notify.call("确认要覆盖后续改色时才使用恢复入口：sh \"#{recovery}\"")
        false
      end
    rescue IOError, SystemCallError
      notify.call("终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh \"#{recovery}\"")
      false
    end
    child_pid = nil
    guardian = false
    interrupted = nil
    previous_signals = {}
    %w[INT TERM HUP].each do |name|
      previous_signals[name] = Signal.trap(name) do
        interrupted = name
        if child_pid && name != 'INT'
          begin
            Process.kill(name, child_pid)
          rescue Errno::ESRCH
          end
        end
      end
    end
    begin
      changed = true
      tty.write(targets.map { |key, color| "\e]#{key};##{color}\a" }.join + "\e[0m")
      applied = snapshot.call
      unless applied
        notify.call('无法核实本次临时配色，已停止启动业务。')
        raise SystemExit, 1
      end
      desired = targets.all? do |key, hex|
        rgb = hex.scan(/../).map { |component| component.to_i(16) * 257 }
        applied.fetch(key).fetch(:rgb).zip(rgb).all? { |actual, expected| (actual - expected).abs <= 255 }
      end
      unless desired
        notify.call('终端未接受本次配色，恢复后使用纯文本。')
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      if interrupted
        raise SystemExit, 128 + Signal.list.fetch(interrupted)
      end
      if Thread.list.length > 1
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      $stdout.flush
      $stderr.flush
      begin
        child_pid = Process.fork
      rescue NotImplementedError, SystemCallError
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      unless child_pid
        changed = false
        ENV['JOBS_TERMINAL_STYLE_TTY'] = tty_name
        ENV['JOBS_TERMINAL_STYLE_OWNER'] = Process.ppid.to_s
        raise SystemExit, 128 + Signal.list.fetch(interrupted) if interrupted
        return
      end
      guardian = true
      result = nil
      loop do
        begin
          _, result = Process.wait2(child_pid)
          break
        rescue Interrupt, Errno::EINTR
        end
      end
      status_code = result.exitstatus || 128 + result.termsig
      %w[INT TERM HUP].each { |name| Signal.trap(name, 'IGNORE') }
      restored = cleanup.call
      changed = false
      status_code = 1 if !restored && status_code.zero?
      tty.close
      Process.exit!(status_code)
    ensure
      if changed
        %w[INT TERM HUP].each { |name| Signal.trap(name, 'IGNORE') }
        cleanup.call
      end
      previous_signals.each { |name, handler| Signal.trap(name, handler) } unless guardian
      tty.close unless tty.closed?
    end
  rescue IOError, SystemCallError, LoadError => error
    if guardian
      notify.call("终端保护监督进程异常：#{error.message}")
      Process.exit!(1)
    end
    raise SystemExit, 1 if changed
    notify.call("终端保护不可用，使用纯文本：#{error.message}")
    plain.call
  end
  jobs_terminal_style_bootstrap_v1

end
# JOBS_TERMINAL_STYLE_GUARD_V1_END

require 'json'
require 'open3'
require 'optparse'
require 'fileutils'
require 'tmpdir'
require 'time'
require 'rexml/document'

# 用途：真实构建 Jobs 自维护 Pod 和宿主工程，逐单元或批量核对覆盖范围并保存命令日志与结果。
# 运行：在本文件目录执行 ruby ./validate_builds.rb [--batch-pods]；完整选项见 --help，需要已安装的 Pods 与 Xcode。
# 边界：此入口会实际调用 xcodebuild，构建产物写入独立输出目录；它是构建门禁，不是 App 源码或普通 XCTest 用例。

# BuildableReference 必须来自已安装 Pods 项目的真实 UUID，不能只凭 podspec 名称伪造构建覆盖。
def batch_targets(project_path, names, configuration)
  text, error, status = Open3.capture3('plutil', '-convert', 'json', '-o', '-', File.join(project_path, 'project.pbxproj'))
  raise "Cannot read installed Pods project: #{error}" unless status.success?
  project = JSON.parse(text)
  objects = project.fetch('objects')
  targets = objects.fetch(project.fetch('rootObject')).fetch('targets').map do |uuid|
    [uuid, objects.fetch(uuid)]
  end
  names.map do |name|
    matches = targets.select { |_uuid, target| target['name'] == name }
    raise "Expected exactly one installed target for #{name}; found #{matches.length}" unless matches.length == 1
    uuid, target = matches.first
    type = target.fetch('isa')
    raise "Unsupported owned target type for #{name}: #{type}" unless %w[PBXNativeTarget PBXAggregateTarget].include?(type)
    product_type = target['productType']
    if type == 'PBXNativeTarget' && !%w[com.apple.product-type.framework com.apple.product-type.library.static].include?(product_type)
      raise "Unsupported owned native product for #{name}: #{product_type}"
    end
    configurations = objects.fetch(target.fetch('buildConfigurationList')).fetch('buildConfigurations').map do |identifier|
      objects.fetch(identifier).fetch('name')
    end
    raise "Missing #{configuration} configuration for #{name}" unless configurations.include?(configuration)
    product = target['productReference'] && objects.fetch(target['productReference'])['path']
    raise "Missing product reference for #{name}" if type == 'PBXNativeTarget' && (!product || product.empty?)
    { name: name, uuid: uuid, type: type, product_type: product_type, product: product || name }
  end
end

# 聚合 Scheme 与 Workspace 仅写入验证产物目录；不修改 CocoaPods 生成的工程或第三方源码。
def batch_workspace(output, project_path, targets)
  raise 'No owned targets selected for batch compilation' if targets.empty?
  workspace = File.join(output, 'JobsOwnedPodsValidation.xcworkspace')
  scheme_name = 'JobsOwnedPodsValidation'
  scheme_path = File.join(workspace, 'xcshareddata', 'xcschemes', "#{scheme_name}.xcscheme")
  FileUtils.mkdir_p(File.dirname(scheme_path))
  document = REXML::Document.new
  document.add_element('Workspace', { 'version' => '1.0' })
          .add_element('FileRef', { 'location' => "absolute:#{project_path}" })
  File.open(File.join(workspace, 'contents.xcworkspacedata'), 'w') { |file| document.write(file, 2) }
  document = REXML::Document.new
  scheme = document.add_element('Scheme', { 'version' => '1.7' })
  entries = scheme.add_element('BuildAction', { 'parallelizeBuildables' => 'YES', 'buildImplicitDependencies' => 'YES' })
                  .add_element('BuildActionEntries')
  targets.each do |target|
    entry = entries.add_element('BuildActionEntry', {
      'buildForTesting' => 'YES', 'buildForRunning' => 'YES', 'buildForProfiling' => 'YES',
      'buildForArchiving' => 'YES', 'buildForAnalyzing' => 'YES'
    })
    entry.add_element('BuildableReference', {
      'BuildableIdentifier' => 'primary', 'BlueprintIdentifier' => target.fetch(:uuid),
      'BuildableName' => target.fetch(:product), 'BlueprintName' => target.fetch(:name),
      'ReferencedContainer' => "container:#{project_path}"
    })
  end
  File.open(scheme_path, 'w') { |file| document.write(file, 2) }
  [workspace, scheme_name, scheme_path]
end

options = { configuration: 'Debug', sdk: 'iphonesimulator', host: true, units: true, jobs: 2, swift_jobs: 1, batch_pods: false }
OptionParser.new do |parser|
  parser.banner = 'ruby .github/tests/JobsPodsUpgrade/validate_builds.rb [options]'
  parser.on('--configuration NAME') { |value| options[:configuration] = value }
  parser.on('--sdk NAME') { |value| options[:sdk] = value }
  parser.on('--output-dir PATH') { |value| options[:output] = File.expand_path(value) }
  parser.on('--derived-data PATH') { |value| options[:derived_data] = File.expand_path(value) }
  parser.on('--jobs N', Integer, 'Concurrent Xcode build tasks (default 2)') { |value| options[:jobs] = [1, value].max }
  parser.on('--swift-jobs N', Integer, 'Concurrent Swift compiler jobs per target (default 1)') { |value| options[:swift_jobs] = [1, value].max }
  parser.on('--pods NAMES', 'Comma-separated owned Pod names for a focused rebuild') { |value| options[:pods] = value.split(',') }
  parser.on('--batch-pods', 'Compile selected owned targets in one dependency graph') { options[:batch_pods] = true }
  parser.on('--skip-host') { options[:host] = false }
  parser.on('--host-only') { options[:units] = false }
end.parse!
abort 'SDK must be iphonesimulator or iphoneos' unless %w[iphonesimulator iphoneos].include?(options[:sdk])

root = File.expand_path('../../..', __dir__)
output = options[:output] || File.join(Dir.tmpdir, 'JobsPodsUpgrade', Time.now.strftime('%Y%m%d-%H%M%S'))
derived_data = options[:derived_data] || File.join(output, 'DerivedData')
FileUtils.mkdir_p(output)
result = {
  started_at: Time.now.utc.iso8601(6), root: root, configuration: options[:configuration],
  sdk: options[:sdk], derived_data: derived_data, units: [], host: nil, success: false
}
save = -> { File.write(File.join(output, 'results.json'), JSON.pretty_generate(result) + "\n") }
save.call
run = lambda do |name, command, directory = root|
  log_path = File.join(output, "#{name.gsub(/[^A-Za-z0-9_.-]/, '_')}.log")
  started_at = Time.now.utc.iso8601(6)
  started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  status = nil
  File.open(log_path, 'w') do |log|
    log.sync = true
    log.puts JSON.generate(command)
    Open3.popen2e(*command, chdir: directory) do |stdin, stdout, wait|
      stdin.close
      stdout.each_line { |line| log.write(line) }
      status = wait.value
    end
  end
  entry = { name: name, success: status.success? == true, exit_code: status.exitstatus,
            signal: status.signaled? ? status.termsig : nil, command: command, directory: directory,
            started_at: started_at, finished_at: Time.now.utc.iso8601(6),
            seconds: (Process.clock_gettime(Process::CLOCK_MONOTONIC) - started).round(2), log: log_path }
  puts "#{entry[:success] ? 'PASS' : 'FAIL'} #{name} (#{entry[:seconds]}s) #{log_path}"
  $stdout.flush
  entry
end

specs = Dir.glob(File.join(root, 'JobsByPods', '*', '*.podspec')).reject { |path| path.include?('/ManualBy') }.sort
names = specs.map do |path|
  name = File.read(path)[/\.name\s*=\s*['"]([^'"]+)['"]/, 1]
  abort "Missing Pod name: #{path}" unless name
  name
end
abort 'Duplicate owned Pod names' unless names.uniq == names
if options[:pods]
  unknown = options[:pods] - names
  abort "Unknown owned Pods: #{unknown.join(', ')}" unless unknown.empty?
  names &= options[:pods]
end
result[:owned_pod_count] = specs.length
result[:requested_units] = options[:units] ? names : []

build = lambda do |name, project_arguments, scheme_name = name|
  destination = options[:sdk] == 'iphonesimulator' ? 'generic/platform=iOS Simulator' : 'generic/platform=iOS'
  command = ['xcodebuild', *project_arguments, '-scheme', scheme_name, '-configuration', options[:configuration],
             '-sdk', options[:sdk], '-destination', destination, '-derivedDataPath', derived_data,
             '-jobs', options[:jobs].to_s,
             "OTHER_SWIFT_FLAGS=$(inherited) -j#{options[:swift_jobs]}",
             "SYMROOT=#{File.join(derived_data, 'Build/Products')}",
             "OBJROOT=#{File.join(derived_data, 'Build/Intermediates.noindex')}",
             'IPHONEOS_DEPLOYMENT_TARGET=15.6',
             'CODE_SIGNING_ALLOWED=NO', 'ONLY_ACTIVE_ARCH=YES', 'ARCHS=arm64', 'build']
  if options[:sdk] == 'iphonesimulator' && options[:configuration] == 'Release'
    # Flutter supports simulator builds in Debug mode; the native app still uses Release.
    command.insert(-2, 'FLUTTER_BUILD_MODE=debug')
    result[:flutter_build_mode] = 'debug (native Release simulator validation)'
  end
  run.call(name, command)
end

begin
  if options[:units] && options[:batch_pods]
    project_path = File.join(root, 'Pods', 'Pods.xcodeproj')
    targets = batch_targets(project_path, names, options[:configuration])
    workspace, scheme_name, scheme_path = batch_workspace(output, project_path, targets)
    batch_log = File.join(output, 'OwnedPodsBatch.log')
    result[:batch] = {
      name: 'OwnedPodsBatch', success: false, status: 'running', members: targets,
      workspace: workspace, scheme: scheme_name, scheme_path: scheme_path, log: batch_log
    }
    # 进程被外层 CI 中断时，磁盘中仍只有未验证成员；不得沿用旧结果或提前报告通过。
    result[:units] = names.map do |name|
      { name: name, success: false, status: 'not_verified', batch: 'OwnedPodsBatch', seconds: nil, log: batch_log }
    end
    save.call
    result[:batch].merge!(build.call('OwnedPodsBatch', ['-workspace', workspace], scheme_name))
    result[:batch][:status] = result[:batch][:success] ? 'passed' : 'failed'
    if result[:batch][:success]
      result[:units].each do |entry|
        entry[:success] = true
        entry[:status] = 'passed'
      end
      generator_entry = result[:units].find { |entry| entry[:name] == 'JobsAppIconRibbon' }
      if generator_entry
        generator_entry[:success] = false
        generator_entry[:status] = 'not_verified'
        save.call
        generator_entry[:generator] = run.call('JobsAppIconRibbonGenerator', [
          'xcrun', 'swiftc', '-swift-version', '5',
          File.join(root, 'JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift'),
          '-o', File.join(output, 'JobsAppIconRibbonGenerator')
        ])
        generator_entry[:success] = generator_entry[:generator][:success]
        generator_entry[:status] = generator_entry[:success] ? 'passed' : 'failed'
      end
    end
    save.call
  elsif options[:units]
    listing, listing_error, listing_status = Open3.capture3('xcodebuild', '-list', '-json', '-project', 'Pods/Pods.xcodeproj', chdir: root)
    abort listing_error unless listing_status.success?
    schemes = JSON.parse(listing).fetch('project').fetch('schemes')
    names.each do |name|
      project_path = File.join(root, 'Pods', 'Pods.xcodeproj')
      abort "Missing integrated scheme for #{name}" unless schemes.include?(name)
      entry = build.call(name, ['-project', project_path])
      if name == 'JobsAppIconRibbon' && entry[:success]
        # This Pod delivers a macOS build tool rather than an iOS framework.
        entry[:generator] = run.call('JobsAppIconRibbonGenerator', [
          'xcrun', 'swiftc', '-swift-version', '5',
          File.join(root, 'JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift'),
          '-o', File.join(output, 'JobsAppIconRibbonGenerator')
        ])
        entry[:success] = entry[:generator][:success]
      end
      result[:units] << entry
      save.call
    end
  end

  if options[:host] && result[:units].all? { |entry| entry[:success] }
    result[:host] = build.call('JobsSwiftBaseConfigDemo', ['-workspace', File.join(root, 'JobsSwiftBaseConfigDemo.xcworkspace')])
  elsif options[:host]
    result[:host] = { success: false, skipped: true, reason: 'Owned Pod compilation failed; repair before host build.' }
  end
  result[:finished_at] = Time.now.utc.iso8601(6)
  result[:success] = result[:units].all? { |entry| entry[:success] } && (!options[:host] || result[:host][:success])
  save.call
  puts "Results: #{File.join(output, 'results.json')}"
  exit(result[:success] ? 0 : 1)
rescue StandardError, Interrupt => error
  result[:success] = false
  result[:error] = "#{error.class}: #{error.message}"
  result[:finished_at] = Time.now.utc.iso8601(6)
  save.call
  warn result[:error]
  exit 1
end

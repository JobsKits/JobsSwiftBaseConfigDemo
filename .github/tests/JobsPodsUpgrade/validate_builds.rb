#!/usr/bin/env ruby
# Compiles each owned Pod before compiling the host. Logs and DerivedData stay outside build/.
require 'json'
require 'open3'
require 'optparse'
require 'fileutils'
require 'tmpdir'
require 'time'
require 'rexml/document'

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

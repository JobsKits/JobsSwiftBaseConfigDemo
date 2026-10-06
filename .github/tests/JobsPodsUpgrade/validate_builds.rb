#!/usr/bin/env ruby
# Compiles each owned Pod before compiling the host. Logs and DerivedData stay outside build/.
require 'json'
require 'open3'
require 'optparse'
require 'fileutils'
require 'tmpdir'
require 'time'

options = { configuration: 'Debug', sdk: 'iphonesimulator', host: true, units: true, jobs: 2, swift_jobs: 1 }
OptionParser.new do |parser|
  parser.banner = 'ruby .github/tests/JobsPodsUpgrade/validate_builds.rb [options]'
  parser.on('--configuration NAME') { |value| options[:configuration] = value }
  parser.on('--sdk NAME') { |value| options[:sdk] = value }
  parser.on('--output-dir PATH') { |value| options[:output] = File.expand_path(value) }
  parser.on('--derived-data PATH') { |value| options[:derived_data] = File.expand_path(value) }
  parser.on('--jobs N', Integer, 'Concurrent Xcode build tasks (default 2)') { |value| options[:jobs] = [1, value].max }
  parser.on('--swift-jobs N', Integer, 'Concurrent Swift compiler jobs per target (default 1)') { |value| options[:swift_jobs] = [1, value].max }
  parser.on('--pods NAMES', 'Comma-separated owned Pod names for a focused rebuild') { |value| options[:pods] = value.split(',') }
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
  sdk: options[:sdk], derived_data: derived_data, units: [], host: nil
}
save = -> { File.write(File.join(output, 'results.json'), JSON.pretty_generate(result) + "\n") }
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
  entry = { name: name, success: status.success?, exit_code: status.exitstatus,
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

build = lambda do |name, project_arguments|
  destination = options[:sdk] == 'iphonesimulator' ? 'generic/platform=iOS Simulator' : 'generic/platform=iOS'
  command = ['xcodebuild', *project_arguments, '-scheme', name, '-configuration', options[:configuration],
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

if options[:units]
  listing, listing_error, listing_status = Open3.capture3('xcodebuild', '-list', '-json', '-project', 'Pods/Pods.xcodeproj', chdir: root)
  abort listing_error unless listing_status.success?
  schemes = JSON.parse(listing).fetch('project').fetch('schemes')
  names.each do |name|
    project_path = File.join(root, 'Pods', 'Pods.xcodeproj')
    unless schemes.include?(name)
      # JobsOCDSL is intentionally not a host dependency: validate its real Pod delivery in a fresh consumer.
      abort "Missing integrated scheme for #{name}" unless name == 'JobsOCDSL'
      require 'xcodeproj'
      consumer = File.join(output, 'JobsOCDSLConsumer')
      FileUtils.mkdir_p(consumer)
      project = Xcodeproj::Project.new(File.join(consumer, 'JobsOCDSLConsumer.xcodeproj'))
      project.new_target(:application, 'JobsOCDSLConsumer', :ios, '15.6')
      project.save
      File.write(File.join(consumer, 'Podfile'), <<~PODFILE)
        platform :ios, '15.6'
        use_frameworks! :linkage => :static
        target 'JobsOCDSLConsumer' do
          pod 'JobsOCDSL', :path => #{File.join(root, 'JobsByPods/JobsOCDSL@Pods').inspect}
        end
      PODFILE
      install = run.call('JobsOCDSL-pod-install', ['pod', 'install', '--no-repo-update'], consumer)
      result[:isolated_install] = install
      unless install[:success]
        result[:units] << install
        save.call
        next
      end
      project_path = File.join(consumer, 'Pods', 'Pods.xcodeproj')
    end
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

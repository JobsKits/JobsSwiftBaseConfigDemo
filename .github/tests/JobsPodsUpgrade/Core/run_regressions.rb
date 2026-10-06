# frozen_string_literal: true

require 'fileutils'
require 'optparse'
require 'shellwords'
require 'socket'
require 'timeout'
require 'tmpdir'

# Foundation 状态机回归使用 Timer / ISO 工厂 fixture；不替代真实 iOS Pod 编译。
options = { output: nil, webkit: ENV['JOBS_CORE_WEBKIT'] == '1' }
OptionParser.new do |parser|
  parser.banner = 'ruby run_regressions.rb [--output DIR] [--webkit]'
  parser.on('--output DIR', '保留编译产物与命令日志到指定目录') { |value| options[:output] = value }
  parser.on('--webkit', '要求可用 macOS AppKit / WebKit，运行真实资源离线/联网对照') { options[:webkit] = true }
end.parse!

abort 'Core regressions require macOS and the selected Xcode command-line toolchain' unless RUBY_PLATFORM.include?('darwin')
root = File.expand_path('../../../..', __dir__)
output = options[:output] ? File.expand_path(options[:output]) : Dir.mktmpdir('JobsPodsCoreRegression-')
FileUtils.mkdir_p(output)
puts "Core regression artifacts: #{output}"
puts 'Evidence boundary: actual selected Core sources; Timer and ISO/DSL dependencies are named fixtures.'

counter = 0
run = lambda do |arguments, timeout: 120|
  counter += 1
  log = File.join(output, format('%02d.log', counter))
  puts Shellwords.join(arguments)
  status = nil
  File.open(log, 'w') do |handle|
    handle.puts Shellwords.join(arguments)
    handle.flush
    pid = Process.spawn({ 'DYLD_LIBRARY_PATH' => output }, *arguments, chdir: root, out: handle, err: handle)
    begin
      Timeout.timeout(timeout) { _, status = Process.wait2(pid) }
    rescue Timeout::Error
      Process.kill('KILL', pid)
      Process.wait(pid)
      raise "Timed out after #{timeout}s: #{arguments.first}; see #{log}"
    end
  end
  text = File.read(log)
  puts text.lines.drop(1).join
  raise "Command failed (#{status.exitstatus}); see #{log}" unless status.success?
end

swift = ['xcrun', 'swiftc', '-swift-version', '5', '-Onone', '-parse-as-library']
search = ['-I', output, '-L', output, '-Xlinker', '-rpath', '-Xlinker', output]
pod = ->(name, file) { File.join('JobsByPods', "#{name}@Pods", file) }
fixture = ->(name) { File.join(__dir__, 'Fixtures', name) }
module_build = lambda do |name, sources, dependencies = []|
  run.call(swift + search + dependencies.map { |dependency| "-l#{dependency}" } +
           ['-emit-library', '-emit-module', '-module-name', name, '-emit-module-path', File.join(output, "#{name}.swiftmodule")] +
           sources + ['-o', File.join(output, "lib#{name}.dylib")])
end
executable = lambda do |name, sources, dependencies = []|
  binary = File.join(output, name)
  run.call(swift + search + dependencies.map { |dependency| "-l#{dependency}" } + sources + ['-o', binary])
  run.call([binary], timeout: 30)
end

module_build.call('JobsSwiftBlock', [pod.call('JobsSwiftBlock', 'NSObject+Make.swift'), pod.call('JobsSwiftBlock', 'JobsCallbackable.swift')])
executable.call('JobsSwiftBlockRegression', ['.github/tests/JobsSwiftBlockRegression.swift'], ['JobsSwiftBlock'])
executable.call('JobsBlockStorageRegression', [File.join(__dir__, 'JobsBlockStorageRegression.swift')], ['JobsSwiftBlock'])
module_build.call('JobsByUIKit', [fixture.call('ByUIKitFixture.swift')], ['JobsSwiftBlock'])
module_build.call('JobsSwiftDSL', [fixture.call('DSLFixture.swift')], ['JobsByUIKit'])
executable.call('JobsNumericRegression', [pod.call('JobsSwiftBaseTools', 'SafeCodable.swift'), pod.call('JobsSwiftBaseTools', 'SnowflakeSwift.swift'),
  pod.call('JobsSwiftFoundation', 'UserDefaults.swift'), pod.call('JobsSwiftStandardLibrary', '容器/Array.swift'),
  pod.call('JobsSwiftStandardLibrary', '整形/BinaryInteger.swift'), File.join(__dir__, 'JobsNumericRegression.swift')],
  ['JobsSwiftDSL', 'JobsByUIKit', 'JobsSwiftBlock'])
executable.call('JobsPatchRegression', [pod.call('JobsSwiftPatch', 'JobsSwiftPatch.swift'), File.join(__dir__, 'JobsPatchRegression.swift')])

module_build.call('JobsSwiftTimer', ['JobsSwiftTimerDefs.swift', 'JobsSwiftTimerConfig.swift', 'JobsSwiftTimerProtocol.swift'].map { |file| pod.call('JobsSwiftTimer', file) } + [fixture.call('TimerFixture.swift')])
task_sources = Dir.glob(pod.call('JobsSwiftTaskCenter', '*.swift')).sort
module_build.call('JobsSwiftTaskCenter', task_sources, ['JobsSwiftTimer'])
module_build.call('JobsSwiftWorker', Dir.glob(pod.call('JobsSwiftWorker', '*.swift')).sort, ['JobsSwiftTaskCenter', 'JobsSwiftTimer', 'JobsByUIKit', 'JobsSwiftBlock'])
executable.call('JobsWorkerTaskRegression', [File.join(__dir__, 'JobsWorkerTaskRegression.swift')], ['JobsSwiftWorker', 'JobsSwiftTaskCenter', 'JobsSwiftTimer', 'JobsByUIKit', 'JobsSwiftBlock'])

l10n_sources = ['Jobsl10n.swift', 'LanguageManager.swift', 'TRLang.swift', 'TRAutoRefresh.swift',
  'Foundation&UIKit/Bundle+多语言国际化.swift', 'Foundation&UIKit/Notification+多语言国际化.swift',
  'Foundation&UIKit/String+多语言国际化.swift'].map { |file| pod.call('Jobsl10n', file) }
executable.call('JobsL10nRegression', l10n_sources + [File.join(__dir__, 'JobsL10nRegression.swift')])

if options[:webkit]
  binary = File.join(output, 'JobsMarkdownWebKitRegression')
  run.call(swift + [File.join(__dir__, 'JobsMarkdownWebKitRegression.swift'), '-o', binary])
  server = TCPServer.new('127.0.0.1', 0)
  request_count = 0
  request_lock = Mutex.new
  server_thread = Thread.new do
    loop do
      client = server.accept
      begin
        request = client.gets
        while (line = client.gets) && line != "\r\n"
          # Consume only headers. The probe performs GET requests without a body.
        end
        request_lock.synchronize { request_count += 1 } if request
        body = 'body { color: black; }'
        client.write("HTTP/1.1 200 OK\r\nContent-Type: text/css\r\nContent-Length: #{body.bytesize}\r\nConnection: close\r\n\r\n#{body}")
      ensure
        client.close
      end
    end
  end
  begin
    base = "http://127.0.0.1:#{server.addr[1]}"
    template = File.join(root, pod.call('JobsSwiftMarkdown', 'Resource/index.html'))
    run.call([binary, template, base, 'blocked'], timeout: 25)
    blocked_count = request_lock.synchronize { request_count }
    raise "Offline policy issued #{blocked_count} HTTP requests" unless blocked_count.zero?
    run.call([binary, template, base, 'allowed'], timeout: 25)
    allowed_count = request_lock.synchronize { request_count }
    raise 'Allowed-mode positive control issued no HTTP requests' unless allowed_count.positive?
    puts "Actual WebKit HTTP comparison passed: blocked=#{blocked_count}, allowed=#{allowed_count}"
  ensure
    server_thread.kill
    server.close
  end
else
  puts 'WebKit desktop probe not requested; run with --webkit on a macOS desktop session.'
end

puts 'All requested Core regressions passed.'

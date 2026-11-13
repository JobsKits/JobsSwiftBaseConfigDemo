# frozen_string_literal: true

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

require 'fileutils'
require 'optparse'
require 'shellwords'
require 'socket'
require 'timeout'
require 'tmpdir'

# 用途：编译并运行 Core 基础能力的命令行回归，覆盖闭包存储、数值、补丁、任务调度和多语言。
# 运行：在本文件目录执行 ruby ./run_regressions.rb [--output DIR] [--webkit]；需要 macOS 与所选 Xcode 工具链。
# 边界：Timer / ISO 工厂使用 fixture，WebKit 探针按需开启；不替代真实 iOS Pod 或宿主编译，不编入 App。

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

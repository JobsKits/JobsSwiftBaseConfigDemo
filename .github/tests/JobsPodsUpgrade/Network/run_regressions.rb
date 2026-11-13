#!/usr/bin/env ruby
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
require 'digest'
require 'json'
require 'optparse'
require 'socket'
require 'tempfile'
require 'tmpdir'
require 'timeout'

# 用途：编译并运行网络、密码、蓝牙和 WebSocket 回归，验证真实 Swift 核心与本机协议交互。
# 运行：在本文件目录执行 ruby ./run_regressions.rb [--output-dir DIR]；需要 Swift 工具链和已安装的 Alamofire 源码。
# 边界：仅 CLI 的 Foundation 工厂使用 fixture，蓝牙由 Mock 控制；不安装依赖、不替代 iOS Pod / 宿主构建，不编入 App。

options = { root: File.expand_path('../../../..', __dir__), output: nil, timeout: 600, swift_jobs: 1 }
OptionParser.new do |parser|
  parser.banner = 'Usage: ruby run_regressions.rb [--output-dir DIR] [--repo-root DIR]'
  parser.on('--output-dir DIR', 'Native modules, binaries, logs and results.json') { |value| options[:output] = File.expand_path(value) }
  parser.on('--timeout-seconds N', Integer, 'Per-command timeout (default 600)') { |value| options[:timeout] = [1, value].max }
  parser.on('--swift-jobs N', Integer, 'Swift compiler parallel jobs (default 1)') { |value| options[:swift_jobs] = [1, value].max }
  parser.on('--repo-root DIR', 'Project root containing JobsByPods and Pods') { |value| options[:root] = File.expand_path(value) }
end.parse!
output = options[:output] || Dir.mktmpdir('JobsPodsUpgradeNetwork-')
FileUtils.mkdir_p(output)
root = options[:root]
results = []

run = lambda do |name, arguments, timeout = options[:timeout]|
  log = File.join(output, "#{name}.log")
  started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  File.open(log, 'w') do |stream|
    stream.puts(JSON.generate(command: arguments))
    stream.flush
    pid = Process.spawn(*arguments, out: stream, err: stream, chdir: root, pgroup: true)
    status = nil
    begin
      Timeout.timeout(timeout) { _, status = Process.wait2(pid) }
    rescue Timeout::Error
      Process.kill('TERM', -pid) rescue nil
      Process.wait(pid) rescue nil
      raise "#{name} exceeded #{timeout} seconds; inspect #{log}"
    end
    unless status.success?
      reason = status.signaled? ? "signal #{status.termsig}" : "exit #{status.exitstatus}"
      results << { name: name, status: 'failed', termination: reason, log: log }
      warn IO.popen(['tail', '-n', '40', log], &:read)
      raise "#{name} failed (#{reason}); inspect #{log}"
    end
  end
  elapsed = Process.clock_gettime(Process::CLOCK_MONOTONIC) - started
  results << { name: name, status: 'passed', seconds: elapsed.round(3), log: log }
  puts "PASS #{name} (#{elapsed.round(2)} s)"
end

begin
  pods = File.join(root, 'JobsByPods')
  network = File.join(pods, 'JobsNetworking@Pods')
  tests = File.join(root, '.github/tests/JobsPodsUpgrade/Network')
  swift = [ENV.fetch('SWIFTC', 'swiftc'), '-j', options[:swift_jobs].to_s]
  selected = %w[Request/JobsValue.swift Support/HTTPMethod.swift Cache/JobsCacheKey.swift Cache/JobsCacheStore.swift Support/JobsRequestToken.swift Core/JobsEnvelope.swift].map { |path| File.join(network, path) }
  run.call('NetworkSwift6Values', [*swift, '-swift-version', '6', '-typecheck', *selected])

  lock_source = selected + %w[Core/JobsError.swift RequestConfig/JobsRetryPolicy.swift Request/JobsRequest.swift Request/JobsParameterEncoding.swift Cache/JobsCachePolicy.swift Support/JobsTrace.swift Support/JobsAsyncResultBox.swift].map { |path| File.join(network, path) }
  lock_source += Dir.glob(File.join(pods, 'JobsSwiftWebSocket@Pods/Core/**/*.swift')).sort
  lock_binary = File.join(output, 'LockReleaseRegression')
  run.call('LockReleaseCompile', [*swift, '-swift-version', '5', *lock_source, File.join(tests, 'LockReleaseRegression.swift'), '-o', lock_binary])
  %w[token-replace token-finish async-replace async-complete memory-replace memory-remove memory-clear memory-evict memory-expire websocket-state websocket-text websocket-data].each do |mode|
    run.call("LockRelease-#{mode}", [lock_binary, mode], [10, options[:timeout]].min)
  end

  crypto = %w[BaseCrypto.swift AESCBC.swift PBKDF2.swift JobsCryptoKit@对称加解密/AESGCM.swift JobsCryptoKit@对称加解密/ChaChaPoly.swift].map { |path| File.join(pods, 'JobsCryptoKit@Pods', path) }
  binary = File.join(output, 'CryptoRegression')
  run.call('CryptoCompile', [*swift, '-swift-version', '5', *crypto, File.join(tests, 'CryptoRegression.swift'), '-o', binary])
  run.call('CryptoRun', [binary])

  bluetooth = Dir.glob(File.join(pods, 'JobsBluetooth@Pods/Core/**/*.swift')).sort
  binary = File.join(output, 'BluetoothRegression')
  run.call('BluetoothCompile', [*swift, '-swift-version', '5', *bluetooth, File.join(tests, 'BluetoothRegression.swift'), '-o', binary])
  run.call('BluetoothMockRun', [binary])

  alamofire = Dir.glob(File.join(root, 'Pods/Alamofire/Source/**/*.swift')).sort
  raise 'Missing installed Alamofire sources; install dependencies through the project workflow first' if alamofire.empty?
  run.call('AlamofireNativeCompile', [*swift, '-swift-version', '5', '-parse-as-library', '-whole-module-optimization', '-emit-module', '-emit-library', '-module-name', 'Alamofire', '-emit-module-path', File.join(output, 'Alamofire.swiftmodule'), '-o', File.join(output, 'libAlamofire.dylib'), *alamofire])
  run.call('NativeDSLFixtureCompile', [*swift, '-swift-version', '5', '-parse-as-library', '-emit-module', '-emit-library', '-module-name', 'JobsSwiftDSL', File.join(tests, 'NativeDSLFactoryFixture.swift'), '-emit-module-path', File.join(output, 'JobsSwiftDSL.swiftmodule'), '-o', File.join(output, 'libJobsSwiftDSL.dylib')])
  source = %w[Core Support Request RequestConfig Cache Agent Download Upload Types Async].flat_map { |folder| Dir.glob(File.join(network, folder, '**/*.swift')).sort }
  linking = [*swift, '-swift-version', '5', '-I', output, '-L', output, '-lAlamofire', '-lJobsSwiftDSL', '-Xlinker', '-rpath', '-Xlinker', output]
  binary = File.join(output, 'NetworkRegression')
  run.call('NetworkCompile', [*linking, *source, File.join(tests, 'NetworkRegression.swift'), '-o', binary])
  run.call('NetworkControlledRun', [binary])

  binary = File.join(output, 'NetworkHTTPRegression')
  run.call('NetworkHTTPCompile', [*linking, *source, File.join(tests, 'NetworkHTTPRegression.swift'), '-o', binary])
  web_socket_binary = File.join(output, 'WebSocketRegression')
  web_socket_source = Dir.glob(File.join(pods, 'JobsSwiftWebSocket@Pods/Core/**/*.swift')).sort
  run.call('WebSocketCompile', [*swift, '-swift-version', '5', *web_socket_source, File.join(tests, 'WebSocketRegression.swift'), '-o', web_socket_binary])
  server = TCPServer.new('127.0.0.1', 0)
  port = server.addr[1]
  workers = []
  acceptor = Thread.new do
    loop do
      connection = server.accept
      workers << Thread.new(connection) do |socket|
        begin
          request = socket.gets("\r\n")
          next unless request
          method, path = request.split(' ')
          headers = {}
          while (line = socket.gets("\r\n")) && line != "\r\n"
            key, value = line.split(':', 2)
            headers[key.downcase] = value.strip
          end
          if headers['upgrade']&.downcase == 'websocket'
            accept = Digest::SHA1.base64digest(headers.fetch('sec-websocket-key') + '258EAFA5-E914-47DA-95CA-C5AB0DC85B11')
            socket.write("HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: #{accept}\r\n\r\n")
            if path == '/close'
              socket.write([0x88, 2, 0x03, 0xe8].pack('C*'))
              next
            end
            loop do
              initial = socket.read(2)
              break unless initial && initial.bytesize == 2
              bytes = initial.bytes
              opcode = bytes[0] & 15
              length = bytes[1] & 127
              length = socket.read(2).unpack1('n') if length == 126
              length = socket.read(8).unpack1('Q>') if length == 127
              mask = bytes[1] & 128 != 0 ? socket.read(4).bytes : nil
              frame = socket.read(length) || ''.b
              frame = frame.bytes.each_with_index.map { |byte, index| byte ^ mask[index % 4] }.pack('C*') if mask
              break if opcode == 8
              next if opcode == 9 && path == '/nopong'
              outgoing = opcode == 9 ? 10 : opcode
              header = [0x80 | outgoing]
              if frame.bytesize < 126
                header << frame.bytesize
                socket.write(header.pack('C*') + frame)
              else
                socket.write([*header, 126].pack('C*') + [frame.bytesize].pack('n') + frame)
              end
            end
            next
          end
          body = socket.read(headers.fetch('content-length', '0').to_i) || ''.b
          if method == 'POST'
            response = if path.start_with?('/upload')
                         { bytes: body.bytesize, hasFile: body.include?('filename="attachment.txt"'), hasJSONForm: body.include?('{"sequence":7}') }
                       else
                         { target: path, body: body.force_encoding('UTF-8') }
                       end
            payload = JSON.generate(response)
            code = 200
          elsif path == '/cut'
            socket.write("HTTP/1.1 200 OK\r\nContent-Length: 100\r\nConnection: close\r\n\r\nshort")
            next
          else
            code = path == '/200' ? 200 : (path == '/404' ? 404 : 500)
            payload = code == 200 ? 'download-ok' : 'error-page'
          end
          socket.write("HTTP/1.1 #{code} Response\r\nContent-Type: application/json\r\nContent-Length: #{payload.bytesize}\r\nConnection: close\r\n\r\n#{payload}")
        rescue IOError, SystemCallError => error
          warn "HTTP fixture connection ended: #{error.class}"
        ensure
          socket.close rescue nil
        end
      end
    end
  rescue IOError, Errno::EBADF
    # Listener is closed after the regression, including failure cleanup.
  end
  begin
    run.call('NetworkRealHTTPRun', [binary, "http://127.0.0.1:#{port}/"])
    run.call('WebSocketRealLoopbackRun', [web_socket_binary, "ws://127.0.0.1:#{port}/"])
  ensure
    server.close
    acceptor.join
    workers.each(&:join)
  end
  puts "All native regressions passed. Evidence: #{File.join(output, 'results.json')}"
ensure
  File.write(File.join(output, 'results.json'), JSON.pretty_generate(results))
end

#!/usr/bin/env ruby
# frozen_string_literal: true

# JobsPodsUpgrade network / device regressions.
# Uses real production Swift and Alamofire; a tiny Foundation DSL fixture is
# isolated to native CLI compilation. iOS Pod/host builds use the real DSL.

require 'fileutils'
require 'digest'
require 'json'
require 'optparse'
require 'socket'
require 'tempfile'
require 'tmpdir'
require 'timeout'

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
    raise "#{name} failed (#{status.exitstatus}); inspect #{log}" unless status.success?
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

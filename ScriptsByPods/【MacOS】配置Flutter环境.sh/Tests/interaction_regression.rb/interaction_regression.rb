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

require 'fileutils'
require 'open3'
require 'pty'
require 'timeout'
require 'tmpdir'

# 用途：验证 Flutter / Unity 辅助脚本与 SPM 门禁的确认、跳过、EOF、自动模式及失败退出传播。
# 运行：在本文件目录执行 ruby ./interaction_regression.rb --run；需要所属工程的完整脚本目录。
# 边界：提取真实入口，业务函数和 Swift 命令换为临时替身；不执行真实安装、清理、Flutter 或 SPM 业务。

abort '用法：ruby interaction_regression.rb --run（只运行隔离夹具）' unless ARGV == ['--run']

scripts_root = File.expand_path('../../..', __dir__)
scripts = {
  '【MacOS】配置Flutter环境.sh' => 'run_flutter_environment_setup',
  '【MacOS】拉取Flutter侧三方资源.sh' => 'run_flutter_resource_pull',
  '【MacOS】清理Unity缓存.sh' => 'run_unity_cache_cleanup',
  '【MacOS】解压Unity大资源.sh' => 'run_unity_resource_unpack',
  'SPM验证' => 'run_package_validation'
}
total = 0

# 真实 TTY 分支使用伪终端；等待确认提示后才送入回车或 EOF。
def run_with_terminal(environment, driver, answer)
  output = +''.b
  result = nil
  PTY.spawn(environment, '/bin/zsh', '-f', driver) do |reader, writer, pid|
    begin
      Timeout.timeout(8) do
        until output.include?('按回车继续'.b)
          output << reader.readpartial(4096)
        end
        writer.write(answer)
        writer.flush
        begin
          loop { output << reader.readpartial(4096) }
        rescue Errno::EIO, EOFError
          # macOS 的 PTY 在子进程退出时用 EIO 表示读取完成。
        end
        _, result = Process.wait2(pid)
      end
    rescue Timeout::Error
      Process.kill('TERM', pid) rescue nil
      Process.wait(pid) rescue nil
      raise "伪终端未按预期结束：#{output}"
    ensure
      reader.close rescue nil
      writer.close rescue nil
    end
  end
  [output.force_encoding(Encoding::UTF_8), result.exitstatus]
end

Dir.mktmpdir('jobs-pod-script-interaction-') do |fixture_root|
  scripts.each do |name, business|
    source_path = if name == 'SPM验证'
      File.join(scripts_root, '..', 'JobsBySwiftPackageManager', '【MacOS】🧠编译通过方可集成进SPM.command')
    else
      File.join(scripts_root, name, name)
    end
    source = File.read(source_path)
    raise "主入口数量异常：#{name}" unless source.scan(/^main "\$@"$/).length == 1
    definitions = source.sub(/^main "\$@"\s*\z/, '')
    package = File.join(fixture_root, 'ScriptsByPods', name)
    FileUtils.mkdir_p(package)
    driver = File.join(package, name)
    File.write(driver, definitions + <<~'STUBS' + "\nmain \"$@\"\n")
      # 假初始化及假业务仅在隔离目录记录是否越过确认门禁。
      initialize_runtime() { print -r -- initialized > "$TEST_INIT_MARKER"; }
      run_flutter_environment_setup() { print -r -- business > "$TEST_BUSINESS_MARKER"; }
      run_flutter_resource_pull() { print -r -- business > "$TEST_BUSINESS_MARKER"; }
      run_unity_cache_cleanup() { print -r -- business > "$TEST_BUSINESS_MARKER"; }
      run_unity_resource_unpack() { print -r -- business > "$TEST_BUSINESS_MARKER"; }
      run_package_validation() { print -r -- business > "$TEST_BUSINESS_MARKER"; }
    STUBS
    cases = [
      ['无TTY', {}, nil, 1, false],
      ['旧HOOK/SKIP标记无TTY', {'JOBS_POD_INSTALL_HOOK' => '1', 'JOBS_SKIP_README' => '1'}, nil, 1, false],
      ['check-only', {'JOBS_POD_INSTALL_INTERACTION' => 'check-only'}, nil, 0, false],
      ['skip', {'JOBS_POD_INSTALL_INTERACTION' => 'skip'}, nil, 0, false],
      ['无效模式', {'JOBS_POD_INSTALL_INTERACTION' => 'invalid'}, nil, 2, false],
      ['TTY回车', {}, "\n", 0, true],
      ['TTY EOF', {}, "\x04", 1, false],
      ['旧标记仍需TTY确认', {'JOBS_POD_INSTALL_HOOK' => '1', 'JOBS_SKIP_README' => '1'}, "\x04", 1, false]
    ]
    if ['【MacOS】配置Flutter环境.sh', '【MacOS】拉取Flutter侧三方资源.sh'].include?(name)
      cases += [
        ['显式非交互自动配置', {'JOBS_FLUTTER_AUTO_SETUP' => '1'}, nil, 0, true],
        ['check-only优先于显式自动配置', {'JOBS_FLUTTER_AUTO_SETUP' => '1', 'JOBS_POD_INSTALL_INTERACTION' => 'check-only'}, nil, 0, false],
        ['skip优先于显式自动配置', {'JOBS_FLUTTER_AUTO_SETUP' => '1', 'JOBS_POD_INSTALL_INTERACTION' => 'skip'}, nil, 0, false],
        ['自动配置不绕过无效模式', {'JOBS_FLUTTER_AUTO_SETUP' => '1', 'JOBS_POD_INSTALL_INTERACTION' => 'invalid'}, nil, 2, false],
        ['自动配置只接受精确1', {'JOBS_FLUTTER_AUTO_SETUP' => 'true'}, nil, 1, false]
      ]
    end
    if name == '【MacOS】拉取Flutter侧三方资源.sh'
      cases += [
        ['自动配置仍需TTY确认', {'JOBS_FLUTTER_AUTO_SETUP' => '1'}, "\x04", 1, false],
        ['自动配置TTY回车', {'JOBS_FLUTTER_AUTO_SETUP' => '1'}, "\n", 0, true]
      ]
    end
    cases.each do |label, additions, terminal_answer, expected_status, expected_business|
      init_marker = File.join(fixture_root, 'initialized')
      business_marker = File.join(fixture_root, 'business')
      FileUtils.rm_f([init_marker, business_marker])
      environment = {
        'JOBS_POD_INSTALL_INTERACTION' => nil, 'JOBS_POD_INSTALL_HOOK' => nil,
        'JOBS_SKIP_README' => nil, 'JOBS_FLUTTER_AUTO_SETUP' => nil,
        'NO_COLOR' => '1', 'TEST_INIT_MARKER' => init_marker,
        'TEST_BUSINESS_MARKER' => business_marker
      }.merge(additions)
      if terminal_answer
        output, status = run_with_terminal(environment, driver, terminal_answer)
      else
        output, process = Open3.capture2e(environment, '/bin/zsh', '-f', driver, stdin_data: '')
        status = process.exitstatus
      end
      unless status == expected_status && File.exist?(init_marker) == expected_business &&
          File.exist?(business_marker) == expected_business
        raise "#{name} #{label} 失败：status=#{status}\n#{output}"
      end
      total += 1
      puts "通过 #{total}：#{name} / #{label}"
    end
  end

  # 运行完整 SPM 入口但把 swift 替换为本地假命令，验证 tee 不吞掉失败。
  spm_root = File.join(fixture_root, 'spm full flow')
  fake_bin = File.join(spm_root, 'bin')
  runtime = File.join(spm_root, 'runtime')
  FileUtils.mkdir_p([File.join(spm_root, 'FixturePackage'), fake_bin, runtime])
  File.write(File.join(spm_root, 'FixturePackage', 'Package.swift'), '// fixture only')
  fake_swift = File.join(fake_bin, 'swift')
  File.write(fake_swift, <<~'SWIFT')
    #!/bin/sh
    printf '%s\n' "$*" >> "$TEST_SWIFT_TRACE"
    case "$*" in
      --version) printf '%s\n' 'Swift fixture'; exit 0 ;;
      'package dump-package') printf '%s\n' '{"products":[{"name" : "JobsSPMDemoClient"}]}'; exit 0 ;;
    esac
    case "$TEST_SWIFT_FAIL:$*" in
      'resolve:package resolve'|'build:build'|'test:test'|'client:run JobsSPMDemoClient'|'reset:package reset')
        printf '%s\n' 'fixture Swift command failed' >&2
        exit 17
        ;;
    esac
    exit 0
  SWIFT
  FileUtils.chmod(0755, fake_swift)
  spm_source = File.read(File.join(scripts_root, '..', 'JobsBySwiftPackageManager', '【MacOS】🧠编译通过方可集成进SPM.command'))
  spm_driver = File.join(spm_root, 'spm_fixture.command')
  File.write(spm_driver, spm_source.sub('LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"', 'LOG_FILE="${TMPDIR%/}/${SCRIPT_BASENAME}.log"'))
  %w[success resolve build test client reset].each do |stage|
    trace = File.join(runtime, "#{stage}.trace")
    environment = {
      'PATH' => "#{fake_bin}:/usr/bin:/bin:/usr/sbin:/sbin",
      'TMPDIR' => runtime, 'NO_COLOR' => '1',
      'JOBS_POD_INSTALL_INTERACTION' => 'interactive',
      'JOBS_SKIP_README' => '1', 'JOBS_POD_INSTALL_HOOK' => '1',
      'TEST_SWIFT_TRACE' => trace, 'TEST_SWIFT_FAIL' => stage,
      'DO_RESET' => stage == 'reset' ? '1' : '0', 'RUN_CLIENT' => '1'
    }
    output, status = run_with_terminal(environment, spm_driver, "\n")
    raise "SPM #{stage} 退出状态不符：#{status}\n#{output}" unless status == (stage == 'success' ? 0 : 1)
    calls = File.read(trace)
    raise 'SPM 成功分支没有验证 Client' if stage == 'success' && !calls.include?('run JobsSPMDemoClient')
    raise 'SPM 构建失败后仍运行测试' if stage == 'build' && calls.lines.include?("test\n")
    total += 1
    puts "通过 #{total}：SPM完整业务假命令 / #{stage}"
  end
end
puts "入口隔离回归完成：#{total} 项通过；未运行真实业务。"

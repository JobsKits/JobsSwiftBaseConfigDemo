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

require 'tmpdir'
require 'fileutils'

# 用途：验证 Podfile 对 Flutter 生成配置、SDK / module 路径及缺失依赖占位分支的判断。
# 运行：在本文件目录执行 ruby ./podfile_readiness.rb；加 --verify-project 则只读检查本工程真实配置、registrant 与 iOS engine。
# 边界：默认使用临时夹具，不加载 CocoaPods 或真实 SDK；两种模式均不安装依赖、不构建 App。

podfile_path = File.expand_path('../../../../Podfile', __dir__)
source = File.read(podfile_path)
start = source.index('def jobs_flutter_generated_xcconfig_path(')
finish = source.index('def jobs_write_flutter_placeholder_podhelper')
abort '未找到 Podfile 生成配置检查方法' unless start && finish && finish > start
checker = Object.new
checker.instance_eval(source[start...finish], podfile_path, source[0...start].count("\n") + 1)

# CI 必须准备真实 Flutter 依赖，不能把内存占位接口当作安装成功。
if ARGV == ['--verify-project']
  module_path = File.expand_path('my_flutter', File.dirname(podfile_path))
  abort 'Flutter module 生成配置未通过当前机器健康检查' unless checker.jobs_flutter_podhelper_ready?(module_path)
  registrant_spec = File.join(module_path, '.ios', 'Flutter', 'FlutterPluginRegistrant', 'FlutterPluginRegistrant.podspec')
  abort "FlutterPluginRegistrant podspec 缺失：#{registrant_spec}" unless File.file?(registrant_spec)
  sdk = checker.jobs_flutter_root_from_generated_xcconfig(module_path)
  engine = File.join(sdk, 'bin', 'cache', 'artifacts', 'engine', 'ios', 'Flutter.xcframework')
  abort "Flutter iOS engine 缓存缺失：#{engine}" unless File.file?(File.join(engine, 'Info.plist'))
  puts 'Flutter Pods ready: current SDK/module paths, plugin registrant and iOS engine verified.'
  exit
end
abort '用法：ruby podfile_readiness.rb [--verify-project]' unless ARGV.empty?

checks = 0

Dir.mktmpdir('jobs-flutter-podfile-readiness-') do |root|
  module_path = File.join(root, 'copied project', 'my_flutter')
  sdk = File.join(root, 'local sdk')
  flutter_dir = File.join(module_path, '.ios', 'Flutter')
  helper = File.join(flutter_dir, 'podhelper.rb')
  sdk_helper = File.join(sdk, 'packages', 'flutter_tools', 'bin', 'podhelper.rb')
  FileUtils.mkdir_p(File.dirname(sdk_helper))
  FileUtils.mkdir_p(flutter_dir)
  File.write(helper, '# fixture')
  File.write(sdk_helper, '# fixture')

  write_config = lambda do |configured_sdk = sdk, configured_app = module_path, exported_sdk = configured_sdk, exported_app = configured_app|
    File.write(File.join(flutter_dir, 'Generated.xcconfig'),
               "FLUTTER_ROOT=#{configured_sdk}\nFLUTTER_APPLICATION_PATH=#{configured_app}\n")
    File.write(File.join(flutter_dir, 'flutter_export_environment.sh'),
               "export \"FLUTTER_ROOT=#{exported_sdk}\"\nexport \"FLUTTER_APPLICATION_PATH=#{exported_app}\"\n")
  end
  verify = lambda do |name, expected|
    result = checker.jobs_flutter_podhelper_ready?(module_path)
    abort "FAIL #{name}: #{result.inspect}" unless result == expected
    checks += 1
    puts "PASS #{name}"
  end

  write_config.call
  verify.call('本机完整配置', true)
  write_config.call(File.join(root, 'old-user', 'missing-sdk'))
  verify.call('拒绝另一电脑的失效 SDK 路径', false)
  old_module = File.join(root, 'previous checkout', 'my_flutter')
  FileUtils.mkdir_p(old_module)
  write_config.call(sdk, old_module)
  verify.call('旧工程目录仍存在也必须拒绝', false)
  write_config.call(sdk, module_path, File.join(root, 'missing-export-sdk'))
  verify.call('拒绝仅导出脚本残留的 SDK 路径', false)
  write_config.call(sdk, module_path, sdk, old_module)
  verify.call('拒绝导出脚本的旧工程路径', false)
  write_config.call
  File.unlink(File.join(flutter_dir, 'flutter_export_environment.sh'))
  verify.call('拒绝缺少构建导出配置', false)
  write_config.call
  File.unlink(helper)
  verify.call('拒绝仅有配置没有 module helper', false)
  File.write(helper, '# fixture')
  alias_path = File.join(root, 'module symlink')
  File.symlink(module_path, alias_path)
  write_config.call(sdk, alias_path, sdk, alias_path)
  verify.call('同一 module 的符号链接正常通过', true)
  write_config.call
  File.open(File.join(flutter_dir, 'Generated.xcconfig'), 'a') { |file| file.puts("FLUTTER_ROOT=#{sdk}") }
  verify.call('拒绝重复的 SDK 配置键', false)
  write_config.call
  File.open(File.join(flutter_dir, 'flutter_export_environment.sh'), 'a') { |file| file.puts("export \"FLUTTER_ROOT=#{sdk}\"") }
  verify.call('拒绝重复的导出环境键', false)

  fallback_start = source.index('def jobs_write_flutter_placeholder_podhelper')
  fallback_end = source.index('# 按用户选择执行 SPM 编译门禁', fallback_start)
  abort '未找到 Podfile 内存占位与加载方法' unless fallback_start && fallback_end
  checker.instance_eval(source[fallback_start...fallback_end], podfile_path, source[0...fallback_start].count("\n") + 1)
  write_config.call
  File.write(helper, '$jobs_fixture_flutter_helper_loaded = true')
  $jobs_fixture_flutter_helper_loaded = false
  abort '健康真实 helper 未正常加载' unless checker.jobs_load_flutter_podhelper(module_path) && $jobs_fixture_flutter_helper_loaded
  checks += 1
  puts 'PASS 健康真实 helper 仍按路径加载'

  # 阻止任何 File.write，确保缺失配置在查询与跳过模式下只声明内存接口。
  original_write = File.method(:write)
  File.define_singleton_method(:write) { |*args| raise '只读占位分支不得写入文件' }
  begin
    %w[check-only skip query].each do |mode|
      if mode == 'query'
        ENV.delete('JOBS_POD_INSTALL_INTERACTION')
        $PROGRAM_NAME = 'pod'
        ARGV.replace(['ipc', 'podfile-json'])
      else
        ENV['JOBS_POD_INSTALL_INTERACTION'] = mode
      end
      abort "#{mode} 内存占位加载失败" unless checker.jobs_load_flutter_podhelper(File.join(root, 'missing module'))
      abort '占位 install_all_flutter_pods 接口缺失' unless Object.private_method_defined?(:install_all_flutter_pods)
      abort '占位 flutter_post_install 接口缺失' unless Object.private_method_defined?(:flutter_post_install)
      Object.new.send(:install_all_flutter_pods, 'fixture module')
      Object.new.send(:flutter_post_install, Object.new, skip: true)
      checks += 1
      puts "PASS #{mode} 缺失配置只使用内存占位且保留接口"
    end
  ensure
    File.define_singleton_method(:write, original_write)
    ENV.delete('JOBS_POD_INSTALL_INTERACTION')
  end
end

puts "#{checks} checks passed; no Flutter, CocoaPods or project generation executed."

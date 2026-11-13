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
require 'tmpdir'
require 'fileutils'
require 'rbconfig'
require 'rexml/document'
require 'digest'

# 用途：隔离验证 validate_builds.rb 的批量成员、命令、成功证据及失败或中断处理。
# 运行：在本文件目录执行 ruby ./validate_builds_test.rb。
# 边界：工程和工具均为临时夹具，不真正编译、不改已安装的 Pods 工程；不替代真实构建门禁。

SOURCE = File.expand_path('validate_builds.rb', __dir__)
POD_NAMES = (0...63).map { |index| format('Pod%03d', index) } + ['JobsAppIconRibbon']

def assert(condition, message)
  raise message unless condition
  $assertions += 1
end

def fixture(directory, names = POD_NAMES)
  root = File.join(directory, 'repository & fixtures')
  script = File.join(root, '.github/tests/JobsPodsUpgrade/validate_builds.rb')
  FileUtils.mkdir_p(File.dirname(script))
  FileUtils.cp(SOURCE, script)
  objects = {
    'PROJECT' => { 'isa' => 'PBXProject', 'targets' => [] },
    'CONFIGS' => { 'buildConfigurations' => ['DEBUG', 'RELEASE'] },
    'DEBUG' => { 'name' => 'Debug' }, 'RELEASE' => { 'name' => 'Release' }
  }
  names.each_with_index do |name, index|
    spec = File.join(root, 'JobsByPods', "#{name}@Pods", "#{name}.podspec")
    FileUtils.mkdir_p(File.dirname(spec))
    File.write(spec, "Pod::Spec.new { |s| s.name = '#{name}' }\n")
    uuid = format('TARGET%04d', index)
    objects['PROJECT']['targets'] << uuid
    target = { 'isa' => name == 'JobsAppIconRibbon' ? 'PBXAggregateTarget' : 'PBXNativeTarget',
               'name' => name, 'buildConfigurationList' => 'CONFIGS' }
    unless name == 'JobsAppIconRibbon'
      target['productType'] = 'com.apple.product-type.framework'
      target['productReference'] = "PRODUCT#{index}"
      objects["PRODUCT#{index}"] = { 'path' => "#{name}-actual.framework" }
    end
    objects[uuid] = target
  end
  # An unrelated installed target must not expand the owned roots selected for the Scheme.
  objects['PROJECT']['targets'] << 'VENDOR'
  objects['VENDOR'] = { 'isa' => 'PBXNativeTarget', 'name' => 'VendorUnused' }
  project = File.join(root, 'Pods/Pods.xcodeproj/project.pbxproj')
  FileUtils.mkdir_p(File.dirname(project))
  File.write(project, JSON.generate('rootObject' => 'PROJECT', 'objects' => objects))
  File.write(File.join(root, 'names.json'), JSON.generate(names))
  bin = File.join(root, 'fake-bin')
  FileUtils.mkdir_p(bin)
  tools = {
    'plutil' => "puts File.read(ARGV.last)\n",
    'xcrun' => <<~'RUBY',
      # Apple Ruby's SDK discovery is not the generator compilation under test.
      exit 0 unless ARGV.first == 'swiftc'
      if ENV['FAKE_GENERATOR_PARENT_INTERRUPT'] == '1'
        Process.kill('INT', Process.ppid)
        sleep 0.05
      end
      exit(ENV['FAKE_GENERATOR_FAILURE'] == '1' ? 66 : 0)
    RUBY
    'xcodebuild' => <<~'RUBY'
      if ARGV.include?('-list')
        puts JSON.generate('project' => { 'schemes' => JSON.parse(File.read('names.json')) })
        exit 0
      end
      case ENV['FAKE_BUILD_OUTCOME']
      when 'failure'
        exit 65
      when 'signal'
        Process.kill('TERM', Process.pid)
      when 'parent-interrupt'
        Process.kill('INT', Process.ppid)
        sleep 0.05
      end
      puts 'Fixture build completed.'
    RUBY
  }
  tools.each do |tool, body|
    path = File.join(bin, tool)
    # Apple Ruby 的 Gem 初始化会调用 xcrun；禁用自动加载，避免递归进入假工具。
    File.write(path, "#!#{RbConfig.ruby} --disable-gems\nrequire 'json'\nFile.open(ENV.fetch('FAKE_TRACE'), 'a') { |file| file.puts(JSON.generate(tool: '#{tool}', arguments: ARGV)) }\n#{body}")
    FileUtils.chmod(0755, path)
  end
  root
end

def run_fixture(root, arguments = [], environment = {})
  output = File.join(root, 'validation output')
  trace = File.join(root, 'trace.jsonl')
  File.write(trace, '')
  env = {
    'PATH' => "#{root}/fake-bin:#{ENV.fetch('PATH')}", 'FAKE_TRACE' => trace,
    'RUBYLIB' => $LOAD_PATH.join(File::PATH_SEPARATOR)
  }.merge(environment)
  stdout, stderr, status = Open3.capture3(env, RbConfig.ruby, '--disable-gems',
    File.join(root, '.github/tests/JobsPodsUpgrade/validate_builds.rb'),
    '--output-dir', output, '--derived-data', File.join(root, 'Shared DerivedData'), *arguments,
    chdir: root)
  result = JSON.parse(File.read(File.join(output, 'results.json')))
  calls = File.readlines(trace).map { |line| JSON.parse(line) }
  [result, calls, status, stdout + stderr]
end

def builds(calls)
  calls.select { |call| call['tool'] == 'xcodebuild' && call['arguments'].last == 'build' }
end

def generators(calls)
  calls.select { |call| call['tool'] == 'xcrun' && call['arguments'].first == 'swiftc' }
end

def change_project(root)
  path = File.join(root, 'Pods/Pods.xcodeproj/project.pbxproj')
  project = JSON.parse(File.read(path))
  yield project.fetch('objects')
  File.write(path, JSON.generate(project))
end

$assertions = 0
Dir.mktmpdir('JobsOwnedPodsBatch-') do |temporary|
  root = fixture(File.join(temporary, 'all'))
  project = File.join(root, 'Pods/Pods.xcodeproj/project.pbxproj')
  original = Digest::SHA256.file(project).hexdigest
  result, calls, status, log = run_fixture(root, ['--batch-pods', '--skip-host'])
  assert(status.success?, "Batch failed: #{log}")
  assert(builds(calls).length == 1, 'All 64 owned roots must share exactly one Xcode build')
  assert(result['units'].length == 64 && result['units'].all? { |unit| unit['success'] }, 'Lost owned target coverage')
  assert(result['units'].all? { |unit| unit['seconds'].nil? && unit['batch'] == 'OwnedPodsBatch' }, 'Members must reference shared timing/evidence')
  assert(result['batch']['exit_code'] == 0 && result['batch']['status'] == 'passed', 'Missing completed batch evidence')
  assert(result['batch']['members'].count { |member| member['type'] == 'PBXAggregateTarget' } == 1, 'Aggregate Pod was excluded')
  assert(generators(calls).length == 1, 'AppIconRibbon generator must still be compiled')
  scheme = REXML::Document.new(File.read(result['batch']['scheme_path']))
  references = REXML::XPath.match(scheme, '//BuildableReference')
  assert(references.map { |reference| reference.attributes['BlueprintName'] }.sort == POD_NAMES.sort, 'Scheme roots must match selected owned Pods exactly')
  references.each do |reference|
    name = reference.attributes['BlueprintName']
    assert(reference.attributes['BlueprintIdentifier'] == format('TARGET%04d', POD_NAMES.index(name)), "Wrong real target UUID for #{name}")
    assert(reference.attributes['ReferencedContainer'] == "container:#{File.realpath(File.dirname(project))}", 'Pods project reference must be absolute and XML-safe')
  end
  assert(references.find { |reference| reference.attributes['BlueprintName'] == 'Pod001' }.attributes['BuildableName'] == 'Pod001-actual.framework', 'Use actual product references instead of inferred names')
  workspace = REXML::Document.new(File.read(File.join(result['batch']['workspace'], 'contents.xcworkspacedata')))
  assert(workspace.root.elements['FileRef'].attributes['location'] == "absolute:#{File.realpath(File.dirname(project))}", 'Workspace must refer to existing project')
  assert(Digest::SHA256.file(project).hexdigest == original, 'Validation mutated the installed Pods project')
  command = builds(calls).first.fetch('arguments')
  assert(command.count('-scheme') == 1 && command[command.index('-scheme') + 1] == 'JobsOwnedPodsValidation', 'Duplicate or incorrect batch Scheme')
  %w[-workspace -derivedDataPath -destination -configuration -sdk -jobs].each do |flag|
    assert(command.include?(flag), "Lost existing build argument #{flag}")
  end
  %w[ARCHS=arm64 ONLY_ACTIVE_ARCH=YES IPHONEOS_DEPLOYMENT_TARGET=15.6 CODE_SIGNING_ALLOWED=NO].each do |flag|
    assert(command.include?(flag), "Lost existing build setting #{flag}")
  end
  assert(command.any? { |flag| flag.start_with?('SYMROOT=') } && command.any? { |flag| flag.start_with?('OBJROOT=') }, 'Lost shared host output paths')

  root = fixture(File.join(temporary, 'subset'))
  result, calls, status, log = run_fixture(root, ['--batch-pods', '--skip-host', '--pods', 'Pod002,Pod001'])
  assert(status.success?, "Subset batch failed: #{log}")
  assert(result['units'].map { |unit| unit['name'] }.sort == %w[Pod001 Pod002], 'Focused batch expanded or lost roots')
  assert(builds(calls).length == 1 && generators(calls).empty?, 'Focused batch ran extra builds')

  %w[failure signal parent-interrupt].each do |outcome|
    root = fixture(File.join(temporary, outcome))
    result, calls, status, _log = run_fixture(root, ['--batch-pods'], 'FAKE_BUILD_OUTCOME' => outcome)
    assert(!status.success? && result['success'] == false, "#{outcome} incorrectly succeeded")
    assert(result['units'].length == 64 && result['units'].none? { |unit| unit['success'] }, "#{outcome} falsely verified members")
    assert(builds(calls).length == 1 && generators(calls).empty?, "#{outcome} continued to host or generator")
    assert(result['batch']['signal'] == 15, 'Lost child termination evidence') if outcome == 'signal'
  end

  %w[missing duplicate configuration product-type].each do |invalid|
    root = fixture(File.join(temporary, invalid))
    change_project(root) do |objects|
      case invalid
      when 'missing'
        objects['PROJECT']['targets'].delete('TARGET0001')
      when 'duplicate'
        objects['DUPLICATE'] = objects['TARGET0001'].dup
        objects['PROJECT']['targets'] << 'DUPLICATE'
      when 'configuration'
        objects['DEBUG']['name'] = 'Other'
      when 'product-type'
        objects['TARGET0001']['productType'] = 'com.apple.product-type.bundle.unit-test'
      end
    end
    result, calls, status, _log = run_fixture(root, ['--batch-pods', '--skip-host'])
    assert(!status.success? && result['success'] == false, "#{invalid} project incorrectly succeeded")
    assert(builds(calls).empty?, "#{invalid} project started incomplete coverage")
  end

  root = fixture(File.join(temporary, 'generator-failure'))
  result, calls, status, _log = run_fixture(root, ['--batch-pods'], 'FAKE_GENERATOR_FAILURE' => '1')
  assert(!status.success? && result['batch']['success'], 'Generator failure must preserve successful iOS batch evidence but fail validation')
  ribbon = result['units'].find { |unit| unit['name'] == 'JobsAppIconRibbon' }
  assert(!ribbon['success'] && ribbon['generator']['exit_code'] == 66, 'Generator failure was ignored')
  assert(builds(calls).length == 1 && result['host']['skipped'], 'Generator failure must block host validation')

  root = fixture(File.join(temporary, 'generator-interrupt'))
  result, calls, status, _log = run_fixture(root, ['--batch-pods'], 'FAKE_GENERATOR_PARENT_INTERRUPT' => '1')
  assert(!status.success? && !result['success'] && result['batch']['success'], 'Interrupted generator must preserve iOS batch evidence and fail validation')
  ribbon = result['units'].find { |unit| unit['name'] == 'JobsAppIconRibbon' }
  assert(ribbon['success'] == false && ribbon['status'] == 'not_verified', 'Interrupted generator falsely verified Ribbon')
  assert(result['units'].count { |unit| unit['success'] } == 63, 'Generator interruption must preserve the other completed targets')
  assert(builds(calls).length == 1 && result['host'].nil?, 'Interrupted generator must not start host validation')

  root = fixture(File.join(temporary, 'legacy'))
  result, calls, status, log = run_fixture(root, ['--skip-host', '--pods', 'Pod001,Pod002'])
  assert(status.success?, "Default mode regressed: #{log}")
  assert(builds(calls).length == 2 && !result.key?('batch'), 'Default mode must remain one build per selected Pod')
  assert(builds(calls).map { |call| call['arguments'][call['arguments'].index('-scheme') + 1] }.sort == %w[Pod001 Pod002], 'Default focused selection regressed')
end
puts "PASS owned Pod batch validation: #{$assertions} assertions; no real Xcode builds."

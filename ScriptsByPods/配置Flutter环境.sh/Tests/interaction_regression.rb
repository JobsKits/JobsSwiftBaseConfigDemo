#!/usr/bin/env ruby
# 仅提取 Jobs 辅助脚本真实入口，业务函数替换为临时标记；不运行安装、清理、Flutter 或 SwiftPM。
require 'fileutils'
require 'open3'
require 'pty'
require 'timeout'
require 'tmpdir'

abort '用法：ruby interaction_regression.rb --run（只运行隔离夹具）' unless ARGV == ['--run']

scripts_root = File.expand_path('../..', __dir__)
scripts = {
  '配置Flutter环境.sh' => 'run_flutter_environment_setup',
  '拉取Flutter侧三方资源.sh' => 'run_flutter_resource_pull',
  '清理Unity缓存.sh' => 'run_unity_cache_cleanup',
  '解压Unity大资源.sh' => 'run_unity_resource_unpack',
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
    if ['配置Flutter环境.sh', '拉取Flutter侧三方资源.sh'].include?(name)
      cases += [
        ['显式非交互自动配置', {'JOBS_FLUTTER_AUTO_SETUP' => '1'}, nil, 0, true],
        ['check-only优先于显式自动配置', {'JOBS_FLUTTER_AUTO_SETUP' => '1', 'JOBS_POD_INSTALL_INTERACTION' => 'check-only'}, nil, 0, false],
        ['skip优先于显式自动配置', {'JOBS_FLUTTER_AUTO_SETUP' => '1', 'JOBS_POD_INSTALL_INTERACTION' => 'skip'}, nil, 0, false],
        ['自动配置不绕过无效模式', {'JOBS_FLUTTER_AUTO_SETUP' => '1', 'JOBS_POD_INSTALL_INTERACTION' => 'invalid'}, nil, 2, false],
        ['自动配置只接受精确1', {'JOBS_FLUTTER_AUTO_SETUP' => 'true'}, nil, 1, false]
      ]
    end
    if name == '拉取Flutter侧三方资源.sh'
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

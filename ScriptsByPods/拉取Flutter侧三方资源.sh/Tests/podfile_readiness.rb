# frozen_string_literal: true

# 只在临时目录验证 Podfile 的 Flutter 生成配置检查，不加载 CocoaPods 或真实 SDK。
require 'tmpdir'
require 'fileutils'

podfile_path = File.expand_path('../../../Podfile', __dir__)
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

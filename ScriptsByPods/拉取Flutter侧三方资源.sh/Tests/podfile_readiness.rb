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
end

puts "#{checks} checks passed; no Flutter, CocoaPods or project generation executed."

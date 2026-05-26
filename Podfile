# pod install --repo-update
# ================================== Podfile ==================================
ENV['COCOAPODS_DISABLE_STATS'] = 'true'
require 'fileutils'
source 'https://github.com/CocoaPods/Specs.git'
# 关键：恢复这段，避免 Assets.car 重复产物冲突
install! 'cocoapods',
  :deterministic_uuids => false,
  :disable_input_output_paths => true
#  ,:generate_multiple_pod_projects => true # Flutter 和它不兼容，但是又是全局性的，必须注释
# ================================== Jobs Pods Script Runner ==================================
# 统一的构建设置（一次改全工程 & Pods）
JOBS_DEPLOYMENT_TARGET = '15.0'
JOBS_DISABLE_SCRIPT_SANDBOXING = 'NO'
# ⚠️ 与 post_install 保持一致（平台声明用稍高版本没问题，但 post_install 会强制 target 版本）
platform :ios, "#{JOBS_DEPLOYMENT_TARGET}"

# ScriptsByPods 下脚本已升级为“脚本完整文件名/脚本本体”结构；Podfile 统一走解析器兼容新旧路径。
JOBS_SCRIPTS_BY_PODS_DIR = File.expand_path('ScriptsByPods', __dir__)
# 判断当前 iOS 工程是否集成了 Unity（或存在 Unity 导出的工程痕迹）
#
# 命中任一条件即可认为“有 Unity”：
# - ios/.DerivedDataUnity 存在
# - ios 目录下存在 Unity-iPhone.xcodeproj（Unity 导出工程常见）
# - ios 的上级目录（或更深层）存在 Unity 的 ProjectSettings/ProjectVersion.txt
def jobs_unity_integrated?(ios_dir)
  ios_dir = File.expand_path(ios_dir)

  derived = File.join(ios_dir, '.DerivedDataUnity')
  return true if File.directory?(derived)

  return true if Dir.glob(File.join(ios_dir, '**', 'Unity-iPhone.xcodeproj')).any?

  # Unity 项目通常在仓库根目录或子目录，Podfile 通常在 ios/ 或仓库根目录，所以从 ios_dir 的上级目录开始找
  repo_root = File.expand_path('..', ios_dir)
  return true if Dir.glob(File.join(repo_root, '**', 'ProjectSettings', 'ProjectVersion.txt')).any?

  false
end

# 清理 Unity Bee/Tundra / XCBuildData 缓存（机器/用户名切换后经常出现路径残留导致编译失败）
# - 典型报错：tundra.log.json 找不到 / build.db malformed
# - 解决：删掉 .DerivedDataUnity/Build/Intermediates 让它重新生成
def jobs_clean_unity_build_artifacts!(ios_dir)
  ios_dir = File.expand_path(ios_dir)
  derived = File.join(ios_dir, '.DerivedDataUnity')
  intermediates = File.join(derived, 'Build', 'Intermediates')

  return unless File.directory?(intermediates)

  puts "🧹 [Podfile] Clean Unity intermediates: #{intermediates}"
  begin
    FileUtils.rm_rf(intermediates)
    puts "✅ [Podfile] Cleaned: #{intermediates}"
  rescue => e
    puts "⚠️  [Podfile] Failed to clean Unity intermediates: #{e}"
  end
end

# === [ADD] pod install 挂载脚本统一确认（只问一次） ==========================
$jobs_confirm_pod_install_scripts = nil

def jobs_confirm_pod_install_scripts?
  return $jobs_confirm_pod_install_scripts unless $jobs_confirm_pod_install_scripts.nil?

  # 非交互环境（CI）保持默认行为：执行（避免阻塞）
  unless STDIN.tty?
    $jobs_confirm_pod_install_scripts = true
    return true
  end

  puts
  puts "🧩 [Podfile] pod install 检测到挂载脚本："
  puts "    - 直接回车：执行（默认）"
  puts "    - 输入任意字符后回车：跳过"
  print "👉 请选择："
  input = STDIN.gets

  $jobs_confirm_pod_install_scripts = (input.nil? || input.strip.empty?)
end
# ============================================================================

# 统一运行外置脚本（chmod +x / 统一输出 / 统一失败提示）
#
# 用法：
# jobs_run_external_script(
#   'ScriptsByPods/xxx.sh', # 兼容 ScriptsByPods/xxx.sh/xxx.sh
#   desc: 'xxx',
#   log_path: '/tmp/xxx.log',
#   required: false,
#   condition: -> { true }
# )

# 解析 ScriptsByPods 新目录结构：
# - 旧结构：ScriptsByPods/xxx.sh
# - 新结构：ScriptsByPods/xxx.sh/xxx.sh
# 这样 Podfile 调用方仍传旧式相对路径，真正执行时自动落到同名文件夹里的脚本本体。
def jobs_resolve_external_script_path(rel_path, base_dir: __dir__)
  direct_path = File.expand_path(rel_path, base_dir)
  return direct_path if File.file?(direct_path)

  wrapped_path = File.join(File.dirname(direct_path), File.basename(direct_path), File.basename(direct_path))
  return wrapped_path if File.file?(wrapped_path)

  direct_path
end

# 按脚本 shebang 选择解释器，避免新版 zsh 脚本被 bash 强行执行。
def jobs_external_script_command(script_path)
  first_line = ''

  begin
    File.open(script_path, 'r:utf-8') { |file| first_line = file.readline.to_s.strip }
  rescue
    first_line = ''
  end

  return ['/bin/zsh', script_path] if first_line.include?('zsh') || File.extname(script_path) == '.command'
  return ['/bin/bash', script_path] if first_line.include?('bash')

  [script_path]
end

def jobs_run_external_script(rel_path, desc:, base_dir: __dir__, log_path: nil, required: false, condition: nil)
  # === [MOD] 在脚本真正执行前统一拦截：回车执行 / 任意字符跳过 ==========
  unless jobs_confirm_pod_install_scripts?
    puts "⏭️  [Podfile] Skip script: #{desc}"
    return false
  end
  # ========================================================================

  requested_script = File.expand_path(rel_path, base_dir)
  script = jobs_resolve_external_script_path(rel_path, base_dir: base_dir)

  if script != requested_script
    puts "📁 [Podfile] Resolved wrapped script: #{script}"
  end

  unless File.file?(script)
    msg = "[Podfile] ❌ 找不到脚本：#{script}（请确认脚本路径是否正确）"
    if required
      raise msg
    else
      puts "⚠️  #{msg}，已跳过（required=false）"
      return false
    end
  end

  if condition && !condition.call
    puts "ℹ️  [Podfile] Skip: #{desc}（条件不满足）"
    return false
  end

  puts "🔧 [Podfile] #{desc}"
  puts "🔧 [Podfile] chmod +x: #{script}"
  system('chmod', '+x', script) || raise("[Podfile] ❌ chmod 失败：#{script}")

  command = jobs_external_script_command(script)
  puts "🔧 [Podfile] Run: JOBS_SKIP_README=1 #{command.join(' ')}"
  ok = system({ 'JOBS_SKIP_README' => '1' }, *command, chdir: base_dir)

  if ok
    puts "✅ [Podfile] Done: #{desc}"
    puts "🧾 [Podfile] Log: #{log_path}" if log_path
    true
  else
    msg = "[Podfile] ⚠️ #{desc} 执行失败（non-blocking）。请查看日志：#{log_path || '脚本自身日志'}"
    if required
      raise msg
    else
      puts msg
      false
    end
  end
end


# ===== PodspecDependencyReport: pod install 后自动生成 Podspec 依赖分析报告 =====
# 路径：项目根目录/ScriptsByPods/【MacOS】🔍查询Xcode工程依赖关系.command/【MacOS】🔍查询Xcode工程依赖关系.command
# 风格与 OC 项目一致：先 chmod +x，再直接执行脚本；脚本工作目录为项目根目录。
def run_podspec_dependency_report_script
  script_path = jobs_resolve_external_script_path(
    File.join('ScriptsByPods', '【MacOS】🔍查询Xcode工程依赖关系.command'),
    base_dir: __dir__
  )

  unless File.file?(script_path)
    raise "[PodspecDependencyReport] ❌ 找不到脚本：#{script_path}"
  end

  Pod::UI.puts "[PodspecDependencyReport] chmod +x #{script_path}"
  unless system('/bin/chmod', '+x', script_path)
    raise "[PodspecDependencyReport] ❌ chmod +x 执行失败：#{script_path}"
  end

  command = jobs_external_script_command(script_path)
  Pod::UI.puts "[PodspecDependencyReport] 执行 JOBS_SKIP_README=1 #{command.join(' ')}"
  unless system({ 'JOBS_SKIP_README' => '1' }, *command, chdir: __dir__)
    raise "[PodspecDependencyReport] ❌ 脚本执行失败：#{script_path}"
  end

  Pod::UI.puts "[PodspecDependencyReport] ✅ 依赖关系报告已生成"
end

# ===== CodeGraph: pod install 完成后按需生成 CodeGraph 索引 =====
def run_codegraph_init_script
  script_path = jobs_resolve_external_script_path(
    File.join('ScriptsByPods', 'codegraph_init.command'),
    base_dir: __dir__
  )

  unless File.file?(script_path)
    Pod::UI.puts "[CodeGraph] skip, script not found: #{script_path}" if defined?(Pod::UI)
    return
  end

  Pod::UI.puts "[CodeGraph] chmod +x #{script_path}"
  unless system('/bin/chmod', '+x', script_path)
    Pod::UI.puts "[CodeGraph] ⚠️ chmod +x 执行失败，已跳过：#{script_path}" if defined?(Pod::UI)
    return
  end

  Pod::UI.puts "[CodeGraph] pod install 已进入收尾阶段，准备按需生成 CodeGraph"
  unless system(script_path, chdir: __dir__)
    Pod::UI.puts "[CodeGraph] ⚠️ CodeGraph 脚本执行失败或被中断；pod install 主流程已完成" if defined?(Pod::UI)
  end
end

# 统一写入 build settings（对某个 target 的所有 config）
def jobs_apply_build_settings!(target, settings)
  target.build_configurations.each do |config|
    settings.each { |k, v| config.build_settings[k] = v }
  end
end

# 给宿主工程（App/Unity 导出的 user project）写入设置
def jobs_patch_user_projects!(installer)
  installer.aggregate_targets.each do |agg|
    next unless (user_project = agg.user_project)

    user_project.native_targets.each do |t|
      jobs_apply_build_settings!(
        t,
        {
          'ENABLE_USER_SCRIPT_SANDBOXING' => JOBS_DISABLE_SCRIPT_SANDBOXING,
          'IPHONEOS_DEPLOYMENT_TARGET'    => JOBS_DEPLOYMENT_TARGET
        }
      )
    end

    user_project.save
  end
end

# 给 Pods 工程写入设置
def jobs_patch_pods_project!(installer)
  pods_project = installer.pods_project
  pods_project.targets.each do |t|
    jobs_apply_build_settings!(
      t,
      {
        # macOS 15 以后权限更严格；使用 CocoaPods 集成时常需要关闭脚本沙盒
        'ENABLE_USER_SCRIPT_SANDBOXING' => JOBS_DISABLE_SCRIPT_SANDBOXING,
        'IPHONEOS_DEPLOYMENT_TARGET'    => JOBS_DEPLOYMENT_TARGET
      }
    )
  end
  pods_project.save
end

# 在 Pods 分组里展示 Podfile.deps（方便改依赖/支持 Ruby 高亮）
def jobs_show_deps_file_in_pods_group!(installer)
  pods_project = installer.pods_project
  main_group   = pods_project.main_group
  deps_relpath = '../Podfile.deps'

  file_ref = main_group.find_file_by_path(deps_relpath) || main_group.new_file(deps_relpath)
  file_ref.explicit_file_type = 'text.script.ruby' if file_ref.respond_to?(:explicit_file_type=)
  pods_project.save
end

use_frameworks! :linkage => :static
inhibit_all_warnings!

# ================================== Flutter Module ==================================
# 说明：pod install 需要依赖 Flutter 生成的 .ios/Flutter/podhelper.rb。
# 有些工程在首次 checkout 或清缓存后会缺这个文件，需要先进入 Flutter module 执行 flutter pub get。
FLUTTER_APPLICATION_PATH = File.expand_path('./my_flutter', __dir__)

# 每次 pod install 都先确保 Flutter 环境（Homebrew + FVM + Flutter SDK + flutter pub get）
jobs_run_external_script(
  'ScriptsByPods/配置Flutter环境.sh',
  desc: 'Prepare Flutter environment (brew + fvm + flutter pub get)',
  base_dir: __dir__,
  log_path: '/tmp/配置Flutter环境.log',
  required: false
)

flutter_podhelper = File.join(FLUTTER_APPLICATION_PATH, '.ios', 'Flutter', 'podhelper.rb')

unless File.exist?(flutter_podhelper)
  # 你上传的脚本：遍历工程找到 Flutter 目录，执行 flutter pub get，生成 podhelper.rb
  jobs_run_external_script(
    'ScriptsByPods/拉取Flutter侧三方资源.sh',
    desc: 'Ensure Flutter podhelper.rb (flutter pub get)',
    base_dir: __dir__,
    log_path: '/tmp/拉取Flutter侧三方资源.log',
    required: false
  )
end

unless File.exist?(flutter_podhelper)
  # 兜底：不阻塞 pod install。写一个最小 podhelper.rb，让 Podfile.deps 的 load / install_all_flutter_pods 不报错
  puts "⚠️  [Podfile] 仍然找不到 #{flutter_podhelper}（将创建占位文件，跳过 Flutter Pods 集成；pod install 主流程不受影响）"
  begin
    FileUtils.mkdir_p(File.dirname(flutter_podhelper))
    File.write(
      flutter_podhelper,
      <<~'RUBY'
        # Auto-generated placeholder podhelper.rb (non-blocking)
        def install_all_flutter_pods(flutter_application_path)
          puts "⚠️  [podhelper.rb] Placeholder: skip install_all_flutter_pods(#{flutter_application_path})"
        end

        def flutter_post_install(installer)
          # no-op
        end
      RUBY
    )
  rescue => e
    puts "⚠️  [Podfile] 创建占位 podhelper.rb 失败：#{e}"
  end
end

load flutter_podhelper

# 预留钩子，给 Podfile.deps 调用
def cocoPodsConfig
  # 按需扩展
end

# 加载拆分出来的依赖定义（相对路径；缺失时不阻塞 pod install）
deps_candidates = [
  File.join(__dir__, 'Podfile.deps'),
  File.join(__dir__, 'Podfile.deps.rb'),
]
deps_path = deps_candidates.find { |p| File.exist?(p) }
if deps_path
  puts "📦 [Podfile] Load: #{deps_path}"
  # 用 instance_eval 保持原有 DSL 兼容；并且不依赖 $LOAD_PATH
  instance_eval(File.read(deps_path), deps_path, 1)
else
  puts "⚠️  [Podfile] 找不到 Podfile.deps / Podfile.deps.rb（将跳过依赖定义加载；请确认文件已在工程根目录）"
end

# pre_install：修复 Unity Bee/Tundra 缓存路径问题（否则此工程项目代码迁移到其他机器会无法编译通过）
# 官方给的 workaround 就是删掉 Library/Il2cppBuildCache（Unity 2022.1+ 已修，Unity 2021 系列不打算修）
pre_install do |installer|
  jobs_clean_unity_build_artifacts!(__dir__) if jobs_unity_integrated?(__dir__)

  jobs_run_external_script(
    'ScriptsByPods/清理Unity缓存.sh',
    desc: 'Clean Unity cache (optional)',
    base_dir: __dir__,
    log_path: '/tmp/清理Unity缓存.log',
    required: false,
    # 安全保护：没有 Unity（或不是 Unity 导出工程）就跳过
    condition: -> { jobs_unity_integrated?(__dir__) }
  )

  jobs_run_external_script(
    'ScriptsByPods/解压Unity大资源.sh',
    desc: 'Unpack Unity large resources (optional)',
    base_dir: __dir__,
    log_path: '/tmp/解压Unity大资源.log',
    required: false,
    # 安全保护：没有 Unity（或不是 Unity 导出工程）就跳过
    condition: -> { jobs_unity_integrated?(__dir__) }
  )
end

post_install do |installer|
  flutter_post_install(installer) if defined?(flutter_post_install)

  # -------- 1、统一工程 build settings（宿主工程 + Pods） --------
  jobs_patch_user_projects!(installer)
  jobs_patch_pods_project!(installer)

  # -------- 2、在 Pods 分组里展示 Podfile.deps（Ruby 高亮） --------
  jobs_show_deps_file_in_pods_group!(installer)

  # -------- 3、pod install 完成后生成 Podspec 依赖分析报告 --------
  run_podspec_dependency_report_script
end

post_integrate do |_installer|
  run_codegraph_init_script
end

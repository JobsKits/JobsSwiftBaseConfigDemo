# `ScriptsByPods`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

* 此目录存放用于[**CocoaPods**](https://cocoapods.org/)的脚本文件，包含 `pod install` 钩子辅助脚本与 [Xcode 手动依赖安装入口](<./【MacOS@Xcode】🫘打开终端运行Pod Install.command/README.md>)。

* 值得注意的是，运行脚本文件需要的授权操作，进一步放在了执行`pod install`期间

* 自动脚本以 `Podfile` 中的实际调用配置为准；手动入口在 Xcode Behaviors 中按需运行，终端回车确认后执行，不加入安装钩子或构建流程。

  ```ruby
  # ================================== pre_install：修 Unity Bee/Tundra 缓存路径问题 ==================================
  pre_install do |installer|
    script = File.expand_path('ScriptsByPods/fix_unity_bee_cache.sh', __dir__)
  
    unless File.exist?(script)
      raise "[Podfile] ❌ 找不到修复脚本：#{script}（请确认脚本在 ScriptsByPods/ 目录下）"
    end
  
    puts "🔧 [Podfile] chmod +x: #{script}"
    system('chmod', '+x', script) || raise("[Podfile] ❌ chmod 失败：#{script}")
  
    puts "🔧 [Podfile] Run: #{script}"
    ok = system('bash', script)
    raise "[Podfile] ❌ 修复脚本执行失败，请查看日志：$TMPDIR/fix_unity_bee_cache.log" unless ok
  end
  ```

  

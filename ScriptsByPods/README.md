# `ScriptsByPods`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

* 此目录存放用于[**Cocopods**](https://cocoapods.org/)的脚本文件，当运行`pod install`的时候，顺带启动，以达到最小成本的配置的效果

* 值得注意的是，运行脚本文件需要的授权操作，进一步放在了执行`pod install`期间

* 此文件夹管理的脚本文件和`Podfile`中的相关配置一一对应

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

  

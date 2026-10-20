# `ScriptsByPods`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

暂无章节。

</details>
<!-- jobs-toc:end -->

---

* 此目录存放用于[**CocoaPods**](https://cocoapods.org/)的脚本文件，包含 `pod install` 钩子辅助脚本与 [Xcode 手动依赖安装入口](<./【MacOS@Xcode】🫘打开终端运行Pod Install.command/README.md>)。

* 值得注意的是，运行脚本文件需要的授权操作，进一步放在了执行`pod install`期间

* 自动脚本以 `Podfile` 中的实际调用配置为准；手动入口在 Xcode Behaviors 中按需运行，终端回车确认后执行，不加入安装钩子或构建流程。

* [Pod Install 本地脚本保护](<./【MacOS】📦Pod Install离线保护.command/README.md>)在前置阶段只离线生成依赖报告；成功进入 `post_integrate` 后检查 PIF，再后台调用 [CodeGraph 初始化脚本](./codegraph_init.command/README.md)，完整体检工具链并更新 `.codegraph` 索引和 Markdown。Homebrew 没有该官方 CodeGraph 对应 formula，缺失 / 损坏的 Node/npm 优先通过 Brew 的 `node@24` 补齐，CLI 使用官方 npm 包 `@colbymchenry/codegraph` 与用户独立前缀；已有健康 CLI 不升级。`JOBS_SKIP_CODEGRAPH=1` 跳过，显式离线或 `CODEGRAPH_ALLOW_INSTALL=0` 禁止工具安装。日志为系统临时目录中按工程摘要隔离的 `codegraph_init.<工程摘要>.async.log`；工程锁控制并发，失败不阻断安装，主流程不等待索引和导出。

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

  

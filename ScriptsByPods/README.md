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

* 每份自维护脚本均放在与完整文件名一致的目录内，包含真实脚本和对应 `README.md`。系统 Shell 入口使用 `【MacOS】`；挂载 Xcode Behavior 的入口使用 `【MacOS@Xcode】`；Ruby 辅助与测试脚本保留 `.rb` 原名，不添加系统前缀。复制时保留整个 `ScriptsByPods`，以携带全部相对依赖。

* [Swift Pod Stability 测试](./jobs_swift_pods_tests.rb/README.md)读取已安装的 64 个独立测试 target，在临时 workspace 中执行 Debug XCTest 并保存官方结果与日志；可全量、按 Pod 定向或仅审计。仅手动或 CI 显式运行，不挂载到依赖安装与普通 App 编译。

* 此目录存放用于 [**CocoaPods**](https://cocoapods.org/) 的安装辅助脚本，以及手动调用的 [Xcode 当前工程通用入口](<./【MacOS@Xcode】🫘当前工程Pod Install.command/README.md>)。入口包随本工程复制，使用与其它 iOS 工程相同的通用实现，不依赖外部脚本库。

* 值得注意的是，运行脚本文件需要的授权操作，进一步放在了执行`pod install`期间

* 自动脚本以 `Podfile` 中的实际调用配置为准；本地手动入口在 `Xcode → Behaviors → 🫘当前工程 · Pod Install` 按需运行，核对当前工程后在终端空回车仅执行基础 `pod install`，精确输入大写 `YES` 才按原完整流程运行；其它输入、Ctrl+C 或输入结束（EOF）均取消。基础模式跳过附加探测、报告、CodeGraph、Flutter / Unity / SPM 等可选辅助任务，保留 Podfile 必需的内联工程配置；不加入安装钩子或构建流程。

* 与安装包并列的 [Pod Update 通用入口](<./【MacOS@Xcode】🫘当前工程Pod Update.command/README.md>)用于更新全部依赖：空回车基础 `pod update`，大写 `YES` 保留现有健康检查及 Podfile 对 update 的完整流程；其它输入、EOF 或 Ctrl+C 取消。基础复用四个进程级跳过开关，保留必要依赖声明和工程配置；完整保留用户已有开关与子脚本确认，不强制触发仅限 install 的前置任务。可能更新 `Pods/`、`Podfile.lock` 和工作空间，独立日志为 `jobs-xcode-pod-update.log.*`，保留真实退出码。本机已接入 `Xcode → Behaviors → 🫘当前工程 · Pod Update`，以工程相对路径调用本包；用户级 Behaviors 不随工程分发，换电脑首次按包说明登记。

* [Pod Install 本地脚本保护](<./【MacOS】📦Pod Install离线保护.command/README.md>)在完整模式中按各自提示前台同步执行：前置阶段处理依赖报告，`post_integrate` 依次检查 PIF、运行 [CodeGraph 初始化脚本](./【MacOS】codegraph_init.command/README.md)，完整体检工具链并更新 `.codegraph` 索引和 Markdown。Homebrew 没有该官方 CodeGraph 对应 formula，缺失 / 损坏的 Node/npm 优先通过 Brew 的 `node@24` 补齐，CLI 使用官方 npm 包 `@colbymchenry/codegraph` 与用户独立前缀；已有健康 CLI 不升级。`JOBS_SKIP_CODEGRAPH=1` 跳过，显式离线或 `CODEGRAPH_ALLOW_INSTALL=0` 禁止工具安装。日志为系统临时目录中按工程摘要隔离的 `codegraph_init.<工程摘要>.log`；工程锁控制并发，主流程等待辅助任务、索引和导出结束。子任务失败仅告警，不改变 CocoaPods 自身安装结果；基础模式跳过这些可选辅助任务。

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

  

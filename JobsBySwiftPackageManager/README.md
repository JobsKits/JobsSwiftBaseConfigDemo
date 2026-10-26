# `JobsBySwiftPackageManager`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、目录](#jobs-toc-heading-2)
- [二、验证入口](#jobs-toc-heading-3)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

这里保存 `JobsSwiftBaseConfigDemo` 的本地 [**Swift Package Manager**](https://www.swift.org/package-manager/) 综合演示与验证脚本。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

| 路径 | 职责 |
| --- | --- |
| `JobsSPMDemoPackage/` | 可直接被 Xcode 引用、且没有远程依赖的本地 Library Package。 |
| `JobsSPMDemoPackage/MacroDemo/` | 独立承载 `swift-syntax`、Macro、Client 与宏测试。 |
| `SwiftPackageDependence使用指南🧭.md/` | 集成、验证、移除和故障排查文档。 |
| `【MacOS】🧠编译通过方可集成进SPM.command` | 依次执行解析、构建、测试和 Client 演示。 |
| `【MacOS】⏬双击下载swift-syntax.command` | 只为独立 Macro Demo 预解析官方 `swift-syntax`。 |

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、验证入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 独立运行：双击脚本，或在项目根目录执行：

  ```shell
  zsh './JobsBySwiftPackageManager/【MacOS】🧠编译通过方可集成进SPM.command'
  ```

- 默认 `interactive`：脚本每次先展示内置说明并回车确认，`Ctrl+C` 取消；EOF 或无 TTY 在初始化日志和调用 SwiftPM 前停止。`JOBS_SKIP_README`、`JOBS_POD_INSTALL_HOOK` 不代替确认。
- `pod install` 唤起：`pre_install` 单独询问是否执行；直接回车跳过，输入任意字符后回车进入脚本自述确认。查询命令、纯净模式或无 TTY 不自动启动。
- 脚本缺失或用户选择跳过时不影响 `pod install`；一旦选择执行，编译或测试失败会停止集成。
- `JOBS_POD_INSTALL_INTERACTION=check-only` 或 `skip` 只展示说明并跳过全部 SwiftPM 操作，不清空日志、不解析依赖、不构建或测试；其它模式值报错退出。
- 已确认执行时，依次处理普通 Package 与独立 Macro Demo，执行 `swift package resolve`、`swift build`、`swift test`，默认 `RUN_CLIENT=1` 时运行提供 `JobsSPMDemoClient` 的包；`RUN_CLIENT=0` 跳过 Client。默认 `DO_RESET=0` 不清缓存，显式设置 `DO_RESET=1` 才在各包验证前执行 `swift package reset`。
- 日志在 `/tmp/【MacOS】🧠编译通过方可集成进SPM.log`，确认后覆盖；启用 `PIPE_FAIL`，SwiftPM 失败不会被 `tee` 的成功状态掩盖，验证任一包失败即返回非零。
- [隔离回归](../ScriptsByPods/配置Flutter环境.sh/Tests/interaction_regression.rb)覆盖 Flutter、Unity 和本脚本的真实 TTY 回车 / EOF、无 TTY、旧钩子标记及模式优先级，并用假 `swift` 验证正常流程和解析 / 构建 / 测试 / Client / reset 五类失败传播，共 49 项。没有运行真实 SwiftPM 编译：

  ```shell
  ruby './ScriptsByPods/配置Flutter环境.sh/Tests/interaction_regression.rb' --run
  ```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

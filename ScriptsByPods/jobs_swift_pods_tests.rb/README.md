# <span id="前言">Swift Pod Stability 测试入口</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [一、用途](#jobs-toc-heading-1)
- [二、运行](#jobs-toc-heading-2)
- [三、结果与执行边界](#jobs-toc-heading-3)
- [四、入口自身回归](#jobs-toc-heading-4)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">一、用途 <a href="#前言">🔼</a> <a href="#🔚">🔽</a></span><!-- jobs-toc:heading-end -->

运行各本地 Pod 的 `Stability` [**CocoaPods**](https://cocoapods.org/) 测试规格。使用 [**Ruby**](https://www.ruby-lang.org/) 标准库读取安装后的真实 target UUID 和测试产品，在输出目录生成临时 workspace / Scheme，再用 [**Xcode**](https://developer.apple.com/xcode) 先构建测试包、后运行测试。根目录及生成的 Pods 工程不写入额外 Scheme；不启动主 App，不请求硬件权限或远端服务。

64 个源码 Pod 各自提供 `Tests/**/*Tests.swift`；`JobsAppIconRibbon` 是构建工具，没有运行时模块，继续使用既有生成器验证。测试规格最低 iOS 15.6，生产 Pod 的最低版本不变。测试仅使用 Debug，其中内部状态与调试组件通过 `@testable` 或 Debug 接口验证。原有主工程宿主测试及命令行回归保留。

`JobsSwiftTools`、`JobsSwiftAppTools`、`JobsBy3rdTools` 和 `JobsLocalNotification` 会传递链接 [**Flutter**](https://flutter.dev/)。Flutter 的占位 Pod 只负责依赖声明，独立测试没有主 App 的引擎嵌入阶段；这四个测试规格仅为模拟器继承当前 Flutter helper 的 framework 搜索路径作为运行时搜索路径。SDK 路径在安装时按本机环境解析，不在源码中写入用户目录。运行前须已有健康的 Flutter iOS 缓存；真机测试的引擎打包与签名不在此入口的验收范围。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">二、运行 <a href="#前言">🔼</a> <a href="#🔚">🔽</a></span><!-- jobs-toc:heading-end -->

从工程根目录执行依赖安装；只需同步测试 target 时可跳过可选辅助任务：

```shell
JOBS_POD_INSTALL_PURE=1 \
  pod install --no-repo-update
```

安装只生成测试 target，不自动执行测试。先只读核对全部测试 target 和编译源码：

```shell
ruby ScriptsByPods/jobs_swift_pods_tests.rb/jobs_swift_pods_tests.rb \
  --audit-only
```

用 `xcrun simctl list devices available` 查明本机设备 UUID；将下面的 `设备UUID` 替换为可用 iPhone 模拟器：

```shell
ruby ScriptsByPods/jobs_swift_pods_tests.rb/jobs_swift_pods_tests.rb \
  --destination 'platform=iOS Simulator,id=设备UUID'
```

定向验证两个 Pod：

```shell
ruby ScriptsByPods/jobs_swift_pods_tests.rb/jobs_swift_pods_tests.rb \
  --pods JobsSwiftTimer,JobsNetworking \
  --destination 'platform=iOS Simulator,id=设备UUID'
```

可追加 `--output-dir /自选/新目录` 与 `--derived-data /自选/DerivedData`。默认创建系统临时目录，路径随终端输出显示；已有 `results.json` 的输出目录会被拒绝，避免覆盖上轮证据。未知 Pod、未安装 target、空源码或无效目标均返回失败。设备由调用者指定，不自动删除、重置或重启模拟器。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">三、结果与执行边界 <a href="#前言">🔼</a> <a href="#🔚">🔽</a></span><!-- jobs-toc:heading-end -->

| 文件 | 内容 |
| --- | --- |
| `results.json` | 所选 Pod、真实 target UUID、命令、退出状态、耗时、源码指纹、每 Pod 实际测试数与最终结果 |
| `build.log` / `test.log` | `build-for-testing` / `test-without-building` 的独立日志 |
| `Stability.xcresult` | 官方测试结果包 |
| `summary.json` / `tests.json` | 从官方结果包读取的摘要与逐项测试树 |
| `JobsSwiftPodStability.xcworkspace` | 只放所选测试 target 的临时构建入口 |

默认构建期限 1800 秒、测试期限 900 秒；可用 `--build-timeout` / `--test-timeout` 调整。每 30 秒输出心跳；超时停止本次命令的独立进程组并判失败，不结束其它构建。准备失败不运行测试；仅当实际测试非零、各 Pod 均有通过的测试、零失败／跳过／预期失败、源码指纹未变化时才通过。`--audit-only` 只代表安装配置核查通过，不能当成测试通过；子集通过也不代表全量通过。

主进程退出后仍持有输出管道的后代也受限时保护：最多排空 2 秒，再向本次进程组发送 TERM，宽限 1 秒后补发 KILL，最后排空不超过 1 秒；阶段期限更早到达时以阶段期限为准。结果保留主进程的真实退出码、信号、是否回收及终止原因，主进程退出 0 不能掩盖后代超时。

CI 在全部 Pod 编译之后、主 App 宿主测试之前显式调用本入口；失败阻止后续打包。输出目录作为独立 artifact 保存 7 天，原有 UIKit / Timer 主工程测试继续执行。本入口没有挂载到 `pod install` 或普通 App Build，不会增加日常安装时的测试执行。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">四、入口自身回归 <a href="#前言">🔼</a> <a href="#🔚">🔽</a></span><!-- jobs-toc:heading-end -->

进程清理与结果树判断可单独运行[隔离回归](./Tests/run_regression.rb/README.md)，不会调用真实构建或安装：

```shell
ruby ScriptsByPods/jobs_swift_pods_tests.rb/Tests/run_regression.rb/run_regression.rb
```

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>

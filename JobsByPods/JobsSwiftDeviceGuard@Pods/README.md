# JobsSwiftDeviceGuard

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、接入与调用](#integration)
  - [1.1、宿主启动门禁与预留接口](#startup-gate)
  - [1.2、按需检测接口](#on-demand-inspection)
- [二、检测范围与判定](#signals-and-verdicts)
- [三、写探测与清理边界](#write-probe-boundary)
- [四、平台限制与验证](#limitations-and-validation)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

> 用 <u>[**Swift**](https://www.swift.org/)</u> 编写的独立 [**CocoaPods**](https://cocoapods.org/) 本地组件，在 [**iOS**](https://developer.apple.com/ios/) App 运行时收集设备风险信号。它不能阻止安装，也不能保证识别所有越狱。检测结果与业务策略分开，不上传数据、不弹窗、不退出进程。

检测 Pod 核心只输出报告及 `shouldRestrict` 建议，不接管页面。宿主已经接入启动门禁：首次业务初始化前同步检测，默认仅 `report.isJailbroken` 为真时跳过后续启动流程，由 Scene 创建全屏原生拦截页。登录、支付或每次请求没有单独的拦截器；若需限制这些操作，仍须在对应业务入口接入实时判断。

## 一、<span id="integration">接入与调用</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 1.1、<span id="startup-gate">宿主启动门禁与预留接口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

宿主协调器位于 [JobsDeviceLaunchGate](../../JobsSwiftBaseConfigDemo/启动入口/JobsDeviceLaunchGate/JobsDeviceLaunchGate/JobsDeviceLaunchGate.swift)。`AppDelegate.application(_:didFinishLaunchingWithOptions:)` 的第一个启动步骤执行：

```swift
let decision = JobsDeviceLaunchGate.shared.evaluateAtLaunch()
if decision.isDeviceBlocked {
    // 返回成功让系统连接 Scene；不进入后面的业务启动或 super 调用。
    return true
}
```

检测只读、每进程启动只执行一次；协调器冻结完整报告与 `isDeviceBlocked`。被拦 Scene 直接把 `makeBlockedViewController()` 返回的新原生页面设为根控制器，随后返回，不创建正常根页面、开屏、Flutter 引擎或 Flutter 视图。现有生命周期、URL、快捷入口和活动恢复读取同一冻结结果。检测器本身的后续主动调用仍会重新检测，不与启动快照混同。

| 接口 | 当前职责 |
| --- | --- |
| `configureBeforeLaunch(policy:blockedViewControllerFactory:)` | 在首个 `evaluateAtLaunch()` 前配置；首次判定后返回 `false`，不修改已冻结的启动结果。 |
| `evaluateAtLaunch()` / `decision` | 同步判定一次，读取启动报告和 `isDeviceBlocked`。 |
| `allowsBusinessInitialization` | 尚未判定或已被拦截时不允许进入显式业务初始化。 |
| `makeBlockedViewController()` | 每个被拦 Scene 创建独立页面；自定义工厂须返回无业务初始化的原生控制器。 |

默认策略是 `{ $0.isJailbroken }`，不是 `shouldRestrict`：仅 `jailbroken` 拦截，`noIndicators`、`suspicious`、`indeterminate`、`unsupported` 当前继续启动。它们不因此变成安全结论；未来可通过启动前策略接口调整。策略须同步完成纯判定，不重入 `evaluateAtLaunch()`；工厂每次返回新控制器。当前快照不提供持续监控或逐请求拦截，也不能撤销 `didFinishLaunching` 之前系统、动态库加载或父类基础构造阶段已经发生的动作。

### 1.2、<span id="on-demand-inspection">按需检测接口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 最低 iOS 12，Swift 5 语言模式、Swift 5.7+ 编译器，无第三方依赖；`Core` 只依赖 Foundation、Darwin 与 MachO。
- 在宿主依赖清单中逐条声明，再执行项目既有依赖安装流程：

  ```ruby
  pod 'JobsSwiftDeviceGuard', :path => 'JobsByPods/JobsSwiftDeviceGuard@Pods'
  ```

- 异步入口在后台探测，主线程回调；配置是值类型快照，结果不缓存：

  ```swift
  import JobsSwiftDeviceGuard

  let configuration = JobsDeviceGuardConfiguration()
      .bySandboxWriteProbe(false)
      .byMinimumDetectedCategories(2)

  JobsDeviceGuard.inspectAsync(configuration: configuration) { report in
      if report.shouldRestrict {
          // 由宿主展示原因或限制敏感操作；不把未知状态当作安全。
          return
      }
      // 正式业务仍须完成服务端授权。
  }
  ```

- 示例中的 `if` / `return` 只提前结束本次检测回调，不会自动取消已发出的请求或阻断其它位置的业务。`inspectAsync` 回调之外的代码也不会等待检测结果；要限制真实操作，宿主必须在对应业务入口接入判断，将实际操作放在允许继续的分支中，并自行执行拒绝或取消逻辑。
- 同步入口 `inspect(configuration:)` 返回完整报告；`isJailbroken(configuration:)` 仅表示本次是否达到多类命中阈值。禁止用其 `false` 作为“设备安全”的证明，启动门禁已明确按当前约定处理各个 `verdict`；其它敏感业务应按自己的风险策略处理完整结果。
- 当前宿主 Demo 入口位于“系统能力与硬件通信 → 设备越狱风险检测与业务门禁”，提供只读复检、显式沙盒写探测、先复检再演示门禁与完整报告。门禁演示按钮仅将“允许 / 限制”的判定文字显示在报告区域，没有执行真实业务或业务拦截。入口使用主工程打包的 `JobsDeviceGuardShield` 图标，来源和许可见[主工程 README](../../README.md)的“项目配置支持”。

## 二、<span id="signals-and-verdicts">检测范围与判定</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 独立类别 | 当前检查 | 默认状态 |
| --- | --- | --- |
| `fileSystem` | Cydia / Sileo / Zebra、apt / cydia、MobileSubstrate、sshd、`/var/jb` 等特征路径；使用 `access(F_OK)` | 开启 |
| `runtime` | 当前 App 已加载镜像的文件名精确匹配，不遍历设备进程 | 开启 |
| `sandbox` | 在 `/private`、`/private/var/lib` 创建随机独占空文件，然后关闭、删除 | 关闭 |

同类检测命中多少次都只计算一类；有效阈值为 2…3，越界配置会归一到该范围。路径列表与镜像文件名均可通过配置的 `byFeaturePaths` / `bySuspiciousImageNames` 修改。镜像只匹配完整 basename，不因业务路径包含 `cydia` 等子串而命中。镜像枚举为瞬时观察，动态装卸载可能导致遗漏，不保证进程全生命周期完整性。

| `verdict` | 含义 | `shouldRestrict` 建议值 |
| --- | --- | --- |
| `noIndicators` | 至少执行一项且未命中特征，没有探测不可用项 | `false`，仍不代表设备可信 |
| `suspicious` | 命中至少一类，尚未达到阈值 | `true` |
| `jailbroken` | 命中类别数达到阈值 | `true` |
| `indeterminate` | 零命中但有探测不可用项，或全部检查跳过 | `true` |
| `unsupported` | 模拟器、Mac Catalyst、Mac 上运行的 iOS App 或非 iOS 平台 | `true` |

`shouldRestrict` 是报告上的只读建议值，读取属性不会执行任何限制。表中 `true` 表示保守限制建议；检测 Pod 和 Demo 不执行逐项业务拦截。已接入的宿主启动门禁使用前述 `isJailbroken` 策略，实际启动拦截由宿主协调器和 Scene 执行。

每份报告包含 `evaluatedAt`、`platform`、`minimumDetectedCategories`、`detectedCategories` 和三类 `checks`；每类保留 `passed` / `detected` / `skipped` / `unavailable`、全部命中证据和诊断。`passed` 只表示该次检查正常完成且未见特征。`hasUnavailableChecks` 同时反映探测与清理诊断。

特征路径不存在（`ENOENT` / `ENOTDIR`）属于未见特征；权限拒绝及其它错误记录为不可用。正常 iOS 沙盒可能拒绝访问路径，报告因此成为 `indeterminate`，这不等同越狱。`access` 跟随符号链接，不能识别悬空链接。没有全进程 `sysctl`、`fork`、私有 API、调试附加检测或强退。

## 三、<span id="write-probe-boundary">写探测与清理边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

写探测需显式调用 `.bySandboxWriteProbe(true)`；默认只读，不把 `/private/tmp` 的行为作为无条件越狱证据。每次使用 UUID 随机名称、`O_CREAT | O_EXCL | O_NOFOLLOW` 与 `0600` 权限；只在创建成功后清理本次文件。遇到预存同名文件不会覆盖或删除。

`EACCES` / `EPERM` / `EROFS` 表示写入被拒绝，属于预期沙盒行为；其它错误为不可用。创建成功即记录沙盒证据，即使随后关闭或删除失败也保留证据，并列出错误及可能残留文件的精确路径。组件不删除其它文件、不修改权限。

写入目录固定为组件内的两个受限系统目录，不开放任意目录配置，避免把 App 容器或系统授权目录的正常可写行为当作越狱。自定义路径及镜像规则需自行验证误报率，检测结果不可替代服务端风控。

## 四、<span id="limitations-and-validation">平台限制与验证</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 越狱隐藏、注入 hook 或补丁可以改变本地检测结果；特征路径也可能有残留。应根据业务风险处理可疑与未知，避免把任何一个本地 Bool 当作授权依据。
- 不调用 `stat` / `fstat` / `lstat` 读取文件元数据，不为越狱扫描声明不适用的隐私理由。宿主仍需按实际 API 使用独立审核 [**Apple Required Reason API**](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitype) 与上架要求。
- [**Apple 运行时安全说明**](https://support.apple.com/guide/security/security-of-runtime-process-sec15bfe098e/web)与 [**OWASP 越狱检测**](https://mas.owasp.org/MASTG/knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0084/)用于理解能力和局限，不代表组件获得安全认证。
- 原生回归文件为 [Tests/main.swift](./Tests/main.swift)，不进入 Pod 生产源码；验证类别去重、阈值、未知 / 不支持、镜像精确匹配、真实临时目录创建清理、创建冲突 / 清理失败与主线程回调。测试不会探测真实系统目录写入。在当前 Pod 目录执行：

  ```shell
  swiftc \
    -swift-version 5 \
    Core/*/*.swift \
    Tests/main.swift \
    -o /tmp/jobs-swift-device-guard-regression

  /tmp/jobs-swift-device-guard-regression
  ```
- 普通设备 / 越狱设备的真机误报、漏报与隐私审核需要独立验收；模拟器返回 `unsupported`，不能用模拟器结果宣称真机检测通过。
- 已验证 Core 原生回归、arm64 iOS 12 目标编译与链接，以及宿主 arm64 模拟器完整源码构建。宿主构建使用隔离工程，省略 IPA 清理、源代码生成、源图标生成与计时器阶段；最终 App 已包含 Demo 类、检测 API 符号及 `JobsDeviceGuardShield` 资源。真机越狱检测和页面视觉验收另行进行。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

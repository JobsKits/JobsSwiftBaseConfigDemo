# JobsByPods 升级与编译验收报告

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

实施日期：**2026-10-05，Asia/Shanghai**。本报告承接 [审阅与升级建议报告](./JobsByPods自建Pod审阅与升级建议报告.md)，记录本次实际落地、兼容变化和构建证据。当前验收状态：**已通过：65 个 Pod 单元、完整 Debug / 原生 Release 模拟器工程和全部 27 个 hosted 测试**。

范围是 `JobsByPods/` 中 Jobs 维护的 **65 个实际 Pod**，另有 **2 个空目录**。`ManualBySwiftPods@Pods`、供应商、生成代码和他人作者源码保持维护边界；CocoaPods 工程通过正常安装重新生成。工作区原有修改保留，没有创建提交或推送。

每个实际 Pod 都同步了 README 和生产交付规则。有确认缺陷的模块修复行为；成熟组件保留设计并补充使用合同。构建顺序是 **真实 Pod target → 宿主完整工程 → 宿主 XCTest**，语法检查和 Mock 不替代工程编译。

## 一、验收结论与环境 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

<!-- ACCEPTANCE_START -->
| 门禁 | 当前实际结果 | 证据 |
| --- | --- | --- |
| 65 个实际 Pod 单元 | **65/65 通过**；后续修复模块均重新独立编译 | 第四节逐项最新完成日志 |
| 整工程 Debug | **通过**；最终 Timer 修复后完整构建 exit 0，263.79 秒 | [FinalTimerVerified](</tmp/jobs-pods-upgrade-build/FinalTimerVerified/results.json>) |
| hosted XCTest | **27/27 通过，0 失败、0 跳过**；保留原有 14 项并新增 13 项 | [实际 xcresult 摘要](</tmp/jobs-pods-upgrade-build/hosted-tests-summary.json>) / [运行记录](</tmp/jobs-pods-upgrade-build/hosted-tests-result.json>) |
| Core / WebKit 回归 | **21 条命令、7 组、8 次执行通过** | `/tmp/jobs-pods-core-upgrade-final/` |
| Network 原生回归 | **26 个编译/运行步骤通过** | [FinalNetworkVerified](</tmp/jobs-pods-upgrade-build/FinalNetworkVerified/results.json>) |
| 实际 App 隐私资源 | **17/17 存在，plist 内容与源码相同** | [实际 App 验证](</tmp/jobs-pods-upgrade-build/app-privacy-validation.json>) |
| 原生 Release Simulator 整工程 | **通过**；exit 0，1988.37 秒；内嵌 Flutter Debug | [FinalReleaseVerified](</tmp/jobs-pods-upgrade-build/FinalReleaseVerified/results.json>) |

持久化证据：[最终验收摘要](./.github/tests/JobsPodsUpgrade/Acceptance-2026-10-05.json) 的总状态为 `passed`，记录逐 Pod / 宿主编译历史、原生回归、真实 xcresult 计数、17 个 App 清单及 1020 项生产输入快照与配置散列；[README / Podspec 静态验收](./.github/tests/JobsPodsUpgrade/StaticValidation-2026-10-05.json) 记录 65 份 README、288 个本地链接、17 份源清单及 15 个显式 subspec，其中 12 个声明源码、1 个纯资源、2 个仅依赖入口。最终核对源码及两个测试文件散列无变化，Podfile.lock 与 Pods/Manifest.lock 一致。

完整日志和 xcresult 保留在本机 `/tmp/jobs-pods-upgrade-build/`；仓库保存验收摘要及散列，不打包全部临时构建产物。清理临时目录后，可用本报告中的门禁命令重新验证。

失败历史保留：首次 hosted 编译发现重复 UIApplication 声明；窗口迁移后的宿主复编发现复制的全局窗口函数，随后统一窗口公开入口；第二次 hosted 实际为 25/27 通过，定时器漏 tick 与灰度测试量纲修正后，第三次实跑达到 27/27，通过退出码为 0，没有跳过失败用例。原生 Network 首次冷编译超时的记录同样保留，最终 26 步完整复跑通过。
<!-- ACCEPTANCE_END -->

| 项目 | 本次实际口径 |
| --- | --- |
| 工具链 | [Xcode](https://developer.apple.com/xcode/) 27.0 / [Swift](https://www.swift.org/) 6.4 工具链 / iOS Simulator 27 SDK / [CocoaPods](https://cocoapods.org/) 1.17 |
| 语言模式 | 生产工程保持 Swift 5；只对选定非 UI 核心补了 Swift 6 并发类型检查 |
| 消费环境 | 最低部署目标 15.6、arm64 Simulator、关闭签名；实际测试运行系统为 iOS 27.0；项目依赖 LiveChat 当前版本要求 15.6 |
| Pod 编译 | 64 个集成 Pod 的真实 scheme（63 个 native target、AppIcon script aggregate + 实际 macOS generator 编译）；JobsOCDSL 使用临时独立消费者中的真实 target |
| 编译产物 | DerivedData、逐项日志放在 `/tmp/jobs-pods-upgrade-build/`，避免正常打包阶段清理根目录 `build/` 时丢失证据 |
| Release Simulator | 原生代码 Release，内嵌 Flutter 使用 Debug 模式；本机所用 Flutter 不支持 Simulator Release，不能据此声称完成真机 Flutter Release |

Podspec 中较低的最低系统版本没有因为本机 SDK 限制而批量抬高。上述编译证明当前消费环境可构建；旧系统、动态链接、发布 lint、真机签名及 Unity 真机分发需要对应环境另验。

## 二、已经落实的主要改造 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

### 2.1、正确性与异步终态 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

网络每次执行都有独立身份，令牌登记、取消、重试和异步 continuation 共用一次终态规则。URL query 与 JSON/Form body 独立发送，附件预检失败明确返回错误；文件 URL multipart 不再整文件预读。下载先写同目录临时文件，验证 HTTP 状态、可适用长度和可选 SHA256，再领取提交终态并替换目标，错误响应和错误摘要保留原好文件。缓存键使用实际请求的规范化摘要，磁盘文件名固定；容量、过期、LRU、预算缩小、损坏项和符号链接均有边界处理。

TaskCenter 补齐等待取消、最后事件、异步 action 句柄和终态回收；Worker 的上游不再强持有派生输出，输出释放时解除上游订阅，once/take 和同键调度处理原子性与重入。Picker、倒计时、刷新、Toast、Flutter、验证码和登录提交分别闭合取消、超时、对象释放及旧回调代次，不把可观察失败变成静默成功。

真实 hosted XCTest 发现 Timer 的手动 `fireOnce()` 漏掉 tick，只调用结束回调。修复后先原子提交终态、关闭内核，再在配置队列按 tick → finish 顺序交付一次快照；Manager 先移除登记，快照独立于其后续存活，重复停止不重复交付。原有失败用例保留，重编 Timer、TimerMgr 和宿主后重跑全部测试。颜色回归同时核对了既有 RGB 255 标度：灰度 0.4 对应 102，修正测试量纲，保持生产 API 兼容。

对本轮动作、通知与注入 provider 的锁入口，回调求值、被替换旧 closure / token / 绑定项及自定义 Data 内存的最后释放安排在解锁后，避免捕获对象 deinit 再调用本实例时自锁。TaskCenter 同步动作使用状态锁登记并锁外顺序 drain；忙碌或重入的 executeNow 登记后返回。Snowflake 在锁外采样注入时钟，状态锁内拒绝逆序旧时间，唯一性仍受节点配置与回拨策略约束。Observable.mutate 和自定义 Plan iterator 仍是同步事务内的纯计算，不允许通过它们做跨实例副作用调用。

运行时 Patch 按 Class + SEL 管理稳定 trampoline，继承方法先形成类自身覆盖，安装和回滚串行，拒绝不支持的 ABI/ARC 方法族。Array Builder 移除逃逸的 inout 指针；整数、日期单位、UInt32、Snowflake、Timer 和 Excel 冻结参数在转换与运算前检查边界。Text 去掉不能证明安全的 Sendable 承诺；任意属性对象不因为复制 NSAttributedString 就自动变成可跨 actor 的不可变对象。[Swift Sendable](https://docs.swift.org/latest/documentation/swift/sendable/)、[Swift 并发迁移说明](https://www.swift.org/migration/documentation/swift-6-concurrency-migration-guide/dataracesafety/)

### 2.2、系统、设备与资源边界 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

BLE 加入完整 ready 条件、有界队列、优先级、超时与有限重试、MTU、无响应背压、明确的分块选择及确认等级。用户 decoder/matcher 可以重入，因此回调前后复核连接、命令和 attempt 身份，旧应答不能完成新命令。音频检查系统 prepare/record/play 的真实结果，收口会话所有权、弱委托、中断与媒体重置、结束回调和文件错误。通知模型支持外部配置，提交前验证重复间隔与标识，结果在主队列交付。

现代加密仍使用系统 [CryptoKit](https://developer.apple.com/documentation/cryptokit)；iOS 12 的新 fallback 使用 0x03 CBC Encrypt-then-MAC、独立派生加密/认证密钥，认证头、IV 与密文之后才解密。旧无认证 0x02 只通过显式 legacy API 进入，不再作为安全默认。

WebView 配置在首文档之前真正生效；JS 的 nil、取消和超时有终态。Bridge 限制主 frame 和显式完整 origin，处理转义、页面代次及回调一次性。Markdown 在插入 DOM 前过滤，并使用 CSP/内容规则封锁远程资源；真实 WebKit 对照实验验证禁止模式零 HTTP 请求、允许模式有请求。

图片加载、GIF、Splash 和生成器加入响应校验、尺寸/容量预算、取消、原子发布和坏缓存自愈。Splash 视频继续执行既定的持久待办合同：页面移除不取消，跨启动重试直到成功，受网络与退避条件控制。相册采用 PHPicker 自带权限路径，按选取顺序交付；其 64 MiB 是系统返回 UIImage 后的保留预算，**不保证系统解码单张超大原图的瞬时内存峰值**。

截图保护区分候选能力 `available` 和真实验证 `verified`，迁窗/关闭使验证失效，录屏默认隐藏。没有声称可以阻止所有截图。CrashLogCenter 移除不满足信号安全要求的 Swift POSIX handler，保留系统崩溃处理、正常日志和 NSException 路径；它不提供 SIGKILL/Jetsam 的进程内回调。

PNPlayer 将 GPU、shader、纹理及播放失败暴露为错误，取消资源就绪的强制解包和 fatal 路径；观察者、播放器与 DisplayLink 按代次/弱目标清理，渲染器与实际 MTKView 配置一致，球面网格约束 UInt16 上限。宿主 Demo 同步使用可失败初始化与错误出口。

### 2.3、模块交付与维护门禁 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

65 份 podspec 及显式 subspec 排除 Test/Tests、Demo/Examples、build、DerivedData 和临时源文件。16 个模块新增所用 required reason API 的 PrivacyInfo.xcprivacy，保留 BLE 原有清单；业务采集和跟踪仍由实际应用声明。理由按模块中真实用途记录，空采集数组不代表整 App 没有采集，更不代表已经获得发布审核。[Apple required reason API 说明](https://developer.apple.com/documentation/bundleresources/describing-use-of-required-reason-api)

Networking 与 SwiftTools 的隐私 bundle 放在 Core subspec，显式子模块消费者同样交付；最终验证实际 App 内的清单。SwiftTools 提供 Core / Flutter subspec，默认保留 Core + Flutter，消费方可以显式只引入 Core；Core 的其余 UIKit/工具依赖仍存在，没有声称已变成纯 Foundation 小库。重复依赖清理、Audio / LinkageMenu 的直接依赖、CountryCode 的 Resource 目录和真实资源查找同步。自建模块间依赖图没有循环。

首次 hosted XCTest 编译发现 JobsGetWindow 与 JobsSwiftDSL 都声明了相同的 UIApplication 窗口、顶层控制器和安全区查询。查询统一归 JobsGetWindow，JobsSwiftDSL 增加直接依赖并再导出；图标 DSL 留在原模块。随后宿主复编发现 JobsSwiftBaseTools 中三个同名全局窗口函数，同样统一归 JobsGetWindow，由 BaseTools 直接依赖并再导出。全局入口改用系统 availability 和延迟回退，避免每次同时求值两个系统版本路径。同时核对并收口 JobsByUIKit 复制的 UIWindowScene 查询与已弃用全局入口。测试保留四个模块同时导入和无前缀调用，重新安装 Pods 后复编受影响模块、宿主及全部测试。依赖报告同步新增依赖边，未形成循环。

JobsOCDSL 原交付缺少 helper 和引用的实现目录，本次规范为可编译的兼容入口，保留 Core 名称，公开版本与已交付 category 清单，缺失 category 条件导入。**当前 category 清单为空，没有复原 OC 侧完整 DSL**，也没有把未使用模块加入宿主依赖。两空目录不生成虚构实现。

新增 `.github/tests/JobsPodsUpgrade/` 的原生回归和逐 Pod 编译 runner，并将门禁接入现有 CI：原生回归、逐 Pod、完整宿主、hosted XCTest、失败证据上传。CI 配置本地校验通过，本次没有提交或触发远程流水线。

## 三、兼容迁移说明 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 入口 | 调用方需要知道的变化 |
| --- | --- |
| BRPicker `awaitResult` | 改为 `async throws`，调用加 `try await`；`awaitResultOrNil` 只把取消映射为 nil。原 byResult 保留，新增 Xcode snippet 同步 |
| Crypto 0x02 | 默认解密拒绝；显式 `decryptLegacyCBC` 迁移后用认证格式重新保存；确需旧后端时显式 `encryptLegacyCBC` |
| BLE send | 旧 send 保留；没有应用应答时成功的 Data 为空。需要区别提交/物理 ACK/应用应答用 `sendReliably` receipt |
| Timer `fireOnce()` | 未 start 也可提交一次 tick 后结束；Manager 先移除登记，回调独立交付，终态重复调用无效。已提交的终态快照不能通过后续 stop 撤回 |
| Bridge | 远程页面需配置 `bridgeAllowedOrigins`；本地 file 默认兼容。配置应是完整 scheme/host/port origin |
| WebView 配置 | 首文档之前可能重建 webView，避免长期缓存旧引用；首文档之后配置失败可观察 |
| 主线程组件 | Countdown、MediaPicker、Flutter 等明确 MainActor，后台调用切到主 actor |
| Gesture | 短 pattern 的旧完成回调保留，宿主用 `isValidPattern` / `onInvalidPattern` 决定是否接受；系统 cancelled/failed 不会作为成功 |
| Text / AsyncBox | Text 不承诺任意可变属性跨 actor 安全；AsyncBox 的锁保护一次性交付，不使任意 Value 自动 Sendable |
| Open | 原初始化和展示完成闭包保持；新增显式 pageLoadCompletion 表示网页加载结果，避免把呈现成功等同内容加载成功 |
| UIApplication 窗口查询 | 统一定义于 JobsGetWindow；JobsSwiftDSL 再导出，重编后仅 import JobsSwiftDSL 的源码调用继续可用，双导入无重复声明。符号模块迁移不承诺预编译 ABI，使用这些查询的二进制客户端需要重编 |
| 全局窗口函数 | 三个 `jobsGetMainWindow*` 只定义于 JobsGetWindow，JobsSwiftBaseTools 直接依赖并再导出。重编后的无前缀源码调用继续可用；使用这些函数的二进制客户端需要重编 |
| UIWindowScene 查询 | `keyWindowCompat` 和已弃用 `legacyKeyWindowPreiOS13` 只定义于 JobsGetWindow，JobsByUIKit 直接依赖并再导出；使用这些符号的二进制客户端需要重编 |
| Sendable Box | `AnySendableBox` 仅接收 Sendable 值；跨 actor 传递应使用不可变快照 |
| Patch payload | 拒绝任意自定义对象；普通 `@` 返回编码不能证明具体类型，调用方需保证 NSDictionary 替代与原调用兼容 |
| Host 最低系统 | 15.0 → 15.6，以满足现有 LiveChat 依赖；Podspec 的各模块最低版本另按实际兼容验证 |

## 四、逐 Pod 实施与编译清单 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

每一行均同步本模块 README、生产源码排除规则及编译命令；表中的“保留”表示未为增加改动量而重写成熟架构。编译状态以最终日志为准。

<!-- POD_MATRIX_START -->
| Pod / 目录 | 本次落实 | README | 最终 Debug 单元 |
| --- | --- | --- | --- |
| `BRPickerViewSwift` | 可取消 async throws、一次终态、Panel 移除收尾 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/BRPickerViewSwift@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalHost/BRPickerViewSwift.log>) |
| `JobsAppDoor` | 可取消/超时提交 operation、busy 状态、真实挑战 ID 传值 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsAppDoor@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDeliveryVerified/JobsAppDoor.log>) |
| `JobsAppEnvironmentRibbon@Pods` | 空目录，无源码/spec，不虚构实现 | N/A | N/A |
| `JobsAppIconRibbon` | 先完成临时成品再原子发布，路径/输入校验 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsAppIconRibbon@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGate2/JobsAppIconRibbon.log>) |
| `JobsAudioRecorder` | 系统返回值、主线程会话所有权、中断/重置、文件错误 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsAudioRecorder@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalRepairs/JobsAudioRecorder.log>) |
| `JobsBluetooth` | ready/MTU/背压/队列/重试/ACK 等级、回调重入身份 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsBluetooth@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalRepairs/JobsBluetooth.log>) |
| `JobsBy3rdTools` | PNPlayer GPU/播放失败、弱 DisplayLink、渲染格式和网格边界 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsBy3rdTools@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGlobalWindowVerified/JobsBy3rdTools.log>) |
| `JobsByPDFKit` | 保留系统薄桥接，明确 DSL 迁移和交付合同 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsByPDFKit@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsByPDFKit.log>) |
| `JobsByPhotosUI` | 保留桥接与扩展占位，选图业务入口与能力说明 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsByPhotosUI@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsByPhotosUI.log>) |
| `JobsByQuartzCore` | 保留薄桥接与兼容 import，避免重复系统封装 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsByQuartzCore@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsByQuartzCore.log>) |
| `JobsByUIKit` | Attribute 强类型、安全动态兼容；Scene 查询单一归属；隐私清单 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsByUIKit@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGlobalWindowVerified/JobsByUIKit.log>) |
| `JobsByWebKit` | 保留系统桥接，网页容器与 Bridge 归 Inheritance | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsByWebKit@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsByWebKit.log>) |
| `JobsCountdownButton` | MainActor、代次、重入复核、恢复原 enabled | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsCountdownButton@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsCountdownButton.log>) |
| `JobsCryptoKit` | 认证 fallback、安全默认、显式旧格式迁移、参数边界 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsCryptoKit@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsCryptoKit.log>) |
| `JobsDebugPanel` | 保留 DEBUG/Scene overlay 架构，明确隔离与隐私资源 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsDebugPanel@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalCurrentVerified/JobsDebugPanel.log>) |
| `JobsEmptyView` | 空态/重试可访问性合同，与列表复用保持一致 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsEmptyView@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsEmptyView.log>) |
| `JobsFuseAnimation` | 弱引用 Timer、invalidate、源/宿主释放收尾 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsFuseAnimation@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsFuseAnimation.log>) |
| `JobsGestureUnlock` | 重配清状态、有效性快照、系统取消不成功 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsGestureUnlock@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalRepairs/JobsGestureUnlock.log>) |
| `JobsGetWindow` | 空容器查找终止；窗口 API 唯一归属、版本路径延迟回退 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsGetWindow@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGlobalWindowVerified/JobsGetWindow.log>) |
| `JobsIconfont` | 同素材重绑代次、异步结果身份、缓存合同 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsIconfont@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsIconfont.log>) |
| `JobsImageRotation` | 单调 elapsed、运行中 interval 更新、暂停定义 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsImageRotation@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsImageRotation.log>) |
| `JobsImageTools` | 规格缓存 key、像素预算、HTTP/大小检查、复用身份 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsImageTools@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsImageTools.log>) |
| `JobsInheritance` | 首文档配置、JS nil/取消/超时、来源受控 Bridge | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsInheritance@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsInheritance.log>) |
| `JobsLocalNotification` | 公开配置、重复间隔校验、主队列结果 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsLocalNotification@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsLocalNotification.log>) |
| `JobsLuckyEnvelopeRain` | 有界配置、生成间隔、resume/暂停时序 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsLuckyEnvelopeRain@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDeliveryVerified/JobsLuckyEnvelopeRain.log>) |
| `JobsMarqueeView` | 保留 elapsed 与空源处理，明确生命周期回归 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsMarqueeView@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsMarqueeView.log>) |
| `JobsNavBar` | 保留 provider/KVO 分层，明确快速重绑和多窗使用 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNavBar@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsNavBar.log>) |
| `JobsNetworking` | 下载原子验证、取消/重试、query/上传、摘要缓存和预算 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDeliveryVerified/JobsNetworking.log>) |
| `JobsOCDSL` | 规范真实兼容入口；category 当前为空；独立消费者编译 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsOCDSL@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDeliveryVerified/JobsOCDSL.log>) |
| `JobsOCSkeletonView@Pods` | 空目录，无源码/spec，不虚构实现 | N/A | N/A |
| `JobsProgressBar` | 保留 clamp/自动停止与清理，明确拖动/更新边界 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsProgressBar@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsProgressBar.log>) |
| `JobsScale` | 有限设计尺寸/字体边界、断点归一、显式 window | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsScale@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsScale.log>) |
| `JobsScreenCapture` | available/verified 分离、迁窗失效、录屏默认隐藏 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsScreenCapture@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsScreenCapture.log>) |
| `JobsSwiftAppTools` | LaunchChecker 原子登记、有限运动参数、弱流量 UI | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftAppTools@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftAppTools.log>) |
| `JobsSwiftBaseDefines` | 输入 veto/IME 合同、主题快照同步与主线程绑定 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftBaseDefines@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebugVerified/JobsSwiftBaseDefines.log>) |
| `JobsSwiftBaseTools` | 数值/日期/流量并发边界；全局窗口函数再导出 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftBaseTools@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGlobalWindowVerified/JobsSwiftBaseTools.log>) |
| `JobsSwiftBlock` | 保留工厂；回调字典支持线程合同、真实既有回归 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftBlock@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGate2/JobsSwiftBlock.log>) |
| `JobsSwiftCalendar` | 按 firstWeekday 周首与翻页、跨月选择 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftCalendar@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftCalendar.log>) |
| `JobsSwiftComment` | 迭代深树/行数预算、分页重置、空态重试 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftComment@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftComment.log>) |
| `JobsSwiftCountryCodeCtrl` | Resource 目录与真实 Bundle 查找、数据使用合同 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftCountryCodeCtrl@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftCountryCodeCtrl.log>) |
| `JobsSwiftDSL` | 灰度/pattern/严格 HEX；UIApplication 查询再导出、链式合同 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftDSL@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGlobalWindowVerified/JobsSwiftDSL.log>) |
| `JobsSwiftDebugTools` | 主线程安装、静态 once、弱文本日志、DEBUG 隔离 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftDebugTools@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftDebugTools.log>) |
| `JobsSwiftExcel` | 冻结列先 clamp 再运算，保留小表架构 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftExcel@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftExcel.log>) |
| `JobsSwiftFoundation` | UInt32 读取精确范围校验，保留既有存储 API | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftFoundation@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftFoundation.log>) |
| `JobsSwiftGraphicCaptcha` | challenge/verifier/取消/过期/超时、终态前后重入 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftGraphicCaptcha@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalHost/JobsSwiftGraphicCaptcha.log>) |
| `JobsSwiftLinkageMenuView` | 空数据/重试、直接依赖与布局合同 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftLinkageMenuView@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftLinkageMenuView.log>) |
| `JobsSwiftMarkdown` | 后台 I/O/身份、锚点、CSP/内容规则与预 DOM 过滤 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftMarkdown@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftMarkdown.log>) |
| `JobsSwiftNumberStepper` | 保留 overflow/minmax/输入范围，补维护合同 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftNumberStepper@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftNumberStepper.log>) |
| `JobsSwiftOpen` | 保留旧构造，展示与页面加载结果分开、导航/进程失败与重试 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftOpen@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGate2/JobsSwiftOpen.log>) |
| `JobsSwiftPatch` | Class+SEL trampoline、继承隔离、ABI 拒绝、回滚事务 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftPatch@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftPatch.log>) |
| `JobsSwiftRefresher` | inset 贡献记账、detach/替换、旧 completion 代次 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftRefresher@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDeliveryVerified/JobsSwiftRefresher.log>) |
| `JobsSwiftSearcher` | 账户 scope/persist 隔离、容量与空态重试 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftSearcher@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftSearcher.log>) |
| `JobsSwiftSplash` | 原子缓存/GIF预算、持续视频待办/恢复、坏项自愈 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftSplash@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDeliveryVerified/JobsSwiftSplash.log>) |
| `JobsSwiftStandardLibrary` | Builder 移除逃逸指针、通用整数精确转换 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftStandardLibrary@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftStandardLibrary.log>) |
| `JobsSwiftTaskCenter` | 取消等待、最后事件、async action 句柄、终态回收 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTaskCenter@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalHost/JobsSwiftTaskCenter.log>) |
| `JobsSwiftTimer` | 执行参数归一；手动 fireOnce tick→finish；四内核/背压 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTimer@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalTimerVerified/JobsSwiftTimer.log>) |
| `JobsSwiftTimerMgr` | 精准取消/Scope/替换；先注销再独立交付 fireOnce | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTimerMgr@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalTimerVerified/JobsSwiftTimerMgr.log>) |
| `JobsSwiftTools` | Media once/失败、Flutter 会话终态、信号安全、Core/Flutter | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTools@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDeliveryVerified/JobsSwiftTools.log>) |
| `JobsSwiftUILabelScrolling` | 保留弱 label/原文恢复/静态停表，生命周期说明 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftUILabelScrolling@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftUILabelScrolling.log>) |
| `JobsSwiftWebSocket` | 弱 session delegate proxy、pong deadline、有限退避 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftWebSocket@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGate2/JobsSwiftWebSocket.log>) |
| `JobsSwiftWorker` | 派生订阅释放、once/take 原子、同键调度事务 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftWorker@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGate2/JobsSwiftWorker.log>) |
| `JobsTextTools` | 移除过宽 Sendable，保留 UTF16 编辑与属性语义 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsTextTools@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsTextTools.log>) |
| `JobsToast` | 安全窗口关联、弱宿主、取消延迟、旧完成身份 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsToast@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsToast.log>) |
| `JobsViewPush` | 保留抽屉代次/动画续接，回归与维护合同 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsViewPush@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsViewPush.log>) |
| `JobsWalletCard` | 空卡片/重试槽位，保留模型与布局缓存 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsWalletCard@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsWalletCard.log>) |
| `Jobsl10n` | Bundle 回退/系统模式、slot 去重/解绑、读写同步 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/Jobsl10n@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalGate2/Jobsl10n.log>) |
| `JobsSwiftMetalKit` | 保留系统薄桥接，明确实际 Pod 名和 DSL 迁移 | [README.md](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/MetalKit@Pods/README.md>) | [通过](</private/tmp/jobs-pods-upgrade-build/FinalDebug/JobsSwiftMetalKit.log>) |
<!-- POD_MATRIX_END -->

## 五、回归证据和复现方式 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 验证 | 实际覆盖 | 证据与边界 |
| --- | --- | --- |
| Core 原生回归 | 数值/日期/Builder、Patch、Worker/Task、l10n、既有 Block 及捕获析构重入 | `/tmp/jobs-pods-core-upgrade-final/`，7 组 / 8 次执行 / 21 条命令通过；TimerFixture 只服务上层调度测试，四 Timer 内核有 start/stop 检查，投递/背压测试主要使用 GCD，实跑状态见第一节 |
| 真实 WebKit | 实际 HTML、Jobs JS、原样 vendor 资源、CSP/规则、锚点 | 同上 20/21.log；禁止 HTTP 0、允许 HTTP 7，不把环境自身无法联网当通过 |
| Network 原生回归 | 实际 Crypto、BLE Core + Mock、Alamofire、controlled client、localhost HTTP/WebSocket、选定 Swift 6 值模型 | `/tmp/jobs-pods-upgrade-build/FinalNetworkVerified/results.json`；26 个编译/运行步骤全部通过，包含 12 个独立析构重入场景；Mock 不证明真实外设 |
| AppIcon 生成器 | 真实 swiftc 和文件发布、坏输入、路径碰撞/越界 | 6 场景通过；临时目录实跑，不修改原资源 |
| UIKit hosted XCTest | 颜色、空容器、Picker取消、Web配置/JS nil、周日历、深评论树、Scale、验证码/重入 | `.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift` 13 个 test method；最终运行状态见第一节 |
| 原有宿主测试 | 手势 Demo 和 Timer/TimerMgr 生命周期、背压、替换、精准取消、Scope | 14 个 test method，继续使用真实 iOS 模块 |
| Podspec / README / CI | 65 个 spec 语义加载、隐私清单、生产排除、README/脚本和 YAML | 本地静态检查；不等于远程流水线、发布审核或全量旧系统兼容 |

Core 的 ISO formatter 创建工厂 / Foundation DSL 再导出 fixture 和 Network 的两个 Foundation 工厂 fixture 仅承接 CLI 测试环境；网络传输、密码算法、Task/Worker 与 Patch 被测实现来自生产源文件。真实 iOS 编译仍使用实际 Pods。

在工程根目录复现，命令会真实编译并将日志留在外部目录：

```sh
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb \
  --output-dir /tmp/JobsPodsBuild \
  --derived-data /tmp/JobsPodsBuildDerivedData

ruby .github/tests/JobsPodsUpgrade/Core/run_regressions.rb \
  --output /tmp/JobsPodsCore --webkit

ruby .github/tests/JobsPodsUpgrade/Network/run_regressions.rb \
  --output-dir /tmp/JobsPodsNetwork
```

runner 为后续执行记录全局及逐项的微秒级开始/结束时间；本轮早期 receipt 保留原始秒级时间，缺逐项时间时按已关闭日志的 mtime 明确标注回退来源。源码快照和构建启动处于同一秒时，另记录实际顺序执行的 tool 观察证明，不倒填时间。

runner 默认请求 2 个 Xcode 构建任务，并通过 `OTHER_SWIFT_FLAGS` 向 Swift 传递 `-j1`，支持 `--jobs` / `--swift-jobs`。Xcode 的 SwiftDriver 还会生成自己的任务参数，因此这不是所有内部编译进程均单任务的保证；原生 Network runner 直接调用 swiftc 并使用 `-j 1`。

逐项重编支持 `--pods JobsBluetooth,JobsSwiftGraphicCaptcha --skip-host`。`--host-only` 用于已完成 Pod 门禁后的宿主重验。Release Simulator 复验使用 `--configuration Release --host-only`，自动按上文 Flutter 限制选择内嵌模式。完整首次复现需已有可用的 CocoaPods 安装产物；独立 OCDSL 消费者会自动执行无仓库更新的安装。

## 六、仍需对应场景验证的事项 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

本次编译和回归不替代真实 BLE 外设 ACK/拥塞、录音权限/中断、通知展示、iCloud 相册、大型 HEIC 解码峰值、多 Scene、真实截图/录屏、Flutter 插件会话、视频跨启动网络恢复和服务器验证码/登录限流验收。没有伪造服务端认证、设备确认或 OS 截图保证。

基础聚合库进一步按业务拆分、全工程 Swift 6 严格并发、大表虚拟化、旧系统/动态 Framework 发布测试属于需要独立消费矩阵的后续工作。本轮落实明确的正确性、生命周期、资源交付和编译门禁；不能把配置候选扫描或语法通过说成所有历史风格问题和所有业务需求均已解决。

现有构造器/链式风格审计仍输出历史候选，包含 initializer、系统 SDK、示例等需人工判断的结果；本次没有机械批量替换来掩盖候选。原有第三方过时提示和 SDK warning 保留，未通过删除诊断宣称零风险。

<a id="🔚" href="#前言" style="font-size:17px; color:green;">我是有底线的➤点我回到首页</a>

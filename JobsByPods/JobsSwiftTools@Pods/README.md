# `JobsSwiftTools`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。



## <span id="前言">Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span>

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

面向应用集成提供权限、媒体选择、崩溃记录和跨引擎桥接等服务。每个服务单独承接系统或外部运行时，JobsSwiftTools.swift 作为通用入口集合，不能按一个单纯工具类理解全部行为。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

宿主选择服务并初始化 → 处理权限或外部运行时 → 执行动作 → 交付结果并释放或保存状态

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- CrashLogCenter 持久化退出标记与日志，未到安全退出点只能表示疑似异常退出，不能精确证明崩溃原因。
- SIGKILL/Jetsam 无回调，signal handler 内使用 Swift/ObjC/IO 也有明确限制；不可宣称完整可靠捕获所有崩溃。
- 媒体选择与权限申请分层，选择结果还可能需要异步加载，不能把展示选择器当作取得文件。
- [**Flutter**](https://flutter.dev/) 和 Unity 桥接依赖外部引擎与宿主生命周期，重建某个小服务时应明确是否需要这些集成。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

按任务先读 PermissionCenter、MediaPickerService 或 CrashLogCenter，再看 FlutterBridge/UnityManager 与应用生命周期接入点。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [FlutterBridge.swift](<./FlutterBridge.swift>)
- [JobsSwiftTools.swift](<./JobsSwiftTools.swift>)
- [UnityManager.swift](<./UnityManager.swift>)
- [CrashLogCenter.swift](<./CrashLogCenter.swift>)
- [MediaPickerService.swift](<./MediaPickerService.swift>)

依赖与编译入口：[JobsSwiftTools.podspec](<./JobsSwiftTools.podspec>)。其中显式依赖声明包括 `Flutter`、`FlutterPluginRegistrant`、`JobsSwiftBaseDefines`、`JobsSwiftBlock`、`JobsByPhotosUI`、`JobsByUIKit`、`JobsToast`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`MediaPickerService` 和 NSObject 便利入口在 MainActor 调用，可用 `onFailure` 接收 noPresenter、permissionDenied、unavailable、presenterBusy、timedOut、cancelled、decodingFailed 和 decodedMemoryBudgetExceeded。传入 presenter 必须在窗口中且没有正在展示的页面/未交付媒体会话。代理在完成或取消时释放，晚到的旧代理不会清理新会话。PHPicker 使用用户所选内容授权，不预先请求全相册读写权限；旧相册入口仍检查权限。多图按选择顺序逐张加载，系统 item provider 返回 UIImage 后检查累计解码预算 64 MiB，任一解码失败终止本批。该预算限制本批保留的图片，不限制系统加载单张原图时的瞬时解码峰值；本入口保留原图尺寸，超大素材需由宿主采用文件导入和按目标尺寸采样的流程。`loadTimeout` 默认 30 秒（最大 300 秒），从用户选择完成开始计算，超时取消 item provider 的加载并结束本批；浏览选择器期间不计时。取消相册继续保留旧 onImages([]) 语义；成功图片回调不会被伪造为权限成功。

CrashLogCenter 保留普通运行上下文日志、退出标记和 NSException 记录；POSIX 信号交给系统，不在 signal handler 中执行 Swift/Foundation 文件 IO。退出标记表示“到达过安全点”，SIGKILL/Jetsam 不会提供退出回调。

FlutterBridge 在 MainActor 使用，一个 engine 同时展示一个 Flutter 页面；重复 requestId、不可用 engine、结果超时和原生关闭都有一次性终态。`resultTimeout` 默认 300 秒，非法值回退，最大 86400 秒；切换 engine 会取消旧会话、重建 channel，迟到结果不会恢复已结束请求。宿主需管理 engine 启动、插件注册和页面呈现策略。

默认依赖入口保持 Core + Flutter。只需要权限/媒体/诊断时可使用：

```ruby
pod 'JobsSwiftTools/Core', :path => './JobsByPods/JobsSwiftTools@Pods'
```

需要跨 Flutter 页面时接入 `JobsSwiftTools` 或 `JobsSwiftTools/Flutter`，Flutter 子规格声明 Flutter 和 FlutterPluginRegistrant。Core 排除 FlutterBridge / UnityManager；此入口减少外部引擎集成，不承诺 Jobs UIKit 底层依赖全部轻量。Unity 集成由宿主按实际引擎版本接入。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

每个显式 subspec 同步继承生产排除集合，避免只消费子模块时带入测试/示例源码。

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

隐私清单在 Core subspec 中通过独立资源 bundle 交付，显式消费 Core 或 Flutter 入口也会带入清单。当前所需理由 API：`UserDefaults`（CA92.1）、`FileTimestamp`（C617.1）。理由对应本库实际用途；宿主仍需核对业务数据收集、App Group / 用户授权文件等实际使用场景，资源声明与最终 App 内 bundle 都应验收。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftTools --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

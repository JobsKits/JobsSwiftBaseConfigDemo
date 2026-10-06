# `JobsScreenCapture`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

# <span id="前言">`JobsScreenCapture`</span>

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsScreenCapture` 是 Swift 工程的本地 Pod，统一承载三类能力：

- 主动渲染当前 `UIView` / `UIWindow` 并把截图保存到系统相册。
- 监听 `UIApplication.userDidTakeScreenshotNotification`，在截屏完成后回调业务层。
- 通过 `JobsScreenshotProtectionView` 承载敏感 UI，使其进入系统安全文本渲染容器，降低截图泄露风险。

系统的截屏通知发生在截图完成之后，因此“截屏提示”和“敏感内容保护”是两个独立方向，不能互相替代。

## 目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsScreenCapture@Pods/
├── Core/
│   ├── JobsScreenshotCapturer/
│   ├── JobsScreenshotObserver/
│   └── JobsScreenshotProtectionView/
├── JobsScreenCapture.podspec
└── README.md
```

`Core` 只放公开 Swift 源码；当前没有资源，不创建空 `Resource`。

## 公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsScreenshotCapturer`：主动截取指定视图，并按相册添加权限保存图片。
- `JobsScreenshotObserver`：开始、停止监听截屏完成通知。
- `JobsScreenshotProtectionView`：提供 `contentView` 作为敏感 UI 容器，并支持运行时开关保护。

## 依赖与引用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 系统框架：`Photos`、`UIKit`
- Pod：`SnapKit`

```swift
import JobsScreenCapture
```

## 风险边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- iOS 没有公开 API 可禁止用户按下系统截屏组合键。
- 程序主动截屏不会触发 `UIApplication.userDidTakeScreenshotNotification`，调用方应把它与物理按键截屏分开反馈。
- 宿主 App 必须提供非空的 `NSPhotoLibraryAddUsageDescription`；用户拒绝相册添加权限时返回明确错误，不伪报保存成功。
- `JobsScreenshotProtectionView` 依赖系统安全文本渲染层的现有行为，应在目标 iOS 版本和真机上回归截图结果。
- 若系统内部视图结构无法识别，`isProtectionAvailable` 会返回 `false`，内容退回普通容器显示，不伪报已保护。

## 验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsScreenCapture.podspec
pod install --no-repo-update
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsScreenCapture -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

## Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

拆成主动截图保存、系统截图观察和敏感内容保护容器。Capturer 负责渲染与相册写入结果，Observer 接收已发生截图通知，ProtectionView 尝试挂载系统安全文本渲染容器。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

主动截图：指定视图 → 渲染 → 检查相册添加权限 → 保存；保护：检测可用容器 → 承载内容或降级

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 系统截图通知在截图后发生，不能据此承诺预先拦截截图。
- 主线程、有效 bounds、渲染失败和相册权限都有明确错误出口，宿主需提供用途说明。
- 安全容器不可识别时 isProtectionAvailable 为 false，退回普通展示，不能向业务伪报保护成功。
- 保护效果依赖系统行为，重建时保留能力检测与降级，不把它描述成绝对防截屏保证。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

分别读 Capturer、Observer、ProtectionView，再看宿主如何组合与展示失败结果。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsScreenshotProtectionView/JobsScreenshotProtectionView.swift](<./Core/JobsScreenshotProtectionView/JobsScreenshotProtectionView.swift>)
- [Core/JobsScreenshotCapturer/JobsScreenshotCapturer.swift](<./Core/JobsScreenshotCapturer/JobsScreenshotCapturer.swift>)
- [Core/JobsScreenshotObserver/JobsScreenshotObserver.swift](<./Core/JobsScreenshotObserver/JobsScreenshotObserver.swift>)

依赖与编译入口：[JobsScreenCapture.podspec](<./JobsScreenCapture.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`isProtectionAvailable` 只表示识别到可挂载的系统安全 Canvas 容器；`isProtectionVerified` 默认 false。在目标 iOS 版本与真机上实际截屏验证后，宿主才能调用 `byProtectionVerified(true)` 记录该次验证；这仍不构成所有系统版本的保证。窗口挂载关系变化或关闭保护时，verified 会清零；重新启用也不自动恢复，须按当前窗口重新验证。内部容器无法识别时使用普通容器展示，available / verified 都不能据此当作已保护。

`hidesContentWhileCaptured` 默认 true，收到录屏或屏幕镜像状态变化时隐藏 `contentView`；移入新窗口后按该窗口 screen 重新检查。这个回退用于持续捕获状态，不保证拦截单次物理按键截图。敏感内容还应结合业务脱敏和权限控制。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsScreenCapture --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

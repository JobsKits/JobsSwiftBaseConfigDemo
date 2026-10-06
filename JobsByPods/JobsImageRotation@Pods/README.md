# `JobsImageRotation`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

# <span id="前言">JobsImageRotation</span>

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsImageRotation` 是基于 `JobsSwiftTimer` 的轻量旋转组件。它既能绑定任意 `UIView`，也提供只输出图形的 `JobsClockIconView`；组件不接管按钮标题、外层布局或业务倒计时。

## 目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsImageRotation@Pods/
├── Core/
│   ├── JobsClockIconView/
│   ├── JobsImageRotationDirection/
│   └── JobsImageRotator/
├── JobsImageRotation.podspec
└── README.md
```

当前没有资源，不创建空 `Resource`。

## 公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsImageRotationDirection`：`.clockwise` 与 `.counterclockwise`，默认顺时针。
- `JobsImageRotator.defaultInterval`：默认 `1.0 / 60.0` 秒。
- `direction`：运行中可切换方向。
- `interval`：Timer tick 间隔；运行中修改会重建驱动并保留暂停状态。
- `start()` / `pause()` / `resume()` / `stop(reset:)`：统一生命周期。
- `JobsClockIconView`：无数字、无刻度，时针固定，仅分针每 tick 前进 `6°`；默认顺时针，方向和间隔由外界传入。

```swift
import JobsImageRotation

let rotator = JobsImageRotator(
    targetView: button.imageView ?? button,
    direction: .counterclockwise,
    interval: 1.0 / 60.0
)
rotator.start()
```

```swift
let clockIcon = JobsClockIconView(
    direction: .counterclockwise,
    interval: JobsClockIconView.defaultInterval
)
clockIcon.start()
```

## 依赖与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 直接依赖 `JobsSwiftTimer`。
- 每个 tick 固定旋转 `6°`，因此 `interval` 越小旋转越快。
- `JobsClockIconView.defaultInterval` 为 `0.1` 秒，即默认 `6` 秒完成一周。
- `JobsClockIconView` 只绘制表盘外圈、固定时针、旋转分针和中心点，不附带标题、按钮、状态文案或刻度。
- 生命周期和 UI 更新必须从主线程调用。
- `stop()` 默认恢复绑定视图创建组件时的 transform。

## 验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsImageRotation.podspec
pod install --no-repo-update
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsImageRotation -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

## Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

把旋转控制与时钟图标展示分开：JobsImageRotator 绑定目标视图，按方向和间隔更新角度；JobsClockIconView 组合展示并转发控制，计时由 JobsSwiftTimer 提供。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

配置目标、方向和间隔 → 启动 → 按 tick 更新旋转 → 暂停或恢复 → 停止并选择是否复原

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- stop 默认恢复绑定时的 transform，不能简单设成单位矩阵而破坏目标原有变换。
- 暂停保留进程，停止重置属于另一种语义；重配和视图布局更新不应意外重复启动。
- 时钟图标默认每 0.1 秒前进 6 度，这是动画节奏，不是真实时钟计时。
- 操作目标视图与生命周期入口遵循主线程要求。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读 Direction 和 Rotator 的初始变换、tick、停止路径，再看 ClockIconView 的组合。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsClockIconView/JobsClockIconView.swift](<./Core/JobsClockIconView/JobsClockIconView.swift>)
- [Core/JobsImageRotationDirection/JobsImageRotationDirection.swift](<./Core/JobsImageRotationDirection/JobsImageRotationDirection.swift>)
- [Core/JobsImageRotator/JobsImageRotator.swift](<./Core/JobsImageRotator/JobsImageRotator.swift>)

依赖与编译入口：[JobsImageRotation.podspec](<./JobsImageRotation.podspec>)。其中显式依赖声明包括 `JobsSwiftTimer`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsImageRotator` 在主线程创建、配置和控制；`radiansPerSecond` 默认 `2π`，按单调时间的实际 tick 间隔计算角度。`interval` 只控制采样频率，非法值归一化；运行中修改 interval 会替换定时器并保留暂停状态。pause / resume 不把手动暂停时长补进旋转角度。目标视图释放后驱动停止。`JobsClockIconView` 的分针仍采用每 tick 6° 的时钟演示语义，与连续旋转器分开。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

隐私清单通过独立资源 bundle 交付。当前所需理由 API：`SystemBootTime`（35F9.1）。理由对应本库实际用途；宿主仍需核对业务数据收集、App Group / 用户授权文件等实际使用场景，资源声明与最终 App 内 bundle 都应验收。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsImageRotation --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# JobsFuseAnimation

本地 Pod：收口任意 `UIView` 的长按导火索、按压缩放、持续冒泡、分格充电和品牌刷新动画。业务层只提供手势、内容或动画配置。

组件内所有 Auto Layout 约束统一使用 `SnapKit`，不直接创建或激活系统 `NSLayoutConstraint`。

## 刷新动画插件协议

- `JobsRefreshAnimatorProtocol` 统一消费下拉进度和刷新阶段，动画框架不依赖具体刷新状态机。
- `JobsSystemRefreshView` 把系统菊花也纳入同一插件协议。
- `JobsImageRefreshView` 支持单图静态展示，多图使用 `JobsTimer` 定时轮播。
- `JobsGIFRefreshView` 支持资源名、文件路径和 `Data`。
- `JobsLottieRefreshView` 在下拉时同步 Lottie 进度，进入刷新后循环播放。
- `JobsTodayNewsRefreshView` 按真实录屏实现单条红色闭合轮廓的连续形变。
- `JobsDouyinRefreshView` 与今日头条插件遵循同一协议，可被刷新宿主原位替换。
- 今日头条单轮默认 `0.65s`：蝴蝶结 → 左尖三角 → 四边形 → 右尖三角 → 蝴蝶结。

```swift
let todayNews = JobsTodayNewsRefreshView(
    config: JobsTodayNewsRefreshConfig(cycleDuration: 0.65)
)

todayNews.refreshAnimatorApply(phase: .pulling, progress: 0.6)
todayNews.refreshAnimatorApply(phase: .refreshing, progress: 1)
```

其它渲染类型与品牌动画使用同一协议：

```swift
let singleImage = JobsImageRefreshView(image: UIImage(named: "菊花加载")!)
let imageSequence = JobsImageRefreshView(images: frames, frameInterval: 0.08)
let gif = JobsGIFRefreshView(gifNamed: "refresh.gif")
let lottie = JobsLottieRefreshView(animationNamed: "LottieLogo1")
let system = JobsSystemRefreshView()
```

## 抖音风格双球刷新动画

- `JobsDouyinRefreshView` 使用红、绿双球交叉换位、上下错峰跳跃和尺度切换表达刷新状态。
- `JobsDouyinRefreshConfig` 可配置颜色、球径、水平行程、跳跃高度和单轮时长。
- `byStart()` / `byPause()` / `byResume()` / `byStop()` 提供完整生命周期入口，重复开始不会叠加动画。
- 视图离开 window、App 进入后台时自动暂停；开启“减少动态效果”时保持静态双球。

```swift
let refreshView = JobsDouyinRefreshView(
    config: JobsDouyinRefreshConfig(
        redColor: UIColor(hex: 0xFE2C55),
        greenColor: UIColor(hex: 0x25F4EE)
    )
)

refreshView.byStart()
refreshView.byPause()
refreshView.byResume()
refreshView.byStop()
```

## 分格充电动画

- 默认 3 格，已充格使用 `JobsCor.systemGreen`，未充格使用 `JobsCor.systemGray3`。
- 每次 Timer tick 只前进 1 格，满格后的下一次 tick 回到 0 格。
- `segmentCount` / `filledColor` / `emptyColor` / `interval` 等均可配置。
- `UITableViewCell.byChargingAnimationStart(...)` 只更新当前 cell 里的 `CALayer`，不调用 `reloadData` 或 `reloadRows`。
- cell 离开 window、应用进入后台或系统开启“减少动态效果”时，内部 Timer 会暂停。

```swift
let chargingConfig = JobsChargingAnimationConfig(
    segmentCount: 5,
    filledColor: JobsCor.systemGreen,
    emptyColor: JobsCor.systemGray3,
    interval: 0.45
)

cell.byChargingAnimationStart(chargingConfig)
cell.byChargingAnimationPause()
cell.byChargingAnimationResume()
cell.byChargingAnimationStop()
```

## 冒泡动画

- `JobsFuseBubbleConfig` 管理发射间隔、上浮距离、水平漂移、缩放和并发上限。
- `byFuseBubbleStart` 只管动画，`bubbleProvider` 由外层提供任意 `UIView`。
- `byFuseBubbleStop` 停止继续发射，已发射的气泡会自然播放完并回收。
- `byFusePlaySound` 从 App 或内嵌资源 Bundle 查找音频，并缓存 `SystemSoundID` 供连续反馈复用。
- `byFusePlaySystemSound` 仅播放调用方已创建并负责管理的有效 `SystemSoundID`。
- 系统开启“减少动态效果”时，自动降级为短距离淡出。

```swift
sourceView.byFuseBubbleStart(in: hostView) {
    UIImageView(image: "hand.thumbsup.fill".sysImg)
}

sourceView.byFuseBubbleStop()
```

## v3 关键修复

- 外圈 `CAShapeLayer` 画在按钮自身 `bounds` 内侧。
- 即使按钮设置了 `byMasksToBounds(true)`，导火索外圈也不会被裁剪。
- 默认线圈颜色改成白色，并增加浅色底圈，避免和紫色按钮背景混在一起看不见。
- 进度增长由 `JobsSwiftTimer` 驱动。
- `thresholdProgress` 可在外圈叠加白色门槛刻度，用于表达最短有效进度等业务边界。
- 视图和 `CALayer` 属性通过 `JobsSwiftDSL` 链式配置。
- 引火索路径通过 `JobsByUIKit.UIBezierPath.make(...)` 创建。
- UIKit 基础色通过 `JobsSwiftBaseDefines.JobsCor` 统一提供。

## 用法

```swift
btn.byFusePressStart(
    ringConfig: JobsFuseOuterRingConfig(
        lineWidth: 4,
        strokeColor: JobsCor.white,
        trackColor: JobsCor.white.withAlphaComponent(0.22),
        growDuration: 1.2,
        repeatsWhileHolding: false,
        thresholdProgress: 0.25,
        thresholdColor: JobsCor.white
    ),
    scale: 1.18
)

btn.byFusePressStop()
btn.byFusePlaySound("Sound.wav")
```


## v4

松手时不再直接淡出，而是用 JobsSwiftTimer 驱动 `strokeEnd` 从当前进度倒退到 0，形成“退潮”效果。可通过 `retreatDuration` 控制回退时间，`fadeOutDuration` 仅作为回退完成后的短暂清理淡出。

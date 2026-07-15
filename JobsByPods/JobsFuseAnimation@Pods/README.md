# JobsFuseAnimation

本地 Pod：收口任意 `UIView` 的长按导火索、按压缩放和持续冒泡动画。业务层负责提供冒泡内容、手势状态和语义反馈。

## 冒泡动画

- `JobsFuseBubbleConfig` 管理发射间隔、上浮距离、水平漂移、缩放和并发上限。
- `byFuseBubbleStart` 只管动画，`bubbleProvider` 由外层提供任意 `UIView`。
- `byFuseBubbleStop` 停止继续发射，已发射的气泡会自然播放完并回收。
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
        repeatsWhileHolding: false
    ),
    scale: 1.18
)

btn.byFusePressStop()
btn.byFusePlaySystemSound()
```


## v4

松手时不再直接淡出，而是用 JobsSwiftTimer 驱动 `strokeEnd` 从当前进度倒退到 0，形成“退潮”效果。可通过 `retreatDuration` 控制回退时间，`fadeOutDuration` 仅作为回退完成后的短暂清理淡出。

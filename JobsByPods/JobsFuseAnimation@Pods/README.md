# JobsFuseAnimation

本地 Pod：长按按钮时显示导火索外圈增长动画，同时按钮放大；松手后外圈淡出，按钮恢复。

## v3 关键修复

- 外圈 `CAShapeLayer` 画在按钮自身 `bounds` 内侧。
- 即使按钮设置了 `byMasksToBounds(true)`，导火索外圈也不会被裁剪。
- 默认线圈颜色改成白色，并增加浅色底圈，避免和紫色按钮背景混在一起看不见。
- 进度增长由 `JobsSwiftTimer` 驱动。

## 用法

```swift
btn.byFusePressStart(
    ringConfig: JobsFuseOuterRingConfig(
        lineWidth: 4,
        strokeColor: .white,
        trackColor: UIColor.white.withAlphaComponent(0.22),
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

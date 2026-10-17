# `calls 符号关系 - 144`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["property:UIView::jobs_isShimmering<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:346"]
  T1["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  S1 -->|calls| T1
  S2["property:UIView::jobs_isShimmering<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:346"]
  T2["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:386"]
  S2 -->|calls| T2
  S3["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  T3["method:UIView::jobs_enableShimmerAutoLayoutUpdatesOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:82"]
  S3 -->|calls| T3
  S4["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  T4["method:JobsShimmerRuntime::inc<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:69"]
  S4 -->|calls| T4
  S5["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  T5["method:UIView::jobs_prepareShimmerLayerIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:241"]
  S5 -->|calls| T5
  S6["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  T6["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  S6 -->|calls| T6
  S7["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  T7["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:276"]
  S7 -->|calls| T7
  S8["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  T8["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:300"]
  S8 -->|calls| T8
  S9["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  T9["method:CALayer::byHidden<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:64"]
  S9 -->|calls| T9
  S10["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:386"]
  T10["method:JobsShimmerRuntime::dec<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:74"]
  S10 -->|calls| T10
  S11["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:386"]
  T11["method:UIView::jobs_withoutImplicitAnimations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:131"]
  S11 -->|calls| T11
  S12["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  T12["method:UIView::jobs_withoutImplicitAnimations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:131"]
  S12 -->|calls| T12
  S13["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  T13["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S13 -->|calls| T13
  S14["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  T14["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S14 -->|calls| T14
  S15["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  T15["method:CALayer::byCornerRadius<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:186"]
  S15 -->|calls| T15
  S16["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  T16["method:CALayer::byCornerRadius<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:186"]
  S16 -->|calls| T16
  S17["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  T17["method:RTBadgeConfig::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:75"]
  S17 -->|calls| T17
  S18["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  T18["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:300"]
  S18 -->|calls| T18
  S19["method:UIView::byShimmering<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:438"]
  T19["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  S19 -->|calls| T19
  S20["method:UIView::byShimmering<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:438"]
  T20["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:386"]
  S20 -->|calls| T20
  S21["method:UIView::byShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:448"]
  T21["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:276"]
  S21 -->|calls| T21
  S22["method:UIView::byShimmerDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:459"]
  T22["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:300"]
  S22 -->|calls| T22
  S23["method:UIView::byShimmerPauseDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:471"]
  T23["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:300"]
  S23 -->|calls| T23
  S24["method:UIView::byShimmerHighlightWidthRatio<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:483"]
  T24["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:276"]
  S24 -->|calls| T24
  S25["property:UIButton::jobs_fgOverlayTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:514"]
  T25["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

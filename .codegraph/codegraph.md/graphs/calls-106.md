# `calls 符号关系 - 106`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::jobs_prepareShimmerLayerIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:227"]
  T1["method:JXSegmentedIndicatorGradientLineView::byStartPoint<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorGradientLineView.swift:26"]
  S1 -->|calls| T1
  S2["method:UIView::jobs_prepareShimmerLayerIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:227"]
  T2["method:UIGestureRecognizer::byName<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:84"]
  S2 -->|calls| T2
  S3["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T3["method:UIColor::jobsResolvedColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:334"]
  S3 -->|calls| T3
  S4["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T4["method:UIColor::jobsResolvedColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:334"]
  S4 -->|calls| T4
  S5["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T5["method:JXSegmentedIndicatorGradientLineView::byLocations<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorGradientLineView.swift:38"]
  S5 -->|calls| T5
  S6["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T6["method:CAGradientLayer::byColors<br/>JobsByPods/JobsByQuartzCore@Pods/CAGradientLayer.swift:20"]
  S6 -->|calls| T6
  S7["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:280"]
  T7["method:CAAnimation::byTimingFunction<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:13"]
  S7 -->|calls| T7
  S8["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:280"]
  T8["method:CAAnimation::byRemovedOnCompletion<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:25"]
  S8 -->|calls| T8
  S9["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:280"]
  T9["method:CAMediaTiming::byRepeatCount<br/>JobsByPods/JobsByQuartzCore@Pods/CAMediaTiming.swift:37"]
  S9 -->|calls| T9
  S10["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:280"]
  T10["method:JobsButtonNumberAnimConfig::Title::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:375"]
  S10 -->|calls| T10
  S11["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:280"]
  T11["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:19"]
  S11 -->|calls| T11
  S12["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:280"]
  T12["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:13"]
  S12 -->|calls| T12
  S13["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:313"]
  T13["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:329"]
  S13 -->|calls| T13
  S14["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:313"]
  T14["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:362"]
  S14 -->|calls| T14
  S15["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:329"]
  T15["method:UIView::jobs_enableShimmerAutoLayoutUpdatesOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:82"]
  S15 -->|calls| T15
  S16["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:329"]
  T16["method:JobsShimmerRuntime::inc<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:68"]
  S16 -->|calls| T16
  S17["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:329"]
  T17["method:UIView::jobs_prepareShimmerLayerIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:227"]
  S17 -->|calls| T17
  S18["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:329"]
  T18["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:385"]
  S18 -->|calls| T18
  S19["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:329"]
  T19["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  S19 -->|calls| T19
  S20["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:329"]
  T20["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:280"]
  S20 -->|calls| T20
  S21["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:362"]
  T21["method:JobsShimmerRuntime::dec<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:73"]
  S21 -->|calls| T21
  S22["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:362"]
  T22["method:UIView::jobs_withoutImplicitAnimations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:131"]
  S22 -->|calls| T22
  S23["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:385"]
  T23["method:UIView::jobs_withoutImplicitAnimations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:131"]
  S23 -->|calls| T23
  S24["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:385"]
  T24["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:280"]
  S24 -->|calls| T24
  S25["method:UIView::byShimmering<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:416"]
  T25["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:329"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

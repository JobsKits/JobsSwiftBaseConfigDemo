# `calls 符号关系 - 182`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:SlideToUnlockView::updateLayoutForProgress<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:218"]
  T1["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  S1 -->|calls| T1
  S2["method:SlideToUnlockView::updateSkeletonState<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:241"]
  T2["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S2 -->|calls| T2
  S3["method:SlideToUnlockView::updateSkeletonState<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:241"]
  T3["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  S3 -->|calls| T3
  S4["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  T4["method:UIView::jobs_setShimmerMask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:430"]
  S4 -->|calls| T4
  S5["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  T5["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S5 -->|calls| T5
  S6["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  T6["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  S6 -->|calls| T6
  S7["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  T7["method:UIView::jobs_setShimmerMask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:430"]
  S7 -->|calls| T7
  S8["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  T8["method:UIView::jobs_setShimmerMask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:430"]
  S8 -->|calls| T8
  S9["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  T9["method:UIView::jobs_setShimmerMask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:430"]
  S9 -->|calls| T9
  S10["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  T10["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:22"]
  S10 -->|calls| T10
  S11["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  T11["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S11 -->|calls| T11
  S12["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  T12["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S12 -->|calls| T12
  S13["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  T13["method:UIView::jobs_setShimmerMask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:430"]
  S13 -->|calls| T13
  S14["method:SlideToUnlockView::completeUnlock<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:298"]
  T14["method:SlideToUnlockView::updateLayoutForProgress<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:218"]
  S14 -->|calls| T14
  S15["method:SlideToUnlockView::completeUnlock<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:298"]
  T15["field:SlideToUnlockView::onUnlock<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:27"]
  S15 -->|calls| T15
  S16["method:SlideToUnlockView::completeUnlock<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:298"]
  T16["method:SlideToUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:312"]
  S16 -->|calls| T16
  S17["method:SlideToUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:312"]
  T17["method:SlideToUnlockView::updateLayoutForProgress<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:218"]
  S17 -->|calls| T17
  S18["class:GestureNodeView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:18"]
  T18["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:58"]
  S18 -->|calls| T18
  S19["class:GestureNodeView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:18"]
  T19["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S19 -->|calls| T19
  S20["class:GestureNodeView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:18"]
  T20["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S20 -->|calls| T20
  S21["method:GestureNodeView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:49"]
  T21["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S21 -->|calls| T21
  S22["method:GestureNodeView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:49"]
  T22["method:CAShapeLayer::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:16"]
  S22 -->|calls| T22
  S23["method:GestureNodeView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:49"]
  T23["method:CAShapeLayer::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:16"]
  S23 -->|calls| T23
  S24["method:GestureNodeView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:49"]
  T24["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S24 -->|calls| T24
  S25["method:GestureNodeView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:49"]
  T25["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

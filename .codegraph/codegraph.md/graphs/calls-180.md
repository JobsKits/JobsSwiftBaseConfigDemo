# `calls 符号关系 - 180`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsChargingAnimationView::jobs_layoutChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:747"]
  T1["method:BRPickerTheme::byCornerRadius<br/>JobsByPods/BRPickerViewSwift@Pods/Theme/BRPickerTheme.swift:78"]
  S1 -->|calls| T1
  S2["method:JobsChargingAnimationView::jobs_layoutChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:747"]
  T2["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S2 -->|calls| T2
  S3["method:JobsChargingAnimationView::jobs_applyChargingColors<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:767"]
  T3["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S3 -->|calls| T3
  S4["method:JobsChargingAnimationView::jobs_applyChargingColors<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:767"]
  T4["method:CALayer::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:174"]
  S4 -->|calls| T4
  S5["method:JobsChargingAnimationView::jobs_applyChargingColors<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:767"]
  T5["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:12"]
  S5 -->|calls| T5
  S6["method:JobsChargingAnimationView::jobs_syncChargingTimerState<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:794"]
  T6["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S6 -->|calls| T6
  S7["method:JobsChargingAnimationView::jobs_syncChargingTimerState<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:794"]
  T7["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:217"]
  S7 -->|calls| T7
  S8["method:JobsChargingAnimationView::jobs_syncChargingTimerState<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:794"]
  T8["method:JobsChargingAnimationView::byAdvance<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:703"]
  S8 -->|calls| T8
  S9["method:JobsChargingAnimationView::jobs_stopChargingTimer<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:820"]
  T9["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S9 -->|calls| T9
  S10["method:UITableViewCell::byChargingAnimationStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:848"]
  T10["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S10 -->|calls| T10
  S11["method:UITableViewCell::byChargingAnimationStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:848"]
  T11["method:UITableViewCell::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:291"]
  S11 -->|calls| T11
  S12["method:UITableViewCell::byChargingAnimationStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:848"]
  T12["method:JobsChargingAnimationView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:664"]
  S12 -->|calls| T12
  S13["method:UITableViewCell::byChargingAnimationPause<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:880"]
  T13["method:JobsChargingAnimationView::byPause<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:676"]
  S13 -->|calls| T13
  S14["method:UITableViewCell::byChargingAnimationResume<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:887"]
  T14["method:JobsChargingAnimationView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:684"]
  S14 -->|calls| T14
  S15["method:UITableViewCell::byChargingAnimationStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:894"]
  T15["method:JobsChargingAnimationView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:692"]
  S15 -->|calls| T15
  S16["method:UITableViewCell::jobs_chargingPlaceholderImage<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:903"]
  T16["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S16 -->|calls| T16
  S17["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T17["method:SlideToUnlockView::updateDirectionUI<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:201"]
  S17 -->|calls| T17
  S18["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T18["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:250"]
  S18 -->|calls| T18
  S19["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T19["method:SlideToUnlockView::updateSkeletonState<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:241"]
  S19 -->|calls| T19
  S20["property:SlideToUnlockView::progress<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:51"]
  T20["method:SlideToUnlockView::updateLayoutForProgress<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:218"]
  S20 -->|calls| T20
  S21["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T21["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S21 -->|calls| T21
  S22["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T22["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S22 -->|calls| T22
  S23["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T23["method:UIView::byAutoresizingMask<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:177"]
  S23 -->|calls| T23
  S24["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T24["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S24 -->|calls| T24
  S25["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T25["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

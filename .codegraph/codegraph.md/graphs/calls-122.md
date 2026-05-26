# `calls 符号关系 - 122`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T1["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S1 -->|calls| T1
  S2["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T2["method:UIView::jobs_addGestureRetView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:592"]
  S2 -->|calls| T2
  S3["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T3["method:CALayer::byShadowOffset<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:268"]
  S3 -->|calls| T3
  S4["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T4["method:CALayer::byShadowRadius<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:274"]
  S4 -->|calls| T4
  S5["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T5["method:CALayer::byShadowColor<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:256"]
  S5 -->|calls| T5
  S6["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T6["method:CALayer::byShadowOpacity<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:262"]
  S6 -->|calls| T6
  S7["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T7["method:CALayer::byMasksToBounds<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:132"]
  S7 -->|calls| T7
  S8["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T8["method:BRPickerTheme::byCornerRadius<br/>JobsByPods/BRPickerViewSwift@Pods/Theme/BRPickerTheme.swift:77"]
  S8 -->|calls| T8
  S9["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T9["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S9 -->|calls| T9
  S10["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T10["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:45"]
  S10 -->|calls| T10
  S11["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T11["method:UIPanGestureRecognizer::byMaxTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:157"]
  S11 -->|calls| T11
  S12["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T12["method:UIPanGestureRecognizer::byMinTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:151"]
  S12 -->|calls| T12
  S13["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T13["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S13 -->|calls| T13
  S14["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T14["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:244"]
  S14 -->|calls| T14
  S15["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T15["method:SlideToUnlockView::completeUnlock<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:290"]
  S15 -->|calls| T15
  S16["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T16["method:SlideToUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:299"]
  S16 -->|calls| T16
  S17["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T17["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S17 -->|calls| T17
  S18["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T18["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S18 -->|calls| T18
  S19["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T19["method:UIAlertController::byTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:60"]
  S19 -->|calls| T19
  S20["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T20["method:SlideToUnlockView::setup<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:174"]
  S20 -->|calls| T20
  S21["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T21["method:SlideToUnlockView::setup<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:174"]
  S21 -->|calls| T21
  S22["method:SlideToUnlockView::setup<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:174"]
  T22["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S22 -->|calls| T22
  S23["method:SlideToUnlockView::setup<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:174"]
  T23["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S23 -->|calls| T23
  S24["method:SlideToUnlockView::setup<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:174"]
  T24["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S24 -->|calls| T24
  S25["method:SlideToUnlockView::setup<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:174"]
  T25["method:SlideToUnlockView::updateDirectionUI<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:192"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

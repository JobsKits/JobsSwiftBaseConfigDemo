# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T1["method:UITapGestureRecognizer::byTaps<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:115"]
  S1 -->|calls| T1
  S2["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T2["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S2 -->|calls| T2
  S3["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T3["method:NSObject::jobsValueVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:47"]
  S3 -->|calls| T3
  S4["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T4["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S4 -->|calls| T4
  S5["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T5["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S5 -->|calls| T5
  S6["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T6["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S6 -->|calls| T6
  S7["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T7["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S7 -->|calls| T7
  S8["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T8["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S8 -->|calls| T8
  S9["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T9["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S9 -->|calls| T9
  S10["method:JobsEmptyView::byOnTapRetry<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:57"]
  T10["method:NSObject::jobsByVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:37"]
  S10 -->|calls| T10
  S11["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T11["method:SlideToUnlockView::updateDirectionUI<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:192"]
  S11 -->|calls| T11
  S12["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T12["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:244"]
  S12 -->|calls| T12
  S13["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T13["method:SlideToUnlockView::updateSkeletonState<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:235"]
  S13 -->|calls| T13
  S14["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T14["method:SlideToUnlockView::updateLayoutForProgress<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:209"]
  S14 -->|calls| T14
  S15["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T15["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S15 -->|calls| T15
  S16["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T16["method:CALayer::byMasksToBounds<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:132"]
  S16 -->|calls| T16
  S17["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T17["method:BRPickerTheme::byCornerRadius<br/>JobsByPods/BRPickerViewSwift@Pods/Theme/BRPickerTheme.swift:77"]
  S17 -->|calls| T17
  S18["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T18["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S18 -->|calls| T18
  S19["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T19["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S19 -->|calls| T19
  S20["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T20["method:UIView::byShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:427"]
  S20 -->|calls| T20
  S21["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T21["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S21 -->|calls| T21
  S22["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T22["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S22 -->|calls| T22
  S23["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T23["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S23 -->|calls| T23
  S24["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T24["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S24 -->|calls| T24
  S25["class:SlideToUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:20"]
  T25["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

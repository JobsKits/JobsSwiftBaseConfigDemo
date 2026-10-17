# `calls 符号关系 - 170`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T1["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S1 -->|calls| T1
  S2["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T2["method:JobsImageRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:102"]
  S2 -->|calls| T2
  S3["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T3["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S3 -->|calls| T3
  S4["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T4["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S4 -->|calls| T4
  S5["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T5["method:JobsImageRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:76"]
  S5 -->|calls| T5
  S6["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T6["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S6 -->|calls| T6
  S7["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T7["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S7 -->|calls| T7
  S8["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T8["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S8 -->|calls| T8
  S9["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T9["method:JobsImageRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:102"]
  S9 -->|calls| T9
  S10["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T10["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S10 -->|calls| T10
  S11["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T11["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S11 -->|calls| T11
  S12["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T12["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S12 -->|calls| T12
  S13["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T13["method:JobsImageRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:102"]
  S13 -->|calls| T13
  S14["method:JobsImageRefreshView::jobs_setupImageRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:159"]
  T14["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S14 -->|calls| T14
  S15["method:JobsImageRefreshView::jobs_setupImageRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:159"]
  T15["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S15 -->|calls| T15
  S16["method:JobsImageRefreshView::jobs_setupImageRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:159"]
  T16["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S16 -->|calls| T16
  S17["method:JobsImageRefreshView::jobs_setupImageRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:159"]
  T17["method:UIView::byContentMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:211"]
  S17 -->|calls| T17
  S18["method:JobsImageRefreshView::jobs_setupImageRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:159"]
  T18["method:JobsImageRefreshView::jobs_showFrame<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:203"]
  S18 -->|calls| T18
  S19["method:JobsImageRefreshView::jobs_startTimerIfNeeded<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:170"]
  T19["method:JobsImageRefreshView::jobs_showFrame<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:203"]
  S19 -->|calls| T19
  S20["method:JobsImageRefreshView::jobs_startTimerIfNeeded<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:170"]
  T20["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:217"]
  S20 -->|calls| T20
  S21["method:JobsImageRefreshView::jobs_startTimerIfNeeded<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:170"]
  T21["method:JobsImageRefreshView::jobs_advanceFrame<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:197"]
  S21 -->|calls| T21
  S22["method:JobsImageRefreshView::jobs_advanceFrame<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:197"]
  T22["method:JobsImageRefreshView::jobs_showFrame<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:203"]
  S22 -->|calls| T22
  S23["method:JobsImageRefreshView::jobs_showFrame<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:203"]
  T23["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:18"]
  S23 -->|calls| T23
  S24["method:JobsImageRefreshView::jobs_showFrame<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:203"]
  T24["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:18"]
  S24 -->|calls| T24
  S25["method:JobsImageRefreshView::jobs_showFrame<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:203"]
  T25["field:JobsImageRefreshView::images<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:20"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

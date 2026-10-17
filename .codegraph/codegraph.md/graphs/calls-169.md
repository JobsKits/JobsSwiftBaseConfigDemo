# `calls 符号关系 - 169`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T1["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S1 -->|calls| T1
  S2["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T2["method:JobsGIFRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:96"]
  S2 -->|calls| T2
  S3["method:JobsGIFRefreshView::jobs_setupGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:150"]
  T3["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S3 -->|calls| T3
  S4["method:JobsGIFRefreshView::jobs_setupGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:150"]
  T4["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S4 -->|calls| T4
  S5["method:JobsGIFRefreshView::jobs_setupGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:150"]
  T5["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S5 -->|calls| T5
  S6["method:JobsGIFRefreshView::jobs_setupGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:150"]
  T6["method:UIView::byContentMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:211"]
  S6 -->|calls| T6
  S7["method:JobsGIFRefreshView::jobs_decodeGIF<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:160"]
  T7["method:JobsGIFRefreshView::jobs_delay<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:185"]
  S7 -->|calls| T7
  S8["method:JobsGIFRefreshView::jobs_decodeGIF<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:160"]
  T8["method:ASImageNode::setAnimatedImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:34"]
  S8 -->|calls| T8
  S9["method:JobsGIFRefreshView::jobs_decodeGIF<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:160"]
  T9["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:18"]
  S9 -->|calls| T9
  S10["class:JobsImageRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:19"]
  T10["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S10 -->|calls| T10
  S11["class:JobsImageRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:19"]
  T11["method:JobsImageRefreshView::jobs_setupImageRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:159"]
  S11 -->|calls| T11
  S12["class:JobsImageRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:19"]
  T12["method:JobsImageRefreshView::jobs_setupImageRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:159"]
  S12 -->|calls| T12
  S13["method:JobsImageRefreshView::didMoveToWindow<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:67"]
  T13["method:JobsImageRefreshView::jobs_startTimerIfNeeded<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:170"]
  S13 -->|calls| T13
  S14["method:JobsImageRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:76"]
  T14["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S14 -->|calls| T14
  S15["method:JobsImageRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:76"]
  T15["method:JobsImageRefreshView::jobs_startTimerIfNeeded<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:170"]
  S15 -->|calls| T15
  S16["method:JobsImageRefreshView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:91"]
  T16["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S16 -->|calls| T16
  S17["method:JobsImageRefreshView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:91"]
  T17["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:217"]
  S17 -->|calls| T17
  S18["method:JobsImageRefreshView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:91"]
  T18["method:JobsImageRefreshView::jobs_startTimerIfNeeded<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:170"]
  S18 -->|calls| T18
  S19["method:JobsImageRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:102"]
  T19["method:JobsImageRefreshView::jobs_showFrame<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:203"]
  S19 -->|calls| T19
  S20["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T20["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S20 -->|calls| T20
  S21["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T21["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S21 -->|calls| T21
  S22["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T22["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S22 -->|calls| T22
  S23["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T23["method:JobsImageRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:102"]
  S23 -->|calls| T23
  S24["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T24["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S24 -->|calls| T24
  S25["method:JobsImageRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsImageRefreshView/JobsImageRefreshView.swift:120"]
  T25["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

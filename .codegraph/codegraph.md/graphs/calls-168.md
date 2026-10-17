# `calls 符号关系 - 168`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:19"]
  T1["method:JobsGIFRefreshView::jobs_setupGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:150"]
  S1 -->|calls| T1
  S2["method:JobsGIFRefreshView::didMoveToWindow<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:67"]
  T2["method:JobsGIFRefreshView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:91"]
  S2 -->|calls| T2
  S3["method:JobsGIFRefreshView::didMoveToWindow<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:67"]
  T3["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:18"]
  S3 -->|calls| T3
  S4["method:JobsGIFRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:76"]
  T4["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:18"]
  S4 -->|calls| T4
  S5["method:JobsGIFRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:76"]
  T5["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S5 -->|calls| T5
  S6["method:JobsGIFRefreshView::byPause<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:84"]
  T6["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:18"]
  S6 -->|calls| T6
  S7["method:JobsGIFRefreshView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:91"]
  T7["method:JobsGIFRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:76"]
  S7 -->|calls| T7
  S8["method:JobsGIFRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:96"]
  T8["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:18"]
  S8 -->|calls| T8
  S9["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T9["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S9 -->|calls| T9
  S10["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T10["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S10 -->|calls| T10
  S11["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T11["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S11 -->|calls| T11
  S12["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T12["method:JobsGIFRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:96"]
  S12 -->|calls| T12
  S13["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T13["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S13 -->|calls| T13
  S14["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T14["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S14 -->|calls| T14
  S15["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T15["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S15 -->|calls| T15
  S16["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T16["method:JobsGIFRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:96"]
  S16 -->|calls| T16
  S17["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T17["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S17 -->|calls| T17
  S18["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T18["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S18 -->|calls| T18
  S19["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T19["method:JobsGIFRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:76"]
  S19 -->|calls| T19
  S20["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T20["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S20 -->|calls| T20
  S21["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T21["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S21 -->|calls| T21
  S22["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T22["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S22 -->|calls| T22
  S23["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T23["method:JobsGIFRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:96"]
  S23 -->|calls| T23
  S24["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T24["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S24 -->|calls| T24
  S25["method:JobsGIFRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:111"]
  T25["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

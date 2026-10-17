# `calls 符号关系 - 166`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T1["method:JobsDouyinRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:114"]
  S1 -->|calls| T1
  S2["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T2["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S2 -->|calls| T2
  S3["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T3["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S3 -->|calls| T3
  S4["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T4["method:JobsDouyinRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:114"]
  S4 -->|calls| T4
  S5["method:JobsDouyinRefreshView::jobs_setupDouyinRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:167"]
  T5["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  S5 -->|calls| T5
  S6["method:JobsDouyinRefreshView::jobs_environmentDidChange<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:194"]
  T6["method:JobsDouyinRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:203"]
  S6 -->|calls| T6
  S7["method:JobsDouyinRefreshView::jobs_applicationDidEnterBackground<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:198"]
  T7["method:JobsDouyinRefreshView::jobs_pauseAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:325"]
  S7 -->|calls| T7
  S8["method:JobsDouyinRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:203"]
  T8["method:JobsDouyinRefreshView::jobs_removeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:348"]
  S8 -->|calls| T8
  S9["method:JobsDouyinRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:203"]
  T9["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  S9 -->|calls| T9
  S10["method:JobsDouyinRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:203"]
  T10["method:JobsDouyinRefreshView::jobs_pauseAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:325"]
  S10 -->|calls| T10
  S11["method:JobsDouyinRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:203"]
  T11["method:JobsDouyinRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:251"]
  S11 -->|calls| T11
  S12["method:JobsDouyinRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:203"]
  T12["method:JobsDouyinRefreshView::jobs_resumeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:335"]
  S12 -->|calls| T12
  S13["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T13["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S13 -->|calls| T13
  S14["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T14["method:CALayer::byZPosition<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:34"]
  S14 -->|calls| T14
  S15["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T15["method:CALayer::byOpacity<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:225"]
  S15 -->|calls| T15
  S16["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T16["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S16 -->|calls| T16
  S17["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T17["method:JobsProgressBar::byFillColor<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:935"]
  S17 -->|calls| T17
  S18["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T18["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S18 -->|calls| T18
  S19["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T19["method:EKAttributes::byPosition<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:20"]
  S19 -->|calls| T19
  S20["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T20["method:CALayer::byBounds<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:16"]
  S20 -->|calls| T20
  S21["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T21["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S21 -->|calls| T21
  S22["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T22["method:CALayer::byZPosition<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:34"]
  S22 -->|calls| T22
  S23["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T23["method:CALayer::byOpacity<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:225"]
  S23 -->|calls| T23
  S24["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T24["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S24 -->|calls| T24
  S25["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T25["method:JobsProgressBar::byFillColor<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:935"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 165`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsDouyinRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:18"]
  T1["method:JobsDouyinRefreshView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:69"]
  S1 -->|calls| T1
  S2["class:JobsDouyinRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:18"]
  T2["method:JobsDouyinRefreshView::jobs_setupDouyinRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:167"]
  S2 -->|calls| T2
  S3["method:JobsDouyinRefreshView::layoutSubviews<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:53"]
  T3["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  S3 -->|calls| T3
  S4["method:JobsDouyinRefreshView::layoutSubviews<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:53"]
  T4["method:JobsDouyinRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:251"]
  S4 -->|calls| T4
  S5["method:JobsDouyinRefreshView::didMoveToWindow<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:63"]
  T5["method:JobsDouyinRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:203"]
  S5 -->|calls| T5
  S6["method:JobsDouyinRefreshView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:69"]
  T6["method:JobsDouyinRefreshView::jobs_removeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:348"]
  S6 -->|calls| T6
  S7["method:JobsDouyinRefreshView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:69"]
  T7["method:JobsDouyinRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:203"]
  S7 -->|calls| T7
  S8["method:JobsDouyinRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:90"]
  T8["method:JobsDouyinRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:203"]
  S8 -->|calls| T8
  S9["method:JobsDouyinRefreshView::byPause<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:98"]
  T9["method:JobsDouyinRefreshView::jobs_pauseAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:325"]
  S9 -->|calls| T9
  S10["method:JobsDouyinRefreshView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:106"]
  T10["method:JobsDouyinRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:203"]
  S10 -->|calls| T10
  S11["method:JobsDouyinRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:114"]
  T11["method:JobsDouyinRefreshView::jobs_removeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:348"]
  S11 -->|calls| T11
  S12["method:JobsDouyinRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:114"]
  T12["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  S12 -->|calls| T12
  S13["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T13["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S13 -->|calls| T13
  S14["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T14["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S14 -->|calls| T14
  S15["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T15["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S15 -->|calls| T15
  S16["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T16["method:JobsDouyinRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:114"]
  S16 -->|calls| T16
  S17["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T17["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S17 -->|calls| T17
  S18["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T18["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S18 -->|calls| T18
  S19["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T19["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S19 -->|calls| T19
  S20["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T20["method:JobsDouyinRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:114"]
  S20 -->|calls| T20
  S21["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T21["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S21 -->|calls| T21
  S22["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T22["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S22 -->|calls| T22
  S23["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T23["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S23 -->|calls| T23
  S24["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T24["method:JobsDouyinRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:90"]
  S24 -->|calls| T24
  S25["method:JobsDouyinRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:130"]
  T25["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

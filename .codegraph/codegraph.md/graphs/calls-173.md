# `calls 符号关系 - 173`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTodayNewsRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:116"]
  T1["method:JobsTodayNewsRefreshView::jobs_removeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:386"]
  S1 -->|calls| T1
  S2["method:JobsTodayNewsRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:116"]
  T2["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  S2 -->|calls| T2
  S3["method:JobsTodayNewsRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:116"]
  T3["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  S3 -->|calls| T3
  S4["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T4["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S4 -->|calls| T4
  S5["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T5["method:JobsTodayNewsRefreshView::jobs_removeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:386"]
  S5 -->|calls| T5
  S6["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T6["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  S6 -->|calls| T6
  S7["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T7["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S7 -->|calls| T7
  S8["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T8["method:JobsTodayNewsRefreshView::jobs_removeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:386"]
  S8 -->|calls| T8
  S9["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T9["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  S9 -->|calls| T9
  S10["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T10["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S10 -->|calls| T10
  S11["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T11["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S11 -->|calls| T11
  S12["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T12["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S12 -->|calls| T12
  S13["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T13["method:JobsTodayNewsRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:92"]
  S13 -->|calls| T13
  S14["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T14["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S14 -->|calls| T14
  S15["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T15["method:JobsTodayNewsRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:116"]
  S15 -->|calls| T15
  S16["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T16["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S16 -->|calls| T16
  S17["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T17["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S17 -->|calls| T17
  S18["method:JobsTodayNewsRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:133"]
  T18["method:JobsTodayNewsRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:116"]
  S18 -->|calls| T18
  S19["method:JobsTodayNewsRefreshView::jobs_setupTodayNewsRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:167"]
  T19["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S19 -->|calls| T19
  S20["method:JobsTodayNewsRefreshView::jobs_setupTodayNewsRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:167"]
  T20["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  S20 -->|calls| T20
  S21["method:JobsTodayNewsRefreshView::jobs_setupTodayNewsRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:167"]
  T21["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  S21 -->|calls| T21
  S22["method:JobsTodayNewsRefreshView::jobs_environmentDidChange<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:195"]
  T22["method:JobsTodayNewsRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:204"]
  S22 -->|calls| T22
  S23["method:JobsTodayNewsRefreshView::jobs_applicationDidEnterBackground<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:199"]
  T23["method:JobsTodayNewsRefreshView::jobs_pauseAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:367"]
  S23 -->|calls| T23
  S24["method:JobsTodayNewsRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:204"]
  T24["method:JobsTodayNewsRefreshView::jobs_removeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:386"]
  S24 -->|calls| T24
  S25["method:JobsTodayNewsRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:204"]
  T25["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

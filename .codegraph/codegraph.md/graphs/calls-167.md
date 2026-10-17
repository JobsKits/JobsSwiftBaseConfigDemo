# `calls 符号关系 - 167`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T1["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S1 -->|calls| T1
  S2["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T2["method:EKAttributes::byPosition<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:20"]
  S2 -->|calls| T2
  S3["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T3["method:CALayer::byBounds<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:16"]
  S3 -->|calls| T3
  S4["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  T4["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S4 -->|calls| T4
  S5["method:JobsDouyinRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:251"]
  T5["method:JobsDouyinRefreshView::jobs_removeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:348"]
  S5 -->|calls| T5
  S6["method:JobsDouyinRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:251"]
  T6["method:JobsDouyinRefreshView::jobs_layoutDots<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:225"]
  S6 -->|calls| T6
  S7["method:JobsDouyinRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:251"]
  T7["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  S7 -->|calls| T7
  S8["method:JobsDouyinRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:251"]
  T8["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  S8 -->|calls| T8
  S9["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T9["method:CAKeyframeAnimation::byTimingFunctions<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:31"]
  S9 -->|calls| T9
  S10["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T10["method:CAKeyframeAnimation::byKeyTimes<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:25"]
  S10 -->|calls| T10
  S11["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T11["method:CAKeyframeAnimation::byValues<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:13"]
  S11 -->|calls| T11
  S12["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T12["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S12 -->|calls| T12
  S13["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T13["method:CAKeyframeAnimation::byTimingFunctions<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:31"]
  S13 -->|calls| T13
  S14["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T14["method:CAKeyframeAnimation::byKeyTimes<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:25"]
  S14 -->|calls| T14
  S15["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T15["method:CAKeyframeAnimation::byValues<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:13"]
  S15 -->|calls| T15
  S16["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T16["method:CAKeyframeAnimation::byTimingFunctions<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:31"]
  S16 -->|calls| T16
  S17["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T17["method:CAKeyframeAnimation::byKeyTimes<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:25"]
  S17 -->|calls| T17
  S18["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T18["method:CAKeyframeAnimation::byValues<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:13"]
  S18 -->|calls| T18
  S19["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T19["method:CAKeyframeAnimation::byCalculationMode<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:37"]
  S19 -->|calls| T19
  S20["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T20["method:CAKeyframeAnimation::byKeyTimes<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:25"]
  S20 -->|calls| T20
  S21["method:JobsDouyinRefreshView::jobs_animationGroup<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:289"]
  T21["method:CAKeyframeAnimation::byValues<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:13"]
  S21 -->|calls| T21
  S22["class:JobsGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:19"]
  T22["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S22 -->|calls| T22
  S23["class:JobsGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:19"]
  T23["method:ASTextContainer::setPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:248"]
  S23 -->|calls| T23
  S24["class:JobsGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:19"]
  T24["method:JobsGIFRefreshView::jobs_setupGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:150"]
  S24 -->|calls| T24
  S25["class:JobsGIFRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:19"]
  T25["method:JobsGIFRefreshView::jobs_decodeGIF<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsGIFRefreshView/JobsGIFRefreshView.swift:160"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

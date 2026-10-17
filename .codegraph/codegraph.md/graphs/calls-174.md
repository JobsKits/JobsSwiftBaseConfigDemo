# `calls 符号关系 - 174`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTodayNewsRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:204"]
  T1["method:JobsTodayNewsRefreshView::jobs_pauseAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:367"]
  S1 -->|calls| T1
  S2["method:JobsTodayNewsRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:204"]
  T2["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  S2 -->|calls| T2
  S3["method:JobsTodayNewsRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:204"]
  T3["method:JobsTodayNewsRefreshView::jobs_resumeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:375"]
  S3 -->|calls| T3
  S4["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  T4["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S4 -->|calls| T4
  S5["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  T5["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S5 -->|calls| T5
  S6["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  T6["method:CALayer::byOpacity<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:225"]
  S6 -->|calls| T6
  S7["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  T7["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S7 -->|calls| T7
  S8["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  T8["method:CAShapeLayer::byLineJoin<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:88"]
  S8 -->|calls| T8
  S9["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  T9["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:82"]
  S9 -->|calls| T9
  S10["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  T10["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S10 -->|calls| T10
  S11["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  T11["method:AttributeContainer::byStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:89"]
  S11 -->|calls| T11
  S12["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  T12["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S12 -->|calls| T12
  S13["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  T13["method:JobsTodayNewsRefreshView::jobs_bowtiePath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:299"]
  S13 -->|calls| T13
  S14["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  T14["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S14 -->|calls| T14
  S15["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  T15["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S15 -->|calls| T15
  S16["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  T16["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:52"]
  S16 -->|calls| T16
  S17["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  T17["method:CAShapeLayer::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:16"]
  S17 -->|calls| T17
  S18["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  T18["method:JobsTodayNewsRefreshView::jobs_bowtiePath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:299"]
  S18 -->|calls| T18
  S19["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  T19["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S19 -->|calls| T19
  S20["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  T20["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S20 -->|calls| T20
  S21["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  T21["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S21 -->|calls| T21
  S22["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T22["method:JobsTodayNewsRefreshView::jobs_removeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:386"]
  S22 -->|calls| T22
  S23["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T23["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  S23 -->|calls| T23
  S24["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T24["method:JobsTodayNewsRefreshView::jobs_applyPullProgress<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:252"]
  S24 -->|calls| T24
  S25["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T25["method:JobsTodayNewsRefreshView::jobs_bowtiePath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:299"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

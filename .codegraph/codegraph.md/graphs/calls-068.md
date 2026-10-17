# `calls 符号关系 - 068`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T1["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S1 -->|calls| T1
  S2["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T2["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S2 -->|calls| T2
  S3["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T3["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S3 -->|calls| T3
  S4["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T4["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S4 -->|calls| T4
  S5["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T5["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S5 -->|calls| T5
  S6["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T6["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S6 -->|calls| T6
  S7["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T7["method:FTDashboardView::makeTicksPath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:217"]
  S7 -->|calls| T7
  S8["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T8["method:CALayer::byAnchorPoint<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:40"]
  S8 -->|calls| T8
  S9["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T9["method:EKAttributes::byPosition<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:20"]
  S9 -->|calls| T9
  S10["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T10["method:CALayer::byBounds<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:16"]
  S10 -->|calls| T10
  S11["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T11["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S11 -->|calls| T11
  S12["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T12["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S12 -->|calls| T12
  S13["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T13["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S13 -->|calls| T13
  S14["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T14["method:FTDashboardView::makeNeedleBasePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:239"]
  S14 -->|calls| T14
  S15["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T15["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S15 -->|calls| T15
  S16["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T16["method:FTDashboardView::needleAngle<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:251"]
  S16 -->|calls| T16
  S17["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T17["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S17 -->|calls| T17
  S18["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T18["method:CAShapeLayer::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:16"]
  S18 -->|calls| T18
  S19["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T19["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S19 -->|calls| T19
  S20["method:FTDashboardView::makeTicksPath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:217"]
  T20["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:17"]
  S20 -->|calls| T20
  S21["method:FTDashboardView::makeTicksPath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:217"]
  T21["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S21 -->|calls| T21
  S22["method:FTDashboardView::makeTicksPath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:217"]
  T22["method:UIBezierPath::byMove<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:16"]
  S22 -->|calls| T22
  S23["method:FTDashboardView::makeNeedleBasePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:239"]
  T23["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:17"]
  S23 -->|calls| T23
  S24["method:FTDashboardView::makeNeedleBasePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:239"]
  T24["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S24 -->|calls| T24
  S25["method:FTDashboardView::makeNeedleBasePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:239"]
  T25["method:UIBezierPath::byMove<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:16"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

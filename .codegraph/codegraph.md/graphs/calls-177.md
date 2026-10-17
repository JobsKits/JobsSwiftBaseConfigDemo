# `calls 符号关系 - 177`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T1["method:CAShapeLayer::byLineJoin<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:88"]
  S1 -->|calls| T1
  S2["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T2["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:82"]
  S2 -->|calls| T2
  S3["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T3["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S3 -->|calls| T3
  S4["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T4["method:AttributeContainer::byStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:89"]
  S4 -->|calls| T4
  S5["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T5["method:JobsProgressBar::byFillColor<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:935"]
  S5 -->|calls| T5
  S6["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T6["method:CALayer::byContentsScale<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:161"]
  S6 -->|calls| T6
  S7["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T7["method:CALayer::byOpacity<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:225"]
  S7 -->|calls| T7
  S8["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T8["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S8 -->|calls| T8
  S9["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T9["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:52"]
  S9 -->|calls| T9
  S10["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T10["method:CAShapeLayer::byLineJoin<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:88"]
  S10 -->|calls| T10
  S11["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T11["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:82"]
  S11 -->|calls| T11
  S12["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T12["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S12 -->|calls| T12
  S13["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T13["method:AttributeContainer::byStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:89"]
  S13 -->|calls| T13
  S14["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T14["method:JobsProgressBar::byFillColor<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:935"]
  S14 -->|calls| T14
  S15["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T15["method:CALayer::byContentsScale<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:161"]
  S15 -->|calls| T15
  S16["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T16["method:UIView::jobs_layoutFuseOuterRingLayers<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:376"]
  S16 -->|calls| T16
  S17["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T17["method:UIView::jobs_updateFuseOuterRing<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:425"]
  S17 -->|calls| T17
  S18["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T18["method:UIView::jobs_updateFuseOuterRingByTimer<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:412"]
  S18 -->|calls| T18
  S19["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T19["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S19 -->|calls| T19
  S20["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T20["method:CALayer::byOpacity<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:225"]
  S20 -->|calls| T20
  S21["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T21["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S21 -->|calls| T21
  S22["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T22["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:52"]
  S22 -->|calls| T22
  S23["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T23["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S23 -->|calls| T23
  S24["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T24["method:CALayer::byOpacity<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:225"]
  S24 -->|calls| T24
  S25["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T25["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

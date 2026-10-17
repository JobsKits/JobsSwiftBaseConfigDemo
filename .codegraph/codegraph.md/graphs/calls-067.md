# `calls 符号关系 - 067`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T1["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S1 -->|calls| T1
  S2["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T2["method:FTDashboardView::handlePan<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:263"]
  S2 -->|calls| T2
  S3["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T3["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S3 -->|calls| T3
  S4["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T4["field:FTDashboardView::valueFormatter<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:45"]
  S4 -->|calls| T4
  S5["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T5["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:18"]
  S5 -->|calls| T5
  S6["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T6["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:12"]
  S6 -->|calls| T6
  S7["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T7["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S7 -->|calls| T7
  S8["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T8["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S8 -->|calls| T8
  S9["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T9["method:FTDashboardView::needleAngle<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:251"]
  S9 -->|calls| T9
  S10["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T10["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:18"]
  S10 -->|calls| T10
  S11["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T11["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:12"]
  S11 -->|calls| T11
  S12["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T12["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S12 -->|calls| T12
  S13["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  T13["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S13 -->|calls| T13
  S14["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T14["method:CALayer::byHidden<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:64"]
  S14 -->|calls| T14
  S15["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T15["method:CALayer::byHidden<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:64"]
  S15 -->|calls| T15
  S16["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T16["method:CALayer::byHidden<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:64"]
  S16 -->|calls| T16
  S17["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T17["method:CALayer::byHidden<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:64"]
  S17 -->|calls| T17
  S18["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T18["method:CALayer::byHidden<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:64"]
  S18 -->|calls| T18
  S19["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T19["method:CALayer::byHidden<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:64"]
  S19 -->|calls| T19
  S20["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T20["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:49"]
  S20 -->|calls| T20
  S21["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T21["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S21 -->|calls| T21
  S22["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T22["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S22 -->|calls| T22
  S23["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T23["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S23 -->|calls| T23
  S24["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T24["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S24 -->|calls| T24
  S25["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  T25["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

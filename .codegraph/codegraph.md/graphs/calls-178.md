# `calls 符号关系 - 178`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T1["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:52"]
  S1 -->|calls| T1
  S2["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T2["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:18"]
  S2 -->|calls| T2
  S3["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T3["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:12"]
  S3 -->|calls| T3
  S4["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  T4["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S4 -->|calls| T4
  S5["method:UIView::byFuseOuterRingLayoutIfNeeded<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:370"]
  T5["method:UIView::jobs_layoutFuseOuterRingLayers<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:376"]
  S5 -->|calls| T5
  S6["method:UIView::jobs_layoutFuseOuterRingLayers<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:376"]
  T6["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:49"]
  S6 -->|calls| T6
  S7["method:UIView::jobs_layoutFuseOuterRingLayers<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:376"]
  T7["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:32"]
  S7 -->|calls| T7
  S8["method:UIView::jobs_layoutFuseOuterRingLayers<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:376"]
  T8["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S8 -->|calls| T8
  S9["method:UIView::jobs_layoutFuseOuterRingLayers<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:376"]
  T9["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S9 -->|calls| T9
  S10["method:UIView::jobs_layoutFuseOuterRingLayers<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:376"]
  T10["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S10 -->|calls| T10
  S11["method:UIView::jobs_layoutFuseOuterRingLayers<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:376"]
  T11["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S11 -->|calls| T11
  S12["method:UIView::jobs_layoutFuseOuterRingLayers<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:376"]
  T12["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S12 -->|calls| T12
  S13["method:UIView::jobs_updateFuseOuterRingByTimer<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:412"]
  T13["method:UIView::jobs_updateFuseOuterRing<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:425"]
  S13 -->|calls| T13
  S14["method:UIView::jobs_updateFuseOuterRing<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:425"]
  T14["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S14 -->|calls| T14
  S15["method:UIView::jobs_updateFuseOuterRing<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:425"]
  T15["method:CALayer::byOpacity<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:225"]
  S15 -->|calls| T15
  S16["method:UIView::jobs_updateFuseOuterRing<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:425"]
  T16["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S16 -->|calls| T16
  S17["method:UIView::jobs_updateFuseOuterRing<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:425"]
  T17["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:52"]
  S17 -->|calls| T17
  S18["property:UIView::jobs_fuseScaleOriginalTransform<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:442"]
  T18["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S18 -->|calls| T18
  S19["method:UIView::byFusePressStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:513"]
  T19["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  S19 -->|calls| T19
  S20["method:UIView::byFusePressStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:513"]
  T20["method:UIView::byFusePressScaleStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:456"]
  S20 -->|calls| T20
  S21["method:UIView::byFusePressStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:524"]
  T21["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  S21 -->|calls| T21
  S22["method:UIView::byFusePressStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:524"]
  T22["method:UIView::byFusePressScaleStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:480"]
  S22 -->|calls| T22
  S23["method:UIView::byFusePlaySound<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:532"]
  T23["method:JobsFuseSoundStore::soundID<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:27"]
  S23 -->|calls| T23
  S24["class:JobsChargingAnimationView<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:593"]
  T24["method:JobsChargingAnimationView::jobs_setupChargingAnimation<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:719"]
  S24 -->|calls| T24
  S25["class:JobsChargingAnimationView<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:593"]
  T25["method:JobsChargingAnimationView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:641"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

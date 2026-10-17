# `calls 符号关系 - 135`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T1["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S1 -->|calls| T1
  S2["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T2["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:52"]
  S2 -->|calls| T2
  S3["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T3["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S3 -->|calls| T3
  S4["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T4["method:UIView::jobs_removeFuseLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:235"]
  S4 -->|calls| T4
  S5["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T5["property:UIView::jobs_fuseCompletion<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:97"]
  S5 -->|calls| T5
  S6["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T6["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:12"]
  S6 -->|calls| T6
  S7["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T7["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:12"]
  S7 -->|calls| T7
  S8["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T8["method:CAAnimation::byRemovedOnCompletion<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAAnimation.swift:24"]
  S8 -->|calls| T8
  S9["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T9["method:CAMediaTiming::byFillMode<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAMediaTiming.swift:54"]
  S9 -->|calls| T9
  S10["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T10["method:CAAnimation::byTimingFunction<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAAnimation.swift:12"]
  S10 -->|calls| T10
  S11["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:212"]
  T11["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:201"]
  S11 -->|calls| T11
  S12["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:212"]
  T12["method:UIView::jobs_removeFuseLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:235"]
  S12 -->|calls| T12
  S13["method:UIView::jobs_layoutFuseIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:224"]
  T13["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:32"]
  S13 -->|calls| T13
  S14["method:UIView::jobs_layoutFuseIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:224"]
  T14["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S14 -->|calls| T14
  S15["method:UIView::jobs_layoutFuseIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:224"]
  T15["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S15 -->|calls| T15
  S16["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:244"]
  T16["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:212"]
  S16 -->|calls| T16
  S17["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:244"]
  T17["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S17 -->|calls| T17
  S18["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:244"]
  T18["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:32"]
  S18 -->|calls| T18
  S19["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:244"]
  T19["method:AttributeContainer::byStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:89"]
  S19 -->|calls| T19
  S20["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:244"]
  T20["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S20 -->|calls| T20
  S21["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:244"]
  T21["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S21 -->|calls| T21
  S22["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:244"]
  T22["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S22 -->|calls| T22
  S23["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:244"]
  T23["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S23 -->|calls| T23
  S24["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:244"]
  T24["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S24 -->|calls| T24
  S25["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:244"]
  T25["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

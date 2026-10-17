# `calls 符号关系 - 075`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:SphereTagCloudView::tick<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:224"]
  T1["method:SphereTagCloudView::rotate<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:271"]
  S1 -->|calls| T1
  S2["method:SphereTagCloudView::tick<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:224"]
  T2["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:294"]
  S2 -->|calls| T2
  S3["method:SphereTagCloudView::distributeIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:255"]
  T3["field:SphereTagCloudView::nodes<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:54"]
  S3 -->|calls| T3
  S4["method:SphereTagCloudView::rotate<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:271"]
  T4["field:SphereTagCloudView::nodes<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:54"]
  S4 -->|calls| T4
  S5["method:SphereTagCloudView::rotate<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:271"]
  T5["field:SphereTagCloudView::nodes<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:54"]
  S5 -->|calls| T5
  S6["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:294"]
  T6["field:SphereTagCloudView::nodes<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:54"]
  S6 -->|calls| T6
  S7["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:294"]
  T7["field:SphereTagCloudView::nodes<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:54"]
  S7 -->|calls| T7
  S8["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:294"]
  T8["field:SphereTagCloudView::nodes<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:54"]
  S8 -->|calls| T8
  S9["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:294"]
  T9["field:SphereTagCloudView::nodes<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:54"]
  S9 -->|calls| T9
  S10["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:294"]
  T10["field:SphereTagCloudView::nodes<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:54"]
  S10 -->|calls| T10
  S11["method:SphereTagCloudView::byItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:388"]
  T11["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:83"]
  S11 -->|calls| T11
  S12["class:IrregularButton<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:20"]
  T12["method:IrregularButton::setup<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:38"]
  S12 -->|calls| T12
  S13["class:IrregularButton<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:20"]
  T13["method:IrregularButton::setup<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:38"]
  S13 -->|calls| T13
  S14["method:IrregularButton::setup<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:38"]
  T14["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S14 -->|calls| T14
  S15["method:IrregularButton::setup<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:38"]
  T15["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S15 -->|calls| T15
  S16["method:IrregularButton::setup<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:38"]
  T16["method:AttributeContainer::byStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:89"]
  S16 -->|calls| T16
  S17["method:IrregularButton::setup<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:38"]
  T17["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S17 -->|calls| T17
  S18["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:53"]
  T18["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:69"]
  S18 -->|calls| T18
  S19["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:53"]
  T19["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S19 -->|calls| T19
  S20["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:53"]
  T20["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S20 -->|calls| T20
  S21["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:53"]
  T21["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S21 -->|calls| T21
  S22["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:53"]
  T22["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S22 -->|calls| T22
  S23["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:69"]
  T23["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:17"]
  S23 -->|calls| T23
  S24["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:69"]
  T24["method:IrregularButton::scaled<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:79"]
  S24 -->|calls| T24
  S25["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:69"]
  T25["method:UIBezierPath::byMove<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:16"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 064`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:118"]
  T1["method:CALayer::byHidden<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:64"]
  S1 -->|calls| T1
  S2["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:118"]
  T2["method:JobsClockView::applyTheme<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:126"]
  S2 -->|calls| T2
  S3["method:JobsClockView::applyTheme<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:126"]
  T3["method:JobsThemeCenter::resolvedColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsTheme.swift:220"]
  S3 -->|calls| T3
  S4["method:JobsClockView::applyTheme<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:126"]
  T4["method:JobsThemeCenter::resolvedColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsTheme.swift:220"]
  S4 -->|calls| T4
  S5["method:JobsClockView::applyTheme<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:126"]
  T5["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:34"]
  S5 -->|calls| T5
  S6["method:JobsClockView::applyTheme<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:126"]
  T6["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:34"]
  S6 -->|calls| T6
  S7["method:JobsClockView::applyTheme<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:126"]
  T7["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S7 -->|calls| T7
  S8["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:138"]
  T8["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S8 -->|calls| T8
  S9["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:138"]
  T9["method:CAShapeLayer::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:16"]
  S9 -->|calls| T9
  S10["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:138"]
  T10["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:17"]
  S10 -->|calls| T10
  S11["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:138"]
  T11["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S11 -->|calls| T11
  S12["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:138"]
  T12["method:UIBezierPath::byMove<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:16"]
  S12 -->|calls| T12
  S13["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:138"]
  T13["method:CAShapeLayer::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:16"]
  S13 -->|calls| T13
  S14["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:138"]
  T14["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S14 -->|calls| T14
  S15["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:138"]
  T15["method:CAShapeLayer::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:16"]
  S15 -->|calls| T15
  S16["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:224"]
  T16["method:JobsClockView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:248"]
  S16 -->|calls| T16
  S17["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:224"]
  T17["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:254"]
  S17 -->|calls| T17
  S18["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:224"]
  T18["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S18 -->|calls| T18
  S19["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:224"]
  T19["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:254"]
  S19 -->|calls| T19
  S20["method:JobsClockView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:248"]
  T20["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S20 -->|calls| T20
  S21["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:254"]
  T21["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S21 -->|calls| T21
  S22["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:254"]
  T22["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S22 -->|calls| T22
  S23["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:254"]
  T23["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S23 -->|calls| T23
  S24["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:254"]
  T24["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S24 -->|calls| T24
  S25["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:254"]
  T25["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

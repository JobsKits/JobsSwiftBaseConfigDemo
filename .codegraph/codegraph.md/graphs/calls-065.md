# `calls 符号关系 - 065`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:254"]
  T1["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S1 -->|calls| T1
  S2["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:254"]
  T2["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  S2 -->|calls| T2
  S3["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:96"]
  T3["method:JobsDialogBoxBuilder::byCornerRadius<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:71"]
  S3 -->|calls| T3
  S4["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:96"]
  T4["method:RTBadgeConfig::byShadowOffset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:110"]
  S4 -->|calls| T4
  S5["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:96"]
  T5["method:RTBadgeConfig::byShadowRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:100"]
  S5 -->|calls| T5
  S6["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:96"]
  T6["method:RTBadgeConfig::byShadowOpacity<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:105"]
  S6 -->|calls| T6
  S7["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:96"]
  T7["method:JobsDirection::resolved<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:373"]
  S7 -->|calls| T7
  S8["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:96"]
  T8["method:JobsDialogBoxView::installOutsideTapDismiss<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:340"]
  S8 -->|calls| T8
  S9["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:96"]
  T9["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S9 -->|calls| T9
  S10["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:96"]
  T10["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S10 -->|calls| T10
  S11["method:JobsDialogBoxBuilder::computeArrowRatio<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:187"]
  T11["function:JobsDialogBoxBuilder::computeArrowRatio::clamp<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:193"]
  S11 -->|calls| T11
  S12["method:JobsDialogBoxBuilder::computeArrowRatio<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:187"]
  T12["function:JobsDialogBoxBuilder::computeArrowRatio::clamp<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:193"]
  S12 -->|calls| T12
  S13["method:UIView::byDialogBoxContent<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:218"]
  T13["method:UIView::byDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:214"]
  S13 -->|calls| T13
  S14["class:JobsDialogBoxView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:223"]
  T14["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S14 -->|calls| T14
  S15["class:JobsDialogBoxView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:223"]
  T15["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S15 -->|calls| T15
  S16["class:JobsDialogBoxView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:223"]
  T16["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S16 -->|calls| T16
  S17["class:JobsDialogBoxView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:223"]
  T17["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S17 -->|calls| T17
  S18["class:JobsDialogBoxView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:223"]
  T18["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/PDFKit/PDFThumbnailView.swift:32"]
  S18 -->|calls| T18
  S19["method:JobsDialogBoxView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:247"]
  T19["method:JobsDialogBoxView::updateShape<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:253"]
  S19 -->|calls| T19
  S20["method:JobsDialogBoxView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:247"]
  T20["method:JobsDialogBoxView::layoutContent<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:260"]
  S20 -->|calls| T20
  S21["method:JobsDialogBoxView::updateShape<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:253"]
  T21["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S21 -->|calls| T21
  S22["method:JobsDialogBoxView::updateShape<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:253"]
  T22["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S22 -->|calls| T22
  S23["method:JobsDialogBoxView::updateShape<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:253"]
  T23["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S23 -->|calls| T23
  S24["method:JobsDialogBoxView::updateShape<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:253"]
  T24["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  S24 -->|calls| T24
  S25["method:JobsDialogBoxView::layoutContent<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:260"]
  T25["method:JobsDialogBoxView::bubbleRect<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:266"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

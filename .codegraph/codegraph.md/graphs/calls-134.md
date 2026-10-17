# `calls 符号关系 - 134`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T1["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:99"]
  S1 -->|calls| T1
  S2["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T2["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S2 -->|calls| T2
  S3["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T3["method:_InsetLabel::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:335"]
  S3 -->|calls| T3
  S4["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T4["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:26"]
  S4 -->|calls| T4
  S5["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T5["method:RTBadgeConfig::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:70"]
  S5 -->|calls| T5
  S6["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T6["method:RTBadgeConfig::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:65"]
  S6 -->|calls| T6
  S7["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T7["method:UILabel::byAttributedString<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:21"]
  S7 -->|calls| T7
  S8["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T8["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S8 -->|calls| T8
  S9["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T9["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S9 -->|calls| T9
  S10["method:UIView::installRTBadgeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:285"]
  T10["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S10 -->|calls| T10
  S11["method:UIView::installRTBadgeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:285"]
  T11["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S11 -->|calls| T11
  S12["class:_InsetLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:299"]
  T12["method:UIView::refresh<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:631"]
  S12 -->|calls| T12
  S13["class:_InsetLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:299"]
  T13["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:590"]
  S13 -->|calls| T13
  S14["method:UIView::jobs_fireConfirm<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+回调@确认和取消.swift:58"]
  T14["property:UIView::confirmHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+回调@确认和取消.swift:22"]
  S14 -->|calls| T14
  S15["method:UIView::jobs_fireCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+回调@确认和取消.swift:62"]
  T15["property:UIView::cancelHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+回调@确认和取消.swift:34"]
  S15 -->|calls| T15
  S16["method:UIView::byFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:111"]
  T16["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  S16 -->|calls| T16
  S17["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T17["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:212"]
  S17 -->|calls| T17
  S18["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T18["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:212"]
  S18 -->|calls| T18
  S19["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T19["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S19 -->|calls| T19
  S20["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T20["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:32"]
  S20 -->|calls| T20
  S21["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T21["method:AttributeContainer::byStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:89"]
  S21 -->|calls| T21
  S22["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T22["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S22 -->|calls| T22
  S23["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T23["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S23 -->|calls| T23
  S24["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T24["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S24 -->|calls| T24
  S25["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:126"]
  T25["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

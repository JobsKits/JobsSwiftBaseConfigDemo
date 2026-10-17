# `calls 符号关系 - 066`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDialogBoxView::layoutContent<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:260"]
  T1["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S1 -->|calls| T1
  S2["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T2["method:JobsDialogBoxView::bubbleRect<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:266"]
  S2 -->|calls| T2
  S3["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T3["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:32"]
  S3 -->|calls| T3
  S4["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T4["method:UIBezierPath::byClose<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:43"]
  S4 -->|calls| T4
  S5["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T5["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S5 -->|calls| T5
  S6["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T6["method:UIBezierPath::byMove<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:16"]
  S6 -->|calls| T6
  S7["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T7["method:UIBezierPath::byClose<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:43"]
  S7 -->|calls| T7
  S8["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T8["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S8 -->|calls| T8
  S9["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T9["method:UIBezierPath::byMove<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:16"]
  S9 -->|calls| T9
  S10["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T10["method:UIBezierPath::byClose<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:43"]
  S10 -->|calls| T10
  S11["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T11["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S11 -->|calls| T11
  S12["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T12["method:UIBezierPath::byMove<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:16"]
  S12 -->|calls| T12
  S13["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T13["method:UIBezierPath::byClose<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:43"]
  S13 -->|calls| T13
  S14["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T14["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S14 -->|calls| T14
  S15["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:287"]
  T15["method:UIBezierPath::byMove<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:16"]
  S15 -->|calls| T15
  S16["method:JobsDialogBoxView::installOutsideTapDismiss<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:340"]
  T16["method:UIControl::byAddAction<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIControl/UIControl+DSL.swift:196"]
  S16 -->|calls| T16
  S17["method:JobsDialogBoxView::installOutsideTapDismiss<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:340"]
  T17["method:JobsDialogBoxView::dismiss<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:355"]
  S17 -->|calls| T17
  S18["method:JobsDialogBoxView::installOutsideTapDismiss<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:340"]
  T18["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S18 -->|calls| T18
  S19["method:JobsDialogBoxView::dismiss<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:355"]
  T19["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S19 -->|calls| T19
  S20["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T20["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S20 -->|calls| T20
  S21["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T21["method:UILabel::byFont<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:81"]
  S21 -->|calls| T21
  S22["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T22["method:FTDashboardView::updateDragGestureEnabled<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:256"]
  S22 -->|calls| T22
  S23["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T23["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S23 -->|calls| T23
  S24["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T24["field:FTDashboardView::valueFormatter<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:45"]
  S24 -->|calls| T24
  S25["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T25["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

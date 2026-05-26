# `calls 符号关系 - 010`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T1["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S1 -->|calls| T1
  S2["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T2["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S2 -->|calls| T2
  S3["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T3["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:83"]
  S3 -->|calls| T3
  S4["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T4["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:35"]
  S4 -->|calls| T4
  S5["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T5["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S5 -->|calls| T5
  S6["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T6["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S6 -->|calls| T6
  S7["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T7["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:59"]
  S7 -->|calls| T7
  S8["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T8["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:83"]
  S8 -->|calls| T8
  S9["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T9["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:35"]
  S9 -->|calls| T9
  S10["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T10["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S10 -->|calls| T10
  S11["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T11["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S11 -->|calls| T11
  S12["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T12["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:83"]
  S12 -->|calls| T12
  S13["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T13["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:35"]
  S13 -->|calls| T13
  S14["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T14["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S14 -->|calls| T14
  S15["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T15["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S15 -->|calls| T15
  S16["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T16["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S16 -->|calls| T16
  S17["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T17["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:83"]
  S17 -->|calls| T17
  S18["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T18["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:35"]
  S18 -->|calls| T18
  S19["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T19["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S19 -->|calls| T19
  S20["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T20["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S20 -->|calls| T20
  S21["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T21["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S21 -->|calls| T21
  S22["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:105"]
  T22["method:FTDashboardView::needleAngle<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:251"]
  S22 -->|calls| T22
  S23["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  T23["method:CALayer::byHidden<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:65"]
  S23 -->|calls| T23
  S24["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  T24["method:CALayer::byHidden<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:65"]
  S24 -->|calls| T24
  S25["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  T25["method:CALayer::byHidden<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:65"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

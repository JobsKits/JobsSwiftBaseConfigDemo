# `calls 符号关系 - 185`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:GestureUnlockView::trySelectNode<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:191"]
  T1["method:GestureUnlockView::appendNodeIndexWithInterpolation<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:207"]
  S1 -->|calls| T1
  S2["method:GestureUnlockView::appendNodeIndexWithInterpolation<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:207"]
  T2["method:GestureUnlockView::interpolatedIndices<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:233"]
  S2 -->|calls| T2
  S3["method:GestureUnlockView::appendNodeIndexWithInterpolation<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:207"]
  T3["method:GestureUnlockView::selectIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:218"]
  S3 -->|calls| T3
  S4["method:GestureUnlockView::appendNodeIndexWithInterpolation<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:207"]
  T4["method:GestureUnlockView::selectIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:218"]
  S4 -->|calls| T4
  S5["method:GestureUnlockView::selectIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:218"]
  T5["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:58"]
  S5 -->|calls| T5
  S6["method:GestureUnlockView::selectIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:218"]
  T6["field:GestureUnlockView::nodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:50"]
  S6 -->|calls| T6
  S7["method:GestureUnlockView::selectIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:218"]
  T7["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:293"]
  S7 -->|calls| T7
  S8["method:GestureUnlockView::interpolatedIndices<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:233"]
  T8["method:GestureUnlockView::gcd<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:254"]
  S8 -->|calls| T8
  S9["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T9["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:17"]
  S9 -->|calls| T9
  S10["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T10["field:GestureUnlockView::nodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:50"]
  S10 -->|calls| T10
  S11["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T11["method:UIBezierPath::byMove<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:16"]
  S11 -->|calls| T11
  S12["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T12["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:82"]
  S12 -->|calls| T12
  S13["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T13["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S13 -->|calls| T13
  S14["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T14["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S14 -->|calls| T14
  S15["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T15["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S15 -->|calls| T15
  S16["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T16["method:CAShapeLayer::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:16"]
  S16 -->|calls| T16
  S17["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T17["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:34"]
  S17 -->|calls| T17
  S18["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T18["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:34"]
  S18 -->|calls| T18
  S19["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  T19["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:34"]
  S19 -->|calls| T19
  S20["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:293"]
  T20["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  S20 -->|calls| T20
  S21["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:293"]
  T21["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:58"]
  S21 -->|calls| T21
  S22["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:293"]
  T22["field:GestureUnlockView::nodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:50"]
  S22 -->|calls| T22
  S23["function:jobsGetMainWindow<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:17"]
  T23["function:jobsGetMainWindowAfter13<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:37"]
  S23 -->|calls| T23
  S24["function:jobsGetMainWindow<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:17"]
  T24["function:jobsGetMainWindowBefore13<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:25"]
  S24 -->|calls| T24
  S25["function:jobsGetMainWindow<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:17"]
  T25["function:jobsGetMainWindowBefore13<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

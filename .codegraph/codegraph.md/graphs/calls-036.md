# `calls 符号关系 - 036`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:466"]
  T1["method:UIButton::byImagePlacementLegacy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:530"]
  S1 -->|calls| T1
  S2["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:476"]
  T2["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S2 -->|calls| T2
  S3["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:476"]
  T3["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S3 -->|calls| T3
  S4["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:476"]
  T4["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S4 -->|calls| T4
  S5["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:476"]
  T5["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S5 -->|calls| T5
  S6["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:476"]
  T6["method:UIButton::StateProxy::titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1018"]
  S6 -->|calls| T6
  S7["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:476"]
  T7["method:UIButton::StateProxy::titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1018"]
  S7 -->|calls| T7
  S8["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:476"]
  T8["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S8 -->|calls| T8
  S9["method:UIButton::byImagePlacementLegacy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:530"]
  T9["function:UIButton::byImagePlacementLegacy::safeImageSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:542"]
  S9 -->|calls| T9
  S10["method:UIButton::byImagePlacementLegacy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:530"]
  T10["function:UIButton::byImagePlacementLegacy::safeTitleSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:547"]
  S10 -->|calls| T10
  S11["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:621"]
  T11["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:621"]
  S11 -->|calls| T11
  S12["method:UIButton::byConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:627"]
  T12["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  S12 -->|calls| T12
  S13["method:UIButton::byConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:627"]
  T13["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S13 -->|calls| T13
  S14["method:UIButton::byConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:627"]
  T14["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S14 -->|calls| T14
  S15["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:641"]
  T15["enum:UIButton::_JobsLegacyImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:643"]
  S15 -->|calls| T15
  S16["method:UIButton::_jobsSyncLegacyInsetsIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:674"]
  T16["method:UIButton::_jobsShiftEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:666"]
  S16 -->|calls| T16
  S17["method:UIButton::_jobsSyncLegacyInsetsIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:674"]
  T17["method:UIButton::_jobsShiftEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:666"]
  S17 -->|calls| T17
  S18["method:UIButton::_jobsSyncLegacyInsetsIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:674"]
  T18["method:UIButton::_jobsShiftEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:666"]
  S18 -->|calls| T18
  S19["method:UIButton::_jobsSyncLegacyInsetsIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:674"]
  T19["method:UIButton::_jobsShiftEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:666"]
  S19 -->|calls| T19
  S20["method:UIButton::_jobsSyncLegacyInsetsIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:674"]
  T20["method:UIButton::_jobsShiftEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:666"]
  S20 -->|calls| T20
  S21["method:UIButton::_jobsSyncLegacyInsetsIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:674"]
  T21["method:UIButton::_jobsShiftEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:666"]
  S21 -->|calls| T21
  S22["method:UIButton::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:699"]
  T22["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  S22 -->|calls| T22
  S23["method:UIButton::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:699"]
  T23["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S23 -->|calls| T23
  S24["method:UIButton::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:725"]
  T24["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S24 -->|calls| T24
  S25["method:UIButton::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:725"]
  T25["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

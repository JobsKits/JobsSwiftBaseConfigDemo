# `calls 符号关系 - 130`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:_ASPendingState::ASPendingStateApplyMetricsToLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:178"]
  T1["function:ASBoundsAndPositionForFrame<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:83"]
  S1 -->|calls| T1
  S2["method:_ASPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  T2["method:_ASPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  S2 -->|calls| T2
  S3["method:_ASPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  T3["function:ASDefaultAllowsGroupOpacity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:20"]
  S3 -->|calls| T3
  S4["method:_ASPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  T4["function:ASDefaultAllowsEdgeAntialiasing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:31"]
  S4 -->|calls| T4
  S5["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  T5["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S5 -->|calls| T5
  S6["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  T6["function:ASDisplayNodeCAContentsGravityFromUIContentMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:133"]
  S6 -->|calls| T6
  S7["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  T7["function:_ASPendingState::ASPendingStateApplyMetricsToLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:178"]
  S7 -->|calls| T7
  S8["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  T8["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S8 -->|calls| T8
  S9["method:_ASPendingState::applyToView:withSpecialPropertiesHandling:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:1043"]
  T9["method:_ASDisplayView::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:253"]
  S9 -->|calls| T9
  S10["method:_ASPendingState::applyToView:withSpecialPropertiesHandling:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:1043"]
  T10["function:_ASPendingState::ASPendingStateApplyMetricsToLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:178"]
  S10 -->|calls| T10
  S11["method:_ASPendingState::pendingViewStateFromLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:1271"]
  T11["method:_ASPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  S11 -->|calls| T11
  S12["method:_ASPendingState::pendingViewStateFromLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:1271"]
  T12["function:ASDisplayNodeUIContentModeFromCAContentsGravity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:148"]
  S12 -->|calls| T12
  S13["method:_ASPendingState::pendingViewStateFromView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:1310"]
  T13["method:_ASPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T14["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T15["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T16["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T17["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T18["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T19["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T20["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T21["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T22["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T23["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T24["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["function:_setSharedDebugOption<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:39"]
  T25["function:_initSharedDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 023`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASButtonNode::setBackgroundImage:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:471"]
  T1["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  S1 -->|calls| T1
  S2["method:ASButtonNode::layoutSpecThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:520"]
  T2["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S2 -->|calls| T2
  S3["method:ASButtonNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  T3["method:ASButtonNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h:1"]
  T4["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h:1"]
  T5["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h:1"]
  T6["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S6 -->|calls| T6
  S7["method:ASCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:48"]
  T7["method:ASCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:48"]
  S7 -->|calls| T7
  S8["method:ASCellNode::initWithViewControllerBlock:didLoadBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:61"]
  T8["method:ASCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:48"]
  S8 -->|calls| T8
  S9["method:ASCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:73"]
  T9["method:ASCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:73"]
  S9 -->|calls| T9
  S10["method:ASCellNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:105"]
  T10["method:ASCellNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:105"]
  S10 -->|calls| T10
  S11["method:ASCellNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:112"]
  T11["method:ASCellNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:112"]
  S11 -->|calls| T11
  S12["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:121"]
  T12["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:121"]
  S12 -->|calls| T12
  S13["method:ASCellNode::setSelected:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:135"]
  T13["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S13 -->|calls| T13
  S14["method:ASCellNode::setHighlighted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:151"]
  T14["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S14 -->|calls| T14
  S15["method:ASCellNode::viewController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:192"]
  T15["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S15 -->|calls| T15
  S16["method:ASCellNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:266"]
  T16["method:ASCellNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:266"]
  S16 -->|calls| T16
  S17["method:ASCellNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:275"]
  T17["method:ASCellNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:275"]
  S17 -->|calls| T17
  S18["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T18["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S18 -->|calls| T18
  S19["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T19["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S19 -->|calls| T19
  S20["method:ASCellNode::handleVisibilityChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:297"]
  T20["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S20 -->|calls| T20
  S21["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T21["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S21 -->|calls| T21
  S22["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T22["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S22 -->|calls| T22
  S23["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T23["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S23 -->|calls| T23
  S24["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T24["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:412"]
  S24 -->|calls| T24
  S25["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T25["method:ASTextCellNode::defaultTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:429"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

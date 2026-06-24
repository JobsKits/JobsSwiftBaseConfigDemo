# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCellNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:112"]
  T1["method:ASCellNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:112"]
  S1 -->|calls| T1
  S2["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:121"]
  T2["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:121"]
  S2 -->|calls| T2
  S3["method:ASCellNode::setSelected:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:135"]
  T3["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S3 -->|calls| T3
  S4["method:ASCellNode::setHighlighted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:151"]
  T4["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S4 -->|calls| T4
  S5["method:ASCellNode::viewController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:192"]
  T5["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S5 -->|calls| T5
  S6["method:ASCellNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:266"]
  T6["method:ASCellNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:266"]
  S6 -->|calls| T6
  S7["method:ASCellNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:275"]
  T7["method:ASCellNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:275"]
  S7 -->|calls| T7
  S8["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T8["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S8 -->|calls| T8
  S9["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T9["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S9 -->|calls| T9
  S10["method:ASCellNode::handleVisibilityChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:297"]
  T10["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S10 -->|calls| T10
  S11["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T11["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S11 -->|calls| T11
  S12["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T12["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S12 -->|calls| T12
  S13["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T13["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S13 -->|calls| T13
  S14["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T14["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:412"]
  S14 -->|calls| T14
  S15["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T15["method:ASTextCellNode::defaultTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:429"]
  S15 -->|calls| T15
  S16["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T16["method:ASTextCellNode::defaultTextInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:434"]
  S16 -->|calls| T16
  S17["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:412"]
  T17["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S17 -->|calls| T17
  S18["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:412"]
  T18["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S18 -->|calls| T18
  S19["method:ASTextCellNode::setTextAttributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:444"]
  T19["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:478"]
  S19 -->|calls| T19
  S20["method:ASTextCellNode::setTextInsets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:458"]
  T20["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S20 -->|calls| T20
  S21["method:ASTextCellNode::setText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:470"]
  T21["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:478"]
  S21 -->|calls| T21
  S22["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:478"]
  T22["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S22 -->|calls| T22
  S23["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:478"]
  T23["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:1"]
  T24["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T25["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

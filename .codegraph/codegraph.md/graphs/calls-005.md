# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCellNode::handleVisibilityChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:297"]
  T1["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S1 -->|calls| T1
  S2["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T2["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S2 -->|calls| T2
  S3["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T3["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S3 -->|calls| T3
  S4["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T4["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S4 -->|calls| T4
  S5["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T5["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:412"]
  S5 -->|calls| T5
  S6["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T6["method:ASTextCellNode::defaultTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:429"]
  S6 -->|calls| T6
  S7["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T7["method:ASTextCellNode::defaultTextInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:434"]
  S7 -->|calls| T7
  S8["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:412"]
  T8["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S8 -->|calls| T8
  S9["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:412"]
  T9["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S9 -->|calls| T9
  S10["method:ASTextCellNode::setTextAttributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:444"]
  T10["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:478"]
  S10 -->|calls| T10
  S11["method:ASTextCellNode::setTextInsets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:458"]
  T11["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S11 -->|calls| T11
  S12["method:ASTextCellNode::setText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:470"]
  T12["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:478"]
  S12 -->|calls| T12
  S13["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:478"]
  T13["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S13 -->|calls| T13
  S14["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:478"]
  T14["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:1"]
  T15["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T16["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T17["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T18["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T19["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T20["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T21["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T22["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T23["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T24["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T25["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

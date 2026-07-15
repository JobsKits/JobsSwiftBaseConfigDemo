# `calls 符号关系 - 004`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASButtonNode::setLaysOutHorizontally:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:261"]
  T1["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S1 -->|calls| T1
  S2["method:ASButtonNode::setLaysOutHorizontally:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:261"]
  T2["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S2 -->|calls| T2
  S3["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  T3["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S3 -->|calls| T3
  S4["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  T4["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S4 -->|calls| T4
  S5["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  T5["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  S5 -->|calls| T5
  S6["method:ASButtonNode::setImage:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:414"]
  T6["method:ASButtonNode::updateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  S6 -->|calls| T6
  S7["method:ASButtonNode::setBackgroundImage:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:471"]
  T7["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  S7 -->|calls| T7
  S8["method:ASButtonNode::layoutSpecThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:520"]
  T8["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S8 -->|calls| T8
  S9["method:ASButtonNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  T9["method:ASButtonNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h:1"]
  T10["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h:1"]
  T11["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.h:1"]
  T12["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S12 -->|calls| T12
  S13["method:ASCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:48"]
  T13["method:ASCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:48"]
  S13 -->|calls| T13
  S14["method:ASCellNode::initWithViewControllerBlock:didLoadBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:61"]
  T14["method:ASCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:48"]
  S14 -->|calls| T14
  S15["method:ASCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:73"]
  T15["method:ASCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:73"]
  S15 -->|calls| T15
  S16["method:ASCellNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:105"]
  T16["method:ASCellNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:105"]
  S16 -->|calls| T16
  S17["method:ASCellNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:112"]
  T17["method:ASCellNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:112"]
  S17 -->|calls| T17
  S18["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:121"]
  T18["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:121"]
  S18 -->|calls| T18
  S19["method:ASCellNode::setSelected:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:135"]
  T19["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S19 -->|calls| T19
  S20["method:ASCellNode::setHighlighted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:151"]
  T20["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S20 -->|calls| T20
  S21["method:ASCellNode::viewController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:192"]
  T21["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S21 -->|calls| T21
  S22["method:ASCellNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:266"]
  T22["method:ASCellNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:266"]
  S22 -->|calls| T22
  S23["method:ASCellNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:275"]
  T23["method:ASCellNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:275"]
  S23 -->|calls| T23
  S24["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T24["method:ASTextCellNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S24 -->|calls| T24
  S25["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T25["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 073`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTabBarController::setSelectedIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:66"]
  T1["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S1 -->|calls| T1
  S2["method:ASTabBarController::setSelectedIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:66"]
  T2["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S2 -->|calls| T2
  S3["method:ASTabBarController::setSelectedViewController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:75"]
  T3["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S3 -->|calls| T3
  S4["method:ASTabBarController::setSelectedViewController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:75"]
  T4["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T5["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T6["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T7["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T8["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T9["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T10["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T11["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T12["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T13["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T14["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T15["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S15 -->|calls| T15
  S16["method:_ASTablePendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:51"]
  T16["method:_ASTablePendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:51"]
  S16 -->|calls| T16
  S17["method:_ASTablePendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:51"]
  T17["method:ASAbstractLayoutController::defaultTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:90"]
  S17 -->|calls| T17
  S18["method:_ASTablePendingState::tuningParametersForRangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:74"]
  T18["method:_ASTablePendingState::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:84"]
  S18 -->|calls| T18
  S19["method:_ASTablePendingState::setTuningParameters:forRangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:79"]
  T19["method:_ASTablePendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:90"]
  S19 -->|calls| T19
  S20["method:_ASTablePendingState::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:84"]
  T20["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S20 -->|calls| T20
  S21["method:_ASTablePendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:90"]
  T21["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S21 -->|calls| T21
  S22["method:ASTableNode::initWithStyle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:114"]
  T22["method:ASTableNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:127"]
  S22 -->|calls| T22
  S23["method:ASTableNode::initWithStyle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:114"]
  T23["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:313"]
  S23 -->|calls| T23
  S24["method:ASTableNode::dealloc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:133"]
  T24["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S24 -->|calls| T24
  S25["method:ASTableNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:146"]
  T25["method:ASTableNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:146"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

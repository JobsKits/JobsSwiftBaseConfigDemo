# `calls 符号关系 - 054`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T1["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S1 -->|calls| T1
  S2["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T2["function:ASPointsValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S2 -->|calls| T2
  S3["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T3["function:ASPointsValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S3 -->|calls| T3
  S4["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T4["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S4 -->|calls| T4
  S5["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T5["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S5 -->|calls| T5
  S6["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T6["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S6 -->|calls| T6
  S7["method:ASScrollNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  T7["method:ASScrollNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  S7 -->|calls| T7
  S8["method:ASScrollNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  T8["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S8 -->|calls| T8
  S9["method:ASScrollNode::setAutomaticallyManagesContentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:159"]
  T9["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S9 -->|calls| T9
  S10["method:ASScrollNode::setAutomaticallyManagesContentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:159"]
  T10["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S10 -->|calls| T10
  S11["method:ASScrollNode::setScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:178"]
  T11["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S11 -->|calls| T11
  S12["method:ASTabBarController::setViewControllers:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:54"]
  T12["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S12 -->|calls| T12
  S13["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  T13["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  S13 -->|calls| T13
  S14["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  T14["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S14 -->|calls| T14
  S15["method:ASTabBarController::setSelectedIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:66"]
  T15["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S15 -->|calls| T15
  S16["method:ASTabBarController::setSelectedIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:66"]
  T16["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S16 -->|calls| T16
  S17["method:ASTabBarController::setSelectedViewController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:75"]
  T17["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S17 -->|calls| T17
  S18["method:ASTabBarController::setSelectedViewController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:75"]
  T18["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T19["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T20["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T21["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T22["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T23["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T24["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.h:1"]
  T25["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

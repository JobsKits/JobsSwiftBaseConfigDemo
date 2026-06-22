# `calls 符号关系 - 036`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T1["method:ASControlNode::endTrackingWithTouch:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:506"]
  S1 -->|calls| T1
  S2["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T2["function:ASControlNode::_ASControlNodeGetExpandedBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:485"]
  S2 -->|calls| T2
  S3["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T3["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S3 -->|calls| T3
  S4["method:ASControlNode::_cancelTrackingWithEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:238"]
  T4["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S4 -->|calls| T4
  S5["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:251"]
  T5["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:251"]
  S5 -->|calls| T5
  S6["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T6["method:ASControlNode::enableHitTestDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:57"]
  S6 -->|calls| T6
  S7["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T7["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S7 -->|calls| T7
  S8["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T8["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S8 -->|calls| T8
  S9["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T9["function:ASControlNode::_ASEnumerateControlEventsIncludedInMaskWithBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:472"]
  S9 -->|calls| T9
  S10["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T10["function:ASControlNode::_ASControlNodeEventKeyForControlEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:467"]
  S10 -->|calls| T10
  S11["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T11["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S11 -->|calls| T11
  S12["method:ASControlNode::actionsForTarget:forControlEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:342"]
  T12["function:ASControlNode::_ASControlNodeEventKeyForControlEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:467"]
  S12 -->|calls| T12
  S13["method:ASControlNode::actionsForTarget:forControlEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:342"]
  T13["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S13 -->|calls| T13
  S14["method:ASControlNode::allTargets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:367"]
  T14["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S14 -->|calls| T14
  S15["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:384"]
  T15["function:ASControlNode::_ASEnumerateControlEventsIncludedInMaskWithBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:472"]
  S15 -->|calls| T15
  S16["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:384"]
  T16["function:ASControlNode::_ASControlNodeEventKeyForControlEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:467"]
  S16 -->|calls| T16
  S17["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  T17["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S17 -->|calls| T17
  S18["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  T18["function:ASControlNode::_ASEnumerateControlEventsIncludedInMaskWithBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:472"]
  S18 -->|calls| T18
  S19["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  T19["function:ASControlNode::_ASControlNodeEventKeyForControlEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:467"]
  S19 -->|calls| T19
  S20["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  T20["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S20 -->|calls| T20
  S21["function:ASControlNode::_ASEnumerateControlEventsIncludedInMaskWithBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:472"]
  T21["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S21 -->|calls| T21
  S22["method:ASDKNavigationController::popToViewController:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:60"]
  T22["method:ASDKNavigationController::popToViewController:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:60"]
  S22 -->|calls| T22
  S23["method:ASDKNavigationController::popToViewController:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:60"]
  T23["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S23 -->|calls| T23
  S24["method:ASDKNavigationController::popToViewController:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:60"]
  T24["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S24 -->|calls| T24
  S25["method:ASDKNavigationController::popToViewController:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:60"]
  T25["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

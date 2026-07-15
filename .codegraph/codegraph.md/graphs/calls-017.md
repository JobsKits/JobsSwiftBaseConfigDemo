# `calls 符号关系 - 017`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T1["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S1 -->|calls| T1
  S2["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T2["method:ASControlNode::continueTrackingWithTouch:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:496"]
  S2 -->|calls| T2
  S3["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T3["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  S3 -->|calls| T3
  S4["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T4["function:ASControlNode::_ASControlNodeGetExpandedBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:485"]
  S4 -->|calls| T4
  S5["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T5["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S5 -->|calls| T5
  S6["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T6["method:ASControlNode::endTrackingWithTouch:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:506"]
  S6 -->|calls| T6
  S7["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T7["function:ASControlNode::_ASControlNodeGetExpandedBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:485"]
  S7 -->|calls| T7
  S8["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T8["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S8 -->|calls| T8
  S9["method:ASControlNode::_cancelTrackingWithEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:238"]
  T9["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S9 -->|calls| T9
  S10["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:251"]
  T10["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:251"]
  S10 -->|calls| T10
  S11["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T11["method:ASControlNode::enableHitTestDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:57"]
  S11 -->|calls| T11
  S12["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T12["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S12 -->|calls| T12
  S13["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T13["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S13 -->|calls| T13
  S14["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T14["function:ASControlNode::_ASEnumerateControlEventsIncludedInMaskWithBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:472"]
  S14 -->|calls| T14
  S15["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T15["function:ASControlNode::_ASControlNodeEventKeyForControlEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:467"]
  S15 -->|calls| T15
  S16["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T16["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S16 -->|calls| T16
  S17["method:ASControlNode::actionsForTarget:forControlEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:342"]
  T17["function:ASControlNode::_ASControlNodeEventKeyForControlEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:467"]
  S17 -->|calls| T17
  S18["method:ASControlNode::actionsForTarget:forControlEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:342"]
  T18["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S18 -->|calls| T18
  S19["method:ASControlNode::allTargets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:367"]
  T19["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S19 -->|calls| T19
  S20["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:384"]
  T20["function:ASControlNode::_ASEnumerateControlEventsIncludedInMaskWithBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:472"]
  S20 -->|calls| T20
  S21["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:384"]
  T21["function:ASControlNode::_ASControlNodeEventKeyForControlEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:467"]
  S21 -->|calls| T21
  S22["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  T22["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S22 -->|calls| T22
  S23["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  T23["function:ASControlNode::_ASEnumerateControlEventsIncludedInMaskWithBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:472"]
  S23 -->|calls| T23
  S24["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  T24["function:ASControlNode::_ASControlNodeEventKeyForControlEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:467"]
  S24 -->|calls| T24
  S25["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  T25["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

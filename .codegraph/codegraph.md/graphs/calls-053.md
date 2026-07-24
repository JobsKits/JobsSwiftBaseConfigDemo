# `calls 符号关系 - 053`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASCATransactionQueueGet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  T1["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S1 -->|calls| T1
  S2["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  T2["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T3["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T4["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T5["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T6["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T7["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T8["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S8 -->|calls| T8
  S9["method:ASScrollView::scrollNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:31"]
  T9["function:ASViewToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S9 -->|calls| T9
  S10["method:ASScrollView::didMoveToWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:48"]
  T10["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S10 -->|calls| T10
  S11["method:ASScrollNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  T11["method:ASScrollNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  S11 -->|calls| T11
  S12["method:ASScrollNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  T12["method:ASScrollNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  S12 -->|calls| T12
  S13["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T13["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S13 -->|calls| T13
  S14["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T14["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S14 -->|calls| T14
  S15["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T15["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S15 -->|calls| T15
  S16["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T16["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S16 -->|calls| T16
  S17["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T17["function:ASPointsValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S17 -->|calls| T17
  S18["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T18["function:ASPointsValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S18 -->|calls| T18
  S19["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T19["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S19 -->|calls| T19
  S20["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T20["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S20 -->|calls| T20
  S21["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T21["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S21 -->|calls| T21
  S22["method:ASScrollNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  T22["method:ASScrollNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  S22 -->|calls| T22
  S23["method:ASScrollNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  T23["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S23 -->|calls| T23
  S24["method:ASScrollNode::setAutomaticallyManagesContentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:159"]
  T24["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S24 -->|calls| T24
  S25["method:ASScrollNode::setAutomaticallyManagesContentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:159"]
  T25["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

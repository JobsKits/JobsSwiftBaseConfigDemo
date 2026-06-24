# `calls 符号关系 - 053`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASPagerNode::collectionNode:nodeBlockForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:147"]
  T1["method:ASPagerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  S1 -->|calls| T1
  S2["method:ASPagerNode::collectionNode:constrainedSizeForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:170"]
  T2["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S2 -->|calls| T2
  S3["method:ASPagerNode::collectionNode:constrainedSizeForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:170"]
  T3["method:ASPagerNode::pageSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S3 -->|calls| T3
  S4["method:ASPagerNode::setDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:182"]
  T4["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S4 -->|calls| T4
  S5["method:ASPagerNode::setDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:200"]
  T5["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S5 -->|calls| T5
  S6["method:ASPagerNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:215"]
  T6["method:ASPagerNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:215"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T7["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T8["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T9["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T10["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["function:ASCATransactionQueueGet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  T11["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S11 -->|calls| T11
  S12["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  T12["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T13["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T14["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T15["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T16["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T17["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T18["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S18 -->|calls| T18
  S19["method:ASScrollView::scrollNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:31"]
  T19["function:ASViewToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S19 -->|calls| T19
  S20["method:ASScrollView::didMoveToWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:48"]
  T20["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S20 -->|calls| T20
  S21["method:ASScrollNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  T21["method:ASScrollNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  S21 -->|calls| T21
  S22["method:ASScrollNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  T22["method:ASScrollNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  S22 -->|calls| T22
  S23["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T23["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S23 -->|calls| T23
  S24["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T24["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S24 -->|calls| T24
  S25["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T25["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

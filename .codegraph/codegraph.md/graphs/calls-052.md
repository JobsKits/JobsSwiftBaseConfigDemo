# `calls 符号关系 - 052`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  T1["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S1 -->|calls| T1
  S2["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  T2["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  S2 -->|calls| T2
  S3["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  T3["method:ASPagerFlowLayout::_updateCurrentNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:72"]
  S3 -->|calls| T3
  S4["method:ASPagerFlowLayout::targetContentOffsetForProposedContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:37"]
  T4["method:ASPagerFlowLayout::_targetContentOffsetForItemAtIndexPath:proposedContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:51"]
  S4 -->|calls| T4
  S5["method:ASPagerFlowLayout::_targetContentOffsetForItemAtIndexPath:proposedContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:51"]
  T5["method:ASPagerFlowLayout::_dataSourceIsEmpty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:66"]
  S5 -->|calls| T5
  S6["method:ASPagerFlowLayout::shouldInvalidateLayoutForBoundsChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:96"]
  T6["method:ASPagerFlowLayout::_updateCurrentNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:72"]
  S6 -->|calls| T6
  S7["method:ASPagerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  T7["method:ASPagerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  S7 -->|calls| T7
  S8["method:ASPagerNode::initUsingAsyncCollectionLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:62"]
  T8["method:ASCollectionNode::initWithLayoutDelegate:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:272"]
  S8 -->|calls| T8
  S9["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T9["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  S9 -->|calls| T9
  S10["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T10["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S10 -->|calls| T10
  S11["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T11["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S11 -->|calls| T11
  S12["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T12["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S12 -->|calls| T12
  S13["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T13["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S13 -->|calls| T13
  S14["method:ASPagerNode::currentPageIndex<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:102"]
  T14["method:ASPagerNode::pageSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S14 -->|calls| T14
  S15["method:ASPagerNode::scrollToPageAtIndex:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:117"]
  T15["method:ASCollectionNode::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:869"]
  S15 -->|calls| T15
  S16["method:ASPagerNode::galleryLayoutDelegate:sizeForElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:139"]
  T16["method:ASPagerNode::pageSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S16 -->|calls| T16
  S17["method:ASPagerNode::collectionNode:nodeBlockForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:147"]
  T17["method:ASPagerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  S17 -->|calls| T17
  S18["method:ASPagerNode::collectionNode:constrainedSizeForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:170"]
  T18["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S18 -->|calls| T18
  S19["method:ASPagerNode::collectionNode:constrainedSizeForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:170"]
  T19["method:ASPagerNode::pageSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S19 -->|calls| T19
  S20["method:ASPagerNode::setDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:182"]
  T20["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S20 -->|calls| T20
  S21["method:ASPagerNode::setDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:200"]
  T21["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S21 -->|calls| T21
  S22["method:ASPagerNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:215"]
  T22["method:ASPagerNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:215"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T23["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T24["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T25["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

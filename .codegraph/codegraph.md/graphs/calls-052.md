# `calls 符号关系 - 052`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T1["method:UIImage::asdk_animatedImageData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:19"]
  S1 -->|calls| T1
  S2["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T2["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S2 -->|calls| T2
  S3["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T3["method:UIImage::asdk_image<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S3 -->|calls| T3
  S4["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T4["method:ASNetworkImageNode::callbackQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:118"]
  S4 -->|calls| T4
  S5["method:ASNetworkImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:910"]
  T5["method:ASNetworkImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:910"]
  S5 -->|calls| T5
  S6["method:ASNodeController::loadNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:22"]
  T6["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S6 -->|calls| T6
  S7["method:ASNodeController::node<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:28"]
  T7["method:ASNodeController::loadNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:22"]
  S7 -->|calls| T7
  S8["method:ASNodeController::lockPair<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:96"]
  T8["function:ASLockSequence<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASLocking.h:103"]
  S8 -->|calls| T8
  S9["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  T9["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S9 -->|calls| T9
  S10["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  T10["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S10 -->|calls| T10
  S11["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  T11["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  S11 -->|calls| T11
  S12["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  T12["method:ASPagerFlowLayout::_updateCurrentNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:72"]
  S12 -->|calls| T12
  S13["method:ASPagerFlowLayout::targetContentOffsetForProposedContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:37"]
  T13["method:ASPagerFlowLayout::_targetContentOffsetForItemAtIndexPath:proposedContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:51"]
  S13 -->|calls| T13
  S14["method:ASPagerFlowLayout::_targetContentOffsetForItemAtIndexPath:proposedContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:51"]
  T14["method:ASPagerFlowLayout::_dataSourceIsEmpty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:66"]
  S14 -->|calls| T14
  S15["method:ASPagerFlowLayout::shouldInvalidateLayoutForBoundsChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:96"]
  T15["method:ASPagerFlowLayout::_updateCurrentNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:72"]
  S15 -->|calls| T15
  S16["method:ASPagerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  T16["method:ASPagerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  S16 -->|calls| T16
  S17["method:ASPagerNode::initUsingAsyncCollectionLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:62"]
  T17["method:ASCollectionNode::initWithLayoutDelegate:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:272"]
  S17 -->|calls| T17
  S18["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T18["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  S18 -->|calls| T18
  S19["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T19["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S19 -->|calls| T19
  S20["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T20["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S20 -->|calls| T20
  S21["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T21["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S21 -->|calls| T21
  S22["method:ASPagerNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T22["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S22 -->|calls| T22
  S23["method:ASPagerNode::currentPageIndex<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:102"]
  T23["method:ASPagerNode::pageSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S23 -->|calls| T23
  S24["method:ASPagerNode::scrollToPageAtIndex:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:117"]
  T24["method:ASCollectionNode::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:869"]
  S24 -->|calls| T24
  S25["method:ASPagerNode::galleryLayoutDelegate:sizeForElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:139"]
  T25["method:ASPagerNode::pageSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

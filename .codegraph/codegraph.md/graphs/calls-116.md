# `calls 符号关系 - 116`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:64"]
  T1["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:64"]
  T2["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T3["method:ASIGListAdapterBasedDataSource::collectionNode:sizeRangeForHeaderInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:210"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T4["method:ASCollectionView::collectionView:layout:referenceSizeForHeaderInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1098"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T5["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T6["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T7["method:ASIGListAdapterBasedDataSource::collectionNode:sizeRangeForFooterInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:220"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T8["method:ASCollectionView::collectionView:layout:referenceSizeForFooterInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1108"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T9["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T10["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewFlowLayoutInspector::collectionView:supplementaryNodesOfKind:inSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:134"]
  T11["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  S11 -->|calls| T11
  S12["method:ASDefaultPlayButton::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDefaultPlayButton.mm:15"]
  T12["method:ASDefaultPlayButton::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDefaultPlayButton.mm:15"]
  S12 -->|calls| T12
  S13["method:ASDefaultPlaybackButton::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDefaultPlaybackButton.mm:20"]
  T13["method:ASDefaultPlaybackButton::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDefaultPlaybackButton.mm:20"]
  S13 -->|calls| T13
  S14["method:ASDefaultPlaybackButton::setButtonType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDefaultPlaybackButton.mm:31"]
  T14["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::drawParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:36"]
  T15["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::drawParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:36"]
  T16["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::_recursivelyRasterizeSelfAndSublayersWithIsCancelledBlock:displayBlocks:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:49"]
  T17["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::_recursivelyRasterizeSelfAndSublayersWithIsCancelledBlock:displayBlocks:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:49"]
  T18["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::_recursivelyRasterizeSelfAndSublayersWithIsCancelledBlock:displayBlocks:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:49"]
  T19["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::_recursivelyRasterizeSelfAndSublayersWithIsCancelledBlock:displayBlocks:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:49"]
  T20["function:ASImageAlphaInfoIsOpaque<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:55"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T21["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T22["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T23["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T24["method:ASDisplayNode::drawParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:36"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T25["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

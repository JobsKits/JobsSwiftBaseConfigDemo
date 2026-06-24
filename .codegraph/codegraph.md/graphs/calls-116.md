# `calls 符号关系 - 116`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T1["function:ASDispatchAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDispatch.mm:33"]
  S1 -->|calls| T1
  S2["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T2["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S2 -->|calls| T2
  S3["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  T3["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S3 -->|calls| T3
  S4["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  T4["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S4 -->|calls| T4
  S5["method:ASCollectionLayoutCache::removeAllLayouts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:82"]
  T5["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutContext+Private.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutContext+Private.h:1"]
  T6["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S6 -->|calls| T6
  S7["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  T7["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S7 -->|calls| T7
  S8["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  T8["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewFlowLayoutInspector::initWithFlowLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:37"]
  T9["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:64"]
  T10["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:64"]
  T11["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S11 -->|calls| T11
  S12["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:64"]
  T12["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  S12 -->|calls| T12
  S13["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T13["method:ASIGListAdapterBasedDataSource::collectionNode:sizeRangeForHeaderInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:210"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T14["method:ASCollectionView::collectionView:layout:referenceSizeForHeaderInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1098"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T15["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T16["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T17["method:ASIGListAdapterBasedDataSource::collectionNode:sizeRangeForFooterInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:220"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T18["method:ASCollectionView::collectionView:layout:referenceSizeForFooterInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1108"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T19["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T20["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewFlowLayoutInspector::collectionView:supplementaryNodesOfKind:inSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:134"]
  T21["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  S21 -->|calls| T21
  S22["method:ASDefaultPlayButton::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDefaultPlayButton.mm:15"]
  T22["method:ASDefaultPlayButton::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDefaultPlayButton.mm:15"]
  S22 -->|calls| T22
  S23["method:ASDefaultPlaybackButton::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDefaultPlaybackButton.mm:20"]
  T23["method:ASDefaultPlaybackButton::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDefaultPlaybackButton.mm:20"]
  S23 -->|calls| T23
  S24["method:ASDefaultPlaybackButton::setButtonType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDefaultPlaybackButton.mm:31"]
  T24["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::drawParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:36"]
  T25["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

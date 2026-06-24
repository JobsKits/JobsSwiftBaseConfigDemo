# `calls 符号关系 - 084`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T1["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S1 -->|calls| T1
  S2["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T2["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S2 -->|calls| T2
  S3["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T3["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S3 -->|calls| T3
  S4["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T4["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S4 -->|calls| T4
  S5["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T5["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S5 -->|calls| T5
  S6["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T6["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S6 -->|calls| T6
  S7["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T7["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S7 -->|calls| T7
  S8["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T8["method:NSMapTable::pageTableForStrongObjectPointers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:89"]
  S8 -->|calls| T8
  S9["method:ASCollectionLayoutState::_unmeasuredLayoutAttributesTableFromTable:contentSize:pageSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:238"]
  T9["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewLayoutController::initWithCollectionView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:35"]
  T10["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewLayoutController::initWithCollectionView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:35"]
  T11["method:ASCollectionNode::collectionViewLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:695"]
  S11 -->|calls| T11
  S12["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T12["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S12 -->|calls| T12
  S13["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T13["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T14["method:ASCollectionViewLayoutController::elementsWithinRangeBounds:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:98"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T15["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T16["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T17["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T18["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  T19["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  T20["method:ASCollectionView::scrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1768"]
  S20 -->|calls| T20
  S21["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  T21["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S21 -->|calls| T21
  S22["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  T22["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:54"]
  T23["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  S23 -->|calls| T23
  S24["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T24["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S24 -->|calls| T24
  S25["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T25["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

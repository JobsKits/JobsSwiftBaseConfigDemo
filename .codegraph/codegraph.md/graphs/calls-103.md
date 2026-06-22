# `calls 符号关系 - 103`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T1["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T2["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T3["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T4["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  T5["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  T6["method:ASCollectionView::scrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1768"]
  S6 -->|calls| T6
  S7["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  T7["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S7 -->|calls| T7
  S8["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  T8["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:54"]
  T9["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  S9 -->|calls| T9
  S10["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T10["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S10 -->|calls| T10
  S11["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T11["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S11 -->|calls| T11
  S12["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T12["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S12 -->|calls| T12
  S13["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T13["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S13 -->|calls| T13
  S14["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T14["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S14 -->|calls| T14
  S15["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T15["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S15 -->|calls| T15
  S16["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T16["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  S16 -->|calls| T16
  S17["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T17["function:ASDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S17 -->|calls| T17
  S18["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  T18["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S18 -->|calls| T18
  S19["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  T19["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S19 -->|calls| T19
  S20["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  T20["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S20 -->|calls| T20
  S21["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  T21["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S21 -->|calls| T21
  S22["method:ASDataController::_repopulateSupplementaryNodesIntoMap:forSectionsContainingIndexPaths:changeSet:traitCollection:indexPathsAreNew:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:254"]
  T22["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  S22 -->|calls| T22
  S23["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T23["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S23 -->|calls| T23
  S24["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T24["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S24 -->|calls| T24
  S25["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T25["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 102`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T1["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S1 -->|calls| T1
  S2["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T2["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  S2 -->|calls| T2
  S3["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T3["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  S3 -->|calls| T3
  S4["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  T4["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S4 -->|calls| T4
  S5["method:ASCollectionLayoutContext::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:84"]
  T5["method:_ASCollectionGalleryLayoutInfo::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:52"]
  S5 -->|calls| T5
  S6["method:ASCollectionLayoutContext::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:84"]
  T6["function:ASHashBytes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S6 -->|calls| T6
  S7["method:ASCollectionLayoutState::initWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:41"]
  T7["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  S7 -->|calls| T7
  S8["method:ASCollectionLayoutState::initWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:41"]
  T8["method:NSMapTable::elementToLayoutAttributesTable<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:25"]
  S8 -->|calls| T8
  S9["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  T9["method:NSMapTable::elementToLayoutAttributesTable<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:25"]
  S9 -->|calls| T9
  S10["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  T10["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  S10 -->|calls| T10
  S11["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  T11["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S11 -->|calls| T11
  S12["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T12["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S12 -->|calls| T12
  S13["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T13["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S13 -->|calls| T13
  S14["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T14["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S14 -->|calls| T14
  S15["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T15["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S15 -->|calls| T15
  S16["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T16["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S16 -->|calls| T16
  S17["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T17["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S17 -->|calls| T17
  S18["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T18["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S18 -->|calls| T18
  S19["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T19["method:NSMapTable::pageTableForStrongObjectPointers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:89"]
  S19 -->|calls| T19
  S20["method:ASCollectionLayoutState::_unmeasuredLayoutAttributesTableFromTable:contentSize:pageSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:238"]
  T20["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewLayoutController::initWithCollectionView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:35"]
  T21["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewLayoutController::initWithCollectionView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:35"]
  T22["method:ASCollectionNode::collectionViewLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:695"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T23["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T24["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T25["method:ASCollectionViewLayoutController::elementsWithinRangeBounds:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:98"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 031`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  T1["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::endInteractiveMovement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1062"]
  T2["method:ASCollectionView::endInteractiveMovement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1062"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::cancelInteractiveMovement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1067"]
  T3["method:ASCollectionView::cancelInteractiveMovement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1067"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::numberOfSectionsInCollectionView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1075"]
  T4["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::collectionView:layout:insetForSectionAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1130"]
  T5["method:ASCollectionView::delegateIndexForSection:withSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1121"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::collectionView:layout:minimumInteritemSpacingForSectionAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1140"]
  T6["method:ASCollectionView::delegateIndexForSection:withSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1121"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::collectionView:layout:minimumLineSpacingForSectionAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1151"]
  T7["method:ASCollectionView::delegateIndexForSection:withSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1121"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T8["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T9["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T10["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:134"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::collectionView:didEndDisplayingCell:forItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1283"]
  T11["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::collectionView:didEndDisplayingCell:forItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1283"]
  T12["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1328"]
  T13["method:ASCollectionView::supplementaryNodeForElementKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:774"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::collectionView:didEndDisplayingSupplementaryView:forElementOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1368"]
  T14["method:ASCollectionView::supplementaryNodeForElementKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:774"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::collectionView:canMoveItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1566"]
  T15["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::collectionView:canMoveItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1566"]
  T16["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T17["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T18["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T19["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T20["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T21["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T22["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T23["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1648"]
  T24["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::setLeadingScreensForBatching:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1716"]
  T25["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

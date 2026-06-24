# `calls 符号关系 - 012`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  T1["method:ASCollectionView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  T2["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::_superPerformBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:897"]
  T3["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:913"]
  T4["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:948"]
  T5["method:ASCollectionView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:913"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:948"]
  T6["method:ASCollectionView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:927"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  T7["method:ASCollectionView::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:948"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::insertSections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:976"]
  T8["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::deleteSections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:985"]
  T9["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::reloadSections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:994"]
  T10["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::moveSection:toSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1003"]
  T11["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::insertItemsAtIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1017"]
  T12["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::deleteItemsAtIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1026"]
  T13["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::reloadItemsAtIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1035"]
  T14["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  T15["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  T16["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::endInteractiveMovement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1062"]
  T17["method:ASCollectionView::endInteractiveMovement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1062"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::cancelInteractiveMovement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1067"]
  T18["method:ASCollectionView::cancelInteractiveMovement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1067"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::numberOfSectionsInCollectionView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1075"]
  T19["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::collectionView:layout:insetForSectionAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1130"]
  T20["method:ASCollectionView::delegateIndexForSection:withSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1121"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::collectionView:layout:minimumInteritemSpacingForSectionAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1140"]
  T21["method:ASCollectionView::delegateIndexForSection:withSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1121"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::collectionView:layout:minimumLineSpacingForSectionAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1151"]
  T22["method:ASCollectionView::delegateIndexForSection:withSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1121"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T23["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T24["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T25["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:134"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

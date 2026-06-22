# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T1["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T2["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  T3["method:ASDataController::clearData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::setCollectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:595"]
  T4["method:ASCollectionView::layoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:609"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::layoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:609"]
  T5["method:UICollectionViewLayout::asdk_layoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/UICollectionViewLayout+ASConvenience.mm:18"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::sizeForElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:679"]
  T6["method:ASCollectionView::_sizeForUIKitCellWithKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:844"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::convertIndexPathFromCollectionNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:721"]
  T7["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::convertIndexPathFromCollectionNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:721"]
  T8["method:ASCollectionView::convertIndexPathFromCollectionNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:721"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::visibleNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:784"]
  T9["method:ASCollectionNode::indexPathsForVisibleItems<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:927"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::visibleNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:784"]
  T10["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  T11["method:ASCollectionView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  T12["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::_superPerformBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:897"]
  T13["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:913"]
  T14["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:948"]
  T15["method:ASCollectionView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:913"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:948"]
  T16["method:ASCollectionView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:927"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  T17["method:ASCollectionView::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:948"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::insertSections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:976"]
  T18["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::deleteSections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:985"]
  T19["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::reloadSections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:994"]
  T20["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::moveSection:toSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1003"]
  T21["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::insertItemsAtIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1017"]
  T22["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::deleteItemsAtIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1026"]
  T23["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::reloadItemsAtIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1035"]
  T24["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  T25["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

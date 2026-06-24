# `calls 符号关系 - 011`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T1["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T2["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T3["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  T4["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  T5["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:365"]
  T6["method:ASCollectionView::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:365"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::relayoutItems<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:372"]
  T7["method:ASCollectionView::invalidateFlowLayoutDelegateMetrics<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:800"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:380"]
  T8["method:ASDataController::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:499"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  T9["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::isSynchronized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:402"]
  T10["method:ASDataController::isSynchronized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:525"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T11["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T12["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T13["method:ASIGListAdapterBasedDataSource::dequeuesCellsForNodeBackedItems<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:312"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T14["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T15["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T16["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T17["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  T18["method:ASDataController::clearData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::setCollectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:595"]
  T19["method:ASCollectionView::layoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:609"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::layoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:609"]
  T20["method:UICollectionViewLayout::asdk_layoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/UICollectionViewLayout+ASConvenience.mm:18"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::sizeForElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:679"]
  T21["method:ASCollectionView::_sizeForUIKitCellWithKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:844"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::convertIndexPathFromCollectionNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:721"]
  T22["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::convertIndexPathFromCollectionNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:721"]
  T23["method:ASCollectionView::convertIndexPathFromCollectionNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:721"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::visibleNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:784"]
  T24["method:ASCollectionNode::indexPathsForVisibleItems<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:927"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::visibleNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:784"]
  T25["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

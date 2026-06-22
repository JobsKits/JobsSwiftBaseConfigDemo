# `calls 符号关系 - 029`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1188"]
  T1["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S1 -->|calls| T1
  S2["method:ASCollectionNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1188"]
  T2["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.h:1"]
  T3["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::initWithCollectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:267"]
  T4["method:ASCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:272"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:272"]
  T5["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T6["method:ASCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:272"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T7["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T8["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T9["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T10["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T11["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T12["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T13["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  T14["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  T15["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:365"]
  T16["method:ASCollectionView::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:365"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::relayoutItems<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:372"]
  T17["method:ASCollectionView::invalidateFlowLayoutDelegateMetrics<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:800"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:380"]
  T18["method:ASDataController::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:499"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  T19["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::isSynchronized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:402"]
  T20["method:ASDataController::isSynchronized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:525"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T21["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T22["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T23["method:ASIGListAdapterBasedDataSource::dequeuesCellsForNodeBackedItems<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:312"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T24["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T25["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

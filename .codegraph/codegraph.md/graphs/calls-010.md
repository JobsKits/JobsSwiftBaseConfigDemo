# `calls 符号关系 - 010`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  T1["method:ASCollectionNode::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:992"]
  S1 -->|calls| T1
  S2["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  T2["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S2 -->|calls| T2
  S3["method:ASCollectionNode::endUpdatesAnimated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1086"]
  T3["method:ASCollectionNode::endUpdatesAnimated:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1091"]
  S3 -->|calls| T3
  S4["method:ASCollectionNode::updateCurrentRangeWithMode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1173"]
  T4["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S4 -->|calls| T4
  S5["method:ASCollectionNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1188"]
  T5["method:ASCollectionNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1188"]
  S5 -->|calls| T5
  S6["method:ASCollectionNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1188"]
  T6["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S6 -->|calls| T6
  S7["method:ASCollectionNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1188"]
  T7["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.h:1"]
  T8["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::initWithCollectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:267"]
  T9["method:ASCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:272"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:272"]
  T10["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T11["method:ASCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:272"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T12["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T13["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T14["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T15["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T16["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T17["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T18["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  T19["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  T20["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:365"]
  T21["method:ASCollectionView::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:365"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::relayoutItems<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:372"]
  T22["method:ASCollectionView::invalidateFlowLayoutDelegateMetrics<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:800"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:380"]
  T23["method:ASDataController::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:499"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  T24["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::isSynchronized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:402"]
  T25["method:ASDataController::isSynchronized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:525"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

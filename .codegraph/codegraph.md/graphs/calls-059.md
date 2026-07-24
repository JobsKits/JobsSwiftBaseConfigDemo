# `calls 符号关系 - 059`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:358"]
  T1["method:ASTableView::initWithFrame:style:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:308"]
  S1 -->|calls| T1
  S2["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:397"]
  T2["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S2 -->|calls| T2
  S3["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:397"]
  T3["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S3 -->|calls| T3
  S4["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:397"]
  T4["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:513"]
  S4 -->|calls| T4
  S5["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:447"]
  T5["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S5 -->|calls| T5
  S6["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:447"]
  T6["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S6 -->|calls| T6
  S7["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:447"]
  T7["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:513"]
  S7 -->|calls| T7
  S8["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:513"]
  T8["method:ASDataController::clearData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  S8 -->|calls| T8
  S9["method:ASTableView::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:531"]
  T9["method:ASTableView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:552"]
  S9 -->|calls| T9
  S10["method:ASTableView::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:531"]
  T10["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S10 -->|calls| T10
  S11["method:ASTableView::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:531"]
  T11["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S11 -->|calls| T11
  S12["method:ASTableView::scrollToRowAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:557"]
  T12["method:ASTableView::scrollToRowAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:557"]
  S12 -->|calls| T12
  S13["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:599"]
  T13["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:739"]
  S13 -->|calls| T13
  S14["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:599"]
  T14["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:599"]
  S14 -->|calls| T14
  S15["method:ASTableView::indexPathForNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:635"]
  T15["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:665"]
  S15 -->|calls| T15
  S16["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:665"]
  T16["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:739"]
  S16 -->|calls| T16
  S17["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:665"]
  T17["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:665"]
  S17 -->|calls| T17
  S18["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  T18["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S18 -->|calls| T18
  S19["method:ASTableView::endUpdatesWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:703"]
  T19["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:709"]
  S19 -->|calls| T19
  S20["method:ASTableView::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:729"]
  T20["method:ASDataController::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:499"]
  S20 -->|calls| T20
  S21["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:739"]
  T21["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S21 -->|calls| T21
  S22["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T22["method:ASTableView::sectionIndexWidth<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1958"]
  S22 -->|calls| T22
  S23["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T23["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S23 -->|calls| T23
  S24["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T24["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S24 -->|calls| T24
  S25["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T25["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:709"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

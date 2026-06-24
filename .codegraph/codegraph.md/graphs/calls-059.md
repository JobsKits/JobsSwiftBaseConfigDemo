# `calls 符号关系 - 059`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:155"]
  T1["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:155"]
  S1 -->|calls| T1
  S2["method:ASTableView::initWithFrame:style:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:308"]
  T2["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:313"]
  S2 -->|calls| T2
  S3["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:313"]
  T3["method:ASTableView::initWithFrame:style:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:308"]
  S3 -->|calls| T3
  S4["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:313"]
  T4["method:ASTableView::dataControllerClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:300"]
  S4 -->|calls| T4
  S5["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:313"]
  T5["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S5 -->|calls| T5
  S6["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:313"]
  T6["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  S6 -->|calls| T6
  S7["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:313"]
  T7["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S7 -->|calls| T7
  S8["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:313"]
  T8["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S8 -->|calls| T8
  S9["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:313"]
  T9["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S9 -->|calls| T9
  S10["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:313"]
  T10["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S10 -->|calls| T10
  S11["method:ASTableView::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:358"]
  T11["method:ASTableView::initWithFrame:style:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:308"]
  S11 -->|calls| T11
  S12["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:397"]
  T12["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S12 -->|calls| T12
  S13["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:397"]
  T13["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S13 -->|calls| T13
  S14["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:397"]
  T14["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:513"]
  S14 -->|calls| T14
  S15["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:447"]
  T15["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S15 -->|calls| T15
  S16["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:447"]
  T16["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S16 -->|calls| T16
  S17["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:447"]
  T17["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:513"]
  S17 -->|calls| T17
  S18["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:513"]
  T18["method:ASDataController::clearData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  S18 -->|calls| T18
  S19["method:ASTableView::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:531"]
  T19["method:ASTableView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:552"]
  S19 -->|calls| T19
  S20["method:ASTableView::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:531"]
  T20["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S20 -->|calls| T20
  S21["method:ASTableView::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:531"]
  T21["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S21 -->|calls| T21
  S22["method:ASTableView::scrollToRowAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:557"]
  T22["method:ASTableView::scrollToRowAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:557"]
  S22 -->|calls| T22
  S23["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:599"]
  T23["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:739"]
  S23 -->|calls| T23
  S24["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:599"]
  T24["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:599"]
  S24 -->|calls| T24
  S25["method:ASTableView::indexPathForNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:635"]
  T25["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:665"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

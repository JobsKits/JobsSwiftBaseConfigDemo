# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:665"]
  T1["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:739"]
  S1 -->|calls| T1
  S2["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:665"]
  T2["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:665"]
  S2 -->|calls| T2
  S3["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  T3["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S3 -->|calls| T3
  S4["method:ASTableView::endUpdatesWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:703"]
  T4["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:709"]
  S4 -->|calls| T4
  S5["method:ASTableView::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:729"]
  T5["method:ASDataController::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:499"]
  S5 -->|calls| T5
  S6["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:739"]
  T6["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S6 -->|calls| T6
  S7["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T7["method:ASTableView::sectionIndexWidth<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1958"]
  S7 -->|calls| T7
  S8["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T8["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S8 -->|calls| T8
  S9["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T9["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S9 -->|calls| T9
  S10["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T10["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:709"]
  S10 -->|calls| T10
  S11["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T11["function:ASDisplayNodeLayerHasAnimations<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:183"]
  S11 -->|calls| T11
  S12["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T12["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S12 -->|calls| T12
  S13["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T13["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S13 -->|calls| T13
  S14["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T14["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S14 -->|calls| T14
  S15["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T15["method:ASTableView::requeryNodeHeights<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1947"]
  S15 -->|calls| T15
  S16["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T16["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  S16 -->|calls| T16
  S17["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:751"]
  T17["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S17 -->|calls| T17
  S18["method:ASTableView::insertSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:784"]
  T18["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S18 -->|calls| T18
  S19["method:ASTableView::insertSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:784"]
  T19["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S19 -->|calls| T19
  S20["method:ASTableView::deleteSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:793"]
  T20["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S20 -->|calls| T20
  S21["method:ASTableView::deleteSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:793"]
  T21["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S21 -->|calls| T21
  S22["method:ASTableView::reloadSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:802"]
  T22["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S22 -->|calls| T22
  S23["method:ASTableView::reloadSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:802"]
  T23["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S23 -->|calls| T23
  S24["method:ASTableView::moveSection:toSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:811"]
  T24["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S24 -->|calls| T24
  S25["method:ASTableView::moveSection:toSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:811"]
  T25["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 081`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::_beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1497"]
  T1["method:ASBatchContext::beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:43"]
  S1 -->|calls| T1
  S2["method:ASTableView::interfaceStateForRangeController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1532"]
  T2["function:ASInterfaceStateForDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:60"]
  S2 -->|calls| T2
  S3["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T3["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S3 -->|calls| T3
  S4["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T4["method:ASTableView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:552"]
  S4 -->|calls| T4
  S5["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T5["method:ASTableView::beginAdjustingContentOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:857"]
  S5 -->|calls| T5
  S6["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T6["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S6 -->|calls| T6
  S7["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T7["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S7 -->|calls| T7
  S8["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T8["method:ASTableView::reloadRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:837"]
  S8 -->|calls| T8
  S9["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T9["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S9 -->|calls| T9
  S10["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T10["method:ASTableView::reloadSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:802"]
  S10 -->|calls| T10
  S11["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T11["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S11 -->|calls| T11
  S12["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T12["method:ASTableView::deleteRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:828"]
  S12 -->|calls| T12
  S13["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T13["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S13 -->|calls| T13
  S14["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T14["method:ASTableView::deleteSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:793"]
  S14 -->|calls| T14
  S15["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T15["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S15 -->|calls| T15
  S16["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T16["method:ASTableView::insertSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:784"]
  S16 -->|calls| T16
  S17["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T17["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S17 -->|calls| T17
  S18["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T18["method:ASTableView::insertRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:819"]
  S18 -->|calls| T18
  S19["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T19["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S19 -->|calls| T19
  S20["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T20["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S20 -->|calls| T20
  S21["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T21["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S21 -->|calls| T21
  S22["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T22["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S22 -->|calls| T22
  S23["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T24["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S24 -->|calls| T24
  S25["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T25["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

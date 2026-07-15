# `calls 符号关系 - 062`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1405"]
  T1["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S1 -->|calls| T1
  S2["method:ASTableView::_scheduleCheckForBatchFetchingForNumberOfChanges:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1466"]
  T2["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S2 -->|calls| T2
  S3["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1480"]
  T3["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1490"]
  S3 -->|calls| T3
  S4["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1490"]
  T4["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  S4 -->|calls| T4
  S5["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1490"]
  T5["method:ASTableView::_beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1497"]
  S5 -->|calls| T5
  S6["method:ASTableView::_beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1497"]
  T6["method:ASBatchContext::beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:43"]
  S6 -->|calls| T6
  S7["method:ASTableView::interfaceStateForRangeController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1532"]
  T7["function:ASInterfaceStateForDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:60"]
  S7 -->|calls| T7
  S8["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T8["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S8 -->|calls| T8
  S9["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T9["method:ASTableView::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:552"]
  S9 -->|calls| T9
  S10["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T10["method:ASTableView::beginAdjustingContentOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:857"]
  S10 -->|calls| T10
  S11["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T11["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S11 -->|calls| T11
  S12["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T12["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S12 -->|calls| T12
  S13["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T13["method:ASTableView::reloadRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:837"]
  S13 -->|calls| T13
  S14["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T14["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S14 -->|calls| T14
  S15["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T15["method:ASTableView::reloadSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:802"]
  S15 -->|calls| T15
  S16["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T16["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S16 -->|calls| T16
  S17["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T17["method:ASTableView::deleteRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:828"]
  S17 -->|calls| T17
  S18["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T18["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S18 -->|calls| T18
  S19["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T19["method:ASTableView::deleteSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:793"]
  S19 -->|calls| T19
  S20["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T20["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S20 -->|calls| T20
  S21["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T21["method:ASTableView::insertSections:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:784"]
  S21 -->|calls| T21
  S22["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T22["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S22 -->|calls| T22
  S23["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T23["method:ASTableView::insertRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:819"]
  S23 -->|calls| T23
  S24["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T24["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S24 -->|calls| T24
  S25["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T25["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

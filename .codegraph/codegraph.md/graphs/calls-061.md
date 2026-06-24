# `calls 符号关系 - 061`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::insertRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:819"]
  T1["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S1 -->|calls| T1
  S2["method:ASTableView::insertRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:819"]
  T2["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S2 -->|calls| T2
  S3["method:ASTableView::deleteRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:828"]
  T3["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S3 -->|calls| T3
  S4["method:ASTableView::deleteRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:828"]
  T4["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S4 -->|calls| T4
  S5["method:ASTableView::reloadRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:837"]
  T5["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S5 -->|calls| T5
  S6["method:ASTableView::reloadRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:837"]
  T6["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S6 -->|calls| T6
  S7["method:ASTableView::moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:846"]
  T7["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S7 -->|calls| T7
  S8["method:ASTableView::moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:846"]
  T8["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S8 -->|calls| T8
  S9["method:ASTableView::tableView:heightForRowAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:927"]
  T9["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S9 -->|calls| T9
  S10["method:ASTableView::tableView:moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:995"]
  T10["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:739"]
  S10 -->|calls| T10
  S11["method:ASTableView::tableView:moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:995"]
  T11["method:ASTableView::moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:846"]
  S11 -->|calls| T11
  S12["method:ASTableView::tableView:moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:995"]
  T12["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:739"]
  S12 -->|calls| T12
  S13["method:ASTableView::tableView:willDisplayCell:forRowAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1014"]
  T13["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S13 -->|calls| T13
  S14["method:ASTableView::tableView:willDisplayCell:forRowAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1014"]
  T14["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:134"]
  S14 -->|calls| T14
  S15["method:ASTableView::tableView:didEndDisplayingCell:forRowAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1049"]
  T15["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S15 -->|calls| T15
  S16["method:ASTableView::tableView:willSelectRowAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1081"]
  T16["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:599"]
  S16 -->|calls| T16
  S17["method:ASTableView::tableView:willDeselectRowAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1120"]
  T17["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:599"]
  S17 -->|calls| T17
  S18["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T18["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S18 -->|calls| T18
  S19["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T19["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S19 -->|calls| T19
  S20["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T20["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S20 -->|calls| T20
  S21["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T21["method:_ASTableViewCell::node<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:99"]
  S21 -->|calls| T21
  S22["method:ASTableView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1277"]
  T22["method:ASTableView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1277"]
  S22 -->|calls| T22
  S23["method:ASTableView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1277"]
  T23["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1490"]
  S23 -->|calls| T23
  S24["method:ASTableView::scrollViewDidEndDecelerating:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1299"]
  T24["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S24 -->|calls| T24
  S25["method:ASTableView::scrollViewDidEndDecelerating:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1299"]
  T25["method:_ASTableViewCell::node<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:99"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

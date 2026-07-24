# `calls 符号关系 - 013`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T1["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T2["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T3["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1648"]
  T4["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::setLeadingScreensForBatching:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1716"]
  T5["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::scrollDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1732"]
  T6["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T7["method:ASCollectionView::scrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1768"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T8["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T9["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T10["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T11["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T12["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T13["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T14["method:ASCollectionView::_superPerformBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:897"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T15["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T16["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::_scheduleCheckForBatchFetchingForNumberOfChanges:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1850"]
  T17["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  T18["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  T19["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  T20["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  T21["method:ASBatchContext::beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:43"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  T22["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T24["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T25["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

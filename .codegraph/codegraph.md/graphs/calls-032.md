# `calls 符号关系 - 032`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::scrollDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1732"]
  T1["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T2["method:ASCollectionView::scrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1768"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T3["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T4["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T5["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T6["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T7["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T8["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T9["method:ASCollectionView::_superPerformBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:897"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T10["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T11["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::_scheduleCheckForBatchFetchingForNumberOfChanges:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1850"]
  T12["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  T13["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  T14["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  T15["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  T16["method:ASBatchContext::beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:43"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  T17["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T18["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T20["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T21["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T22["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::dataController:presentedSizeForElement:matchesSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:2047"]
  T23["method:ASCollectionLayoutState::layoutAttributesForSupplementaryElementOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:135"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::dataController:presentedSizeForElement:matchesSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:2047"]
  T24["function:CGSizeEqualToSizeWithIn<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/CoreGraphics+ASConvenience.h:41"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T25["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 114`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::yogaSpacerNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:23"]
  T1["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::yogaVerticalStack<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:30"]
  T2["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::yogaHorizontalStack<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:37"]
  T3["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S3 -->|calls| T3
  S4["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  T4["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S4 -->|calls| T4
  S5["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  T5["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S5 -->|calls| T5
  S6["function:yogaDimensionToPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  T6["function:yogaFloatForCGFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S6 -->|calls| T6
  S7["function:yogaDimensionToPercent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:132"]
  T7["function:yogaFloatForCGFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S7 -->|calls| T7
  S8["function:ASLayoutElementYogaUpdateMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:157"]
  T8["method:ASDisplayNode::implementsLayoutMethod<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:42"]
  S8 -->|calls| T8
  S9["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T9["function:cgFloatForYogaFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:120"]
  S9 -->|calls| T9
  S10["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T10["function:cgFloatForYogaFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:120"]
  S10 -->|calls| T10
  S11["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T11["function:yogaDimensionToPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  S11 -->|calls| T11
  S12["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T12["function:yogaDimensionToPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  S12 -->|calls| T12
  S13["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T13["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S13 -->|calls| T13
  S14["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  T14["method:ASCollectionView::canBatchFetch<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1829"]
  S14 -->|calls| T14
  S15["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  T15["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S15 -->|calls| T15
  S16["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T16["method:ASBatchContext::isFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:33"]
  S16 -->|calls| T16
  S17["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T17["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S17 -->|calls| T17
  S18["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T18["function:ASScrollDirectionContainsUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:31"]
  S18 -->|calls| T18
  S19["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T19["function:ASScrollDirectionContainsRight<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:23"]
  S19 -->|calls| T19
  S20["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T20["function:ASScrollDirectionContainsLeft<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:27"]
  S20 -->|calls| T20
  S21["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T21["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S21 -->|calls| T21
  S22["method:ASCollectionLayout::initWithLayoutDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:47"]
  T22["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S22 -->|calls| T22
  S23["method:ASCollectionLayout::initWithLayoutDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:47"]
  T23["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S23 -->|calls| T23
  S24["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T24["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  S24 -->|calls| T24
  S25["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T25["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T1["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S1 -->|calls| T1
  S2["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T2["function:ASScrollDirectionContainsUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:31"]
  S2 -->|calls| T2
  S3["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T3["function:ASScrollDirectionContainsRight<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:23"]
  S3 -->|calls| T3
  S4["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T4["function:ASScrollDirectionContainsLeft<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:27"]
  S4 -->|calls| T4
  S5["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T5["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S5 -->|calls| T5
  S6["method:ASCollectionLayout::initWithLayoutDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:47"]
  T6["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S6 -->|calls| T6
  S7["method:ASCollectionLayout::initWithLayoutDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:47"]
  T7["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S7 -->|calls| T7
  S8["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T8["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  S8 -->|calls| T8
  S9["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T9["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S9 -->|calls| T9
  S10["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T10["method:ASCollectionFlowLayoutDelegate::scrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:40"]
  S10 -->|calls| T10
  S11["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T11["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  S11 -->|calls| T11
  S12["method:ASCollectionLayout::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:96"]
  T12["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S12 -->|calls| T12
  S13["method:ASCollectionLayout::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:96"]
  T13["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  S13 -->|calls| T13
  S14["method:ASCollectionLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:124"]
  T14["method:ASCollectionLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:124"]
  S14 -->|calls| T14
  S15["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  T15["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S15 -->|calls| T15
  S16["method:ASCollectionLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:176"]
  T16["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S16 -->|calls| T16
  S17["method:ASCollectionLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:176"]
  T17["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S17 -->|calls| T17
  S18["method:ASCollectionLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:201"]
  T18["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S18 -->|calls| T18
  S19["method:ASCollectionLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:201"]
  T19["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S19 -->|calls| T19
  S20["method:ASCollectionLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:218"]
  T20["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S20 -->|calls| T20
  S21["method:ASCollectionLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:218"]
  T21["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S21 -->|calls| T21
  S22["method:ASCollectionLayout::_viewportSizeForCollectionNode:scrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:255"]
  T22["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S22 -->|calls| T22
  S23["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T23["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S23 -->|calls| T23
  S24["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T24["function:ASDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S24 -->|calls| T24
  S25["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T25["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

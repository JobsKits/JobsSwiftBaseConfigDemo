# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T1["method:ASCollectionFlowLayoutDelegate::scrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:40"]
  S1 -->|calls| T1
  S2["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T2["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  S2 -->|calls| T2
  S3["method:ASCollectionLayout::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:96"]
  T3["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S3 -->|calls| T3
  S4["method:ASCollectionLayout::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:96"]
  T4["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  S4 -->|calls| T4
  S5["method:ASCollectionLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:124"]
  T5["method:ASCollectionLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:124"]
  S5 -->|calls| T5
  S6["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  T6["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S6 -->|calls| T6
  S7["method:ASCollectionLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:176"]
  T7["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S7 -->|calls| T7
  S8["method:ASCollectionLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:176"]
  T8["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S8 -->|calls| T8
  S9["method:ASCollectionLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:201"]
  T9["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S9 -->|calls| T9
  S10["method:ASCollectionLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:201"]
  T10["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S10 -->|calls| T10
  S11["method:ASCollectionLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:218"]
  T11["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S11 -->|calls| T11
  S12["method:ASCollectionLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:218"]
  T12["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S12 -->|calls| T12
  S13["method:ASCollectionLayout::_viewportSizeForCollectionNode:scrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:255"]
  T13["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S13 -->|calls| T13
  S14["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T14["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S14 -->|calls| T14
  S15["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T15["function:ASDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S15 -->|calls| T15
  S16["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T16["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S16 -->|calls| T16
  S17["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T17["function:ASDispatchAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDispatch.mm:33"]
  S17 -->|calls| T17
  S18["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T18["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S18 -->|calls| T18
  S19["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  T19["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S19 -->|calls| T19
  S20["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  T20["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S20 -->|calls| T20
  S21["method:ASCollectionLayoutCache::removeAllLayouts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:82"]
  T21["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutContext+Private.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutContext+Private.h:1"]
  T22["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  T23["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S23 -->|calls| T23
  S24["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  T24["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewFlowLayoutInspector::initWithFlowLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:37"]
  T25["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

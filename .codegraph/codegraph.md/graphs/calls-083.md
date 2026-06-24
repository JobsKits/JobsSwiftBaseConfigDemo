# `calls 符号关系 - 083`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionElement::node<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:46"]
  T1["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S1 -->|calls| T1
  S2["method:ASCollectionElement::node<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:46"]
  T2["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S2 -->|calls| T2
  S3["method:ASCollectionElement::setTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:70"]
  T3["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S3 -->|calls| T3
  S4["method:ASCollectionElement::setTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:70"]
  T4["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S4 -->|calls| T4
  S5["method:ASCollectionFlowLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:31"]
  T5["method:ASCollectionFlowLayoutDelegate::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:26"]
  S5 -->|calls| T5
  S6["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T6["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  S6 -->|calls| T6
  S7["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T7["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  S7 -->|calls| T7
  S8["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T8["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S8 -->|calls| T8
  S9["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T9["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S9 -->|calls| T9
  S10["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T10["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S10 -->|calls| T10
  S11["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T11["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S11 -->|calls| T11
  S12["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T12["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S12 -->|calls| T12
  S13["method:ASCollectionGalleryLayoutDelegate::additionalInfoForLayoutWithElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:70"]
  T13["method:_ASCollectionGalleryLayoutInfo::initWithItemSize:minimumLineSpacing:minimumInteritemSpacing:sectionInset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:14"]
  S13 -->|calls| T13
  S14["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T14["method:_ASGalleryLayoutItem::initWithItemSize:collectionElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:25"]
  S14 -->|calls| T14
  S15["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T15["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S15 -->|calls| T15
  S16["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T16["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  S16 -->|calls| T16
  S17["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T17["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  S17 -->|calls| T17
  S18["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  T18["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S18 -->|calls| T18
  S19["method:ASCollectionLayoutContext::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:84"]
  T19["method:_ASCollectionGalleryLayoutInfo::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:52"]
  S19 -->|calls| T19
  S20["method:ASCollectionLayoutContext::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:84"]
  T20["function:ASHashBytes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S20 -->|calls| T20
  S21["method:ASCollectionLayoutState::initWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:41"]
  T21["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  S21 -->|calls| T21
  S22["method:ASCollectionLayoutState::initWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:41"]
  T22["method:NSMapTable::elementToLayoutAttributesTable<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:25"]
  S22 -->|calls| T22
  S23["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  T23["method:NSMapTable::elementToLayoutAttributesTable<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:25"]
  S23 -->|calls| T23
  S24["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  T24["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  S24 -->|calls| T24
  S25["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  T25["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

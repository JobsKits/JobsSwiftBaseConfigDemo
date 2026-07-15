# `calls 符号关系 - 127`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T1["function:crossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S1 -->|calls| T1
  S2["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T2["function:crossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S2 -->|calls| T2
  S3["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T3["function:dispatchApplyIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:70"]
  S3 -->|calls| T3
  S4["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T4["function:crossChildLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  S4 -->|calls| T4
  S5["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T5["function:ASDimensionResolve<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:162"]
  S5 -->|calls| T5
  S6["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T6["function:stackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S6 -->|calls| T6
  S7["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T7["function:ASDimensionResolve<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:162"]
  S7 -->|calls| T7
  S8["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T8["function:stackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S8 -->|calls| T8
  S9["function:compute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T9["function:useOptimizedFlexing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:538"]
  S9 -->|calls| T9
  S10["function:compute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T10["variable:map<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:74"]
  S10 -->|calls| T10
  S11["function:compute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T11["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  S11 -->|calls| T11
  S12["function:compute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T12["function:collectChildrenIntoLines<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  S12 -->|calls| T12
  S13["function:compute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T13["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  S13 -->|calls| T13
  S14["function:compute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T14["function:stretchLinesAlongCrossDimension::computeLinesCrossSizeAndBaseline<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:278"]
  S14 -->|calls| T14
  S15["function:compute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T15["function:stretchLinesAlongCrossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:226"]
  S15 -->|calls| T15
  S16["function:compute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T16["function:computeItemsStackDimensionSum<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:468"]
  S16 -->|calls| T16
  S17["function:compute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T17["function:computeLinesCrossDimensionSum<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:108"]
  S17 -->|calls| T17
  S18["method:_ASCollectionGalleryLayoutInfo::initWithItemSize:minimumLineSpacing:minimumInteritemSpacing:sectionInset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:14"]
  T18["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S18 -->|calls| T18
  S19["method:_ASCollectionGalleryLayoutInfo::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:52"]
  T19["function:ASHashBytes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S19 -->|calls| T19
  S20["method:_ASGalleryLayoutItem::initWithItemSize:collectionElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:25"]
  T20["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S20 -->|calls| T20
  S21["method:_ASGalleryLayoutItem::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:63"]
  T21["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S21 -->|calls| T21
  S22["method:_ASGalleryLayoutItem::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:63"]
  T22["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S22 -->|calls| T22
  S23["method:_ASGalleryLayoutItem::asciiArtString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:72"]
  T23["method:_ASGalleryLayoutItem::asciiArtName<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:77"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.h:1"]
  T24["function:ASDisplayNodeUIContentModeFromNSString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:121"]
  S24 -->|calls| T24
  S25["function:ASDisplayNodeSetupLayerContentsWithResizableImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:13"]
  T25["function:ASDisplayNodeSetResizableContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

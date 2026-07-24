# `calls 符号关系 - 088`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASElementMap::contextForSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:103"]
  T1["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S1 -->|calls| T1
  S2["method:ASElementMap::elementForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:126"]
  T2["method:ASElementMap::itemIndexPathIsValid:assert:item:section:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:251"]
  S2 -->|calls| T2
  S3["method:ASElementMap::elementForLayoutAttributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:141"]
  T3["method:ASElementMap::supplementaryElementOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:136"]
  S3 -->|calls| T3
  S4["method:ASElementMap::convertIndexPath:fromMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:156"]
  T4["method:ASElementMap::convertSection:fromMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:169"]
  S4 -->|calls| T4
  S5["method:ASElementMap::mutableCopyWithZone:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:189"]
  T5["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  S5 -->|calls| T5
  S6["method:ASElementMap::smallDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:201"]
  T6["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  S6 -->|calls| T6
  S7["method:ASElementMap::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  T7["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S7 -->|calls| T7
  S8["method:ASElementMap::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  T8["method:ASElementMap::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:220"]
  S8 -->|calls| T8
  S9["method:ASElementMap::itemIndexPathIsValid:assert:item:section:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:251"]
  T9["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.h:1"]
  T10["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S10 -->|calls| T10
  S11["function:ASGraphicsCreateImageWithOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:28"]
  T11["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S11 -->|calls| T11
  S12["function:ASGraphicsCreateImageWithOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:28"]
  T12["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S12 -->|calls| T12
  S13["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T13["function:ASConfigureExtendedRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S13 -->|calls| T13
  S14["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T14["function:ASConfigureExtendedRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S14 -->|calls| T14
  S15["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T15["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S15 -->|calls| T15
  S16["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T16["function:ASConfigureExtendedRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S16 -->|calls| T16
  S17["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T17["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S17 -->|calls| T17
  S18["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T18["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S18 -->|calls| T18
  S19["function:ASGraphicsCreateImageWithTraitCollectionAndOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:109"]
  T19["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S19 -->|calls| T19
  S20["method:ASHighlightOverlayLayer::defaultValueForKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:25"]
  T20["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S20 -->|calls| T20
  S21["method:ASHighlightOverlayLayer::defaultActionForKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:49"]
  T21["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S21 -->|calls| T21
  S22["method:ASHighlightOverlayLayer::initWithRects:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:54"]
  T22["method:ASHighlightOverlayLayer::initWithRects:targetLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:59"]
  S22 -->|calls| T22
  S23["method:ASHighlightOverlayLayer::initWithRects:targetLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:59"]
  T23["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S23 -->|calls| T23
  S24["method:ASIntegerMap::identityMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:29"]
  T24["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S24 -->|calls| T24
  S25["method:ASIntegerMap::emptyMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:41"]
  T25["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

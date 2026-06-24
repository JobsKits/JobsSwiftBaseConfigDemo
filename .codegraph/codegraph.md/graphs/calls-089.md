# `calls 符号关系 - 089`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T1["function:ASConfigureExtendedRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S1 -->|calls| T1
  S2["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T2["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S2 -->|calls| T2
  S3["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T3["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S3 -->|calls| T3
  S4["function:ASGraphicsCreateImageWithTraitCollectionAndOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:109"]
  T4["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S4 -->|calls| T4
  S5["method:ASHighlightOverlayLayer::defaultValueForKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:25"]
  T5["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S5 -->|calls| T5
  S6["method:ASHighlightOverlayLayer::defaultActionForKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:49"]
  T6["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S6 -->|calls| T6
  S7["method:ASHighlightOverlayLayer::initWithRects:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:54"]
  T7["method:ASHighlightOverlayLayer::initWithRects:targetLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:59"]
  S7 -->|calls| T7
  S8["method:ASHighlightOverlayLayer::initWithRects:targetLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:59"]
  T8["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S8 -->|calls| T8
  S9["method:ASIntegerMap::identityMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:29"]
  T9["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S9 -->|calls| T9
  S10["method:ASIntegerMap::emptyMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:41"]
  T10["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S10 -->|calls| T10
  S11["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  T11["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S11 -->|calls| T11
  S12["method:ASIntegerMap::integerForKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:92"]
  T12["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S12 -->|calls| T12
  S13["method:ASIntegerMap::inverseMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:114"]
  T13["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S13 -->|calls| T13
  S14["method:ASIntegerMap::inverseMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:114"]
  T14["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S14 -->|calls| T14
  S15["method:ASIntegerMap::inverseMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:114"]
  T15["method:ASMutableAttributedStringBuilder::string<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:234"]
  S15 -->|calls| T15
  S16["method:ASIntegerMap::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:167"]
  T16["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  S16 -->|calls| T16
  S17["method:ASIntegerMap::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:167"]
  T17["method:ASElementMap::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:220"]
  S17 -->|calls| T17
  S18["method:ASMainSerialQueue::performBlockOnMainThread:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:32"]
  T18["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  S18 -->|calls| T18
  S19["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T19["property:ASWeakSet::empty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.h:22"]
  S19 -->|calls| T19
  S20["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T20["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S20 -->|calls| T20
  S21["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T21["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S21 -->|calls| T21
  S22["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T22["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S22 -->|calls| T22
  S23["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T23["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S23 -->|calls| T23
  S24["method:ASMainSerialQueue::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:63"]
  T24["method:ASMainSerialQueue::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:63"]
  S24 -->|calls| T24
  S25["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  T25["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

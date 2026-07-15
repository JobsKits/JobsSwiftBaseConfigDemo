# `calls 符号关系 - 117`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T1["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T2["method:ASDisplayNode::_recursivelyRasterizeSelfAndSublayersWithIsCancelledBlock:displayBlocks:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:49"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T3["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T4["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T5["method:ASDisplayNode::__willDisplayNodeContentWithRenderingContext:drawParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:275"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T6["method:ASDisplayNode::__didDisplayNodeContentWithRenderingContext:image:drawParameters:backgroundColor:borderWidth:borderColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:299"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T7["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T8["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::__willDisplayNodeContentWithRenderingContext:drawParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:275"]
  T9["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::__willDisplayNodeContentWithRenderingContext:drawParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:275"]
  T10["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::__willDisplayNodeContentWithRenderingContext:drawParameters:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:275"]
  T11["method:ASDisplayNode::willDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:470"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::__didDisplayNodeContentWithRenderingContext:image:drawParameters:backgroundColor:borderWidth:borderColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:299"]
  T12["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::__didDisplayNodeContentWithRenderingContext:image:drawParameters:backgroundColor:borderWidth:borderColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:299"]
  T13["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::__didDisplayNodeContentWithRenderingContext:image:drawParameters:backgroundColor:borderWidth:borderColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:299"]
  T14["method:ASDisplayNode::didDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:476"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T15["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T16["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T17["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T18["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T19["function:ASDisplayNodeSetResizableContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:18"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T20["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T21["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T22["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T23["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S23 -->|calls| T23
  S24["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T24["function:ASHierarchyStateIncludesRangeManaged<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:51"]
  S24 -->|calls| T24
  S25["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T25["function:ASHierarchyStateIncludesLayoutPending<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:46"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

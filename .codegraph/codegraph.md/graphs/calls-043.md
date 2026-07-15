# `calls 符号关系 - 043`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T1["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S1 -->|calls| T1
  S2["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T2["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S2 -->|calls| T2
  S3["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T3["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S3 -->|calls| T3
  S4["method:ASImageNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T4["method:ASImageNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:752"]
  S4 -->|calls| T4
  S5["method:ASImageNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T5["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S5 -->|calls| T5
  S6["function:ASImageNodeRoundBorderModificationBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:791"]
  T6["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S6 -->|calls| T6
  S7["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:813"]
  T7["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:1"]
  T8["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S8 -->|calls| T8
  S9["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  T9["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S9 -->|calls| T9
  S10["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T10["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S10 -->|calls| T10
  S11["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T11["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S11 -->|calls| T11
  S12["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T12["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:1"]
  T13["function:ASCreatePointerBasedMutableSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:265"]
  S13 -->|calls| T13
  S14["function:_ASInitializeSignpostObservers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:43"]
  T14["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S14 -->|calls| T14
  S15["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  T15["function:ASNotifyInitialized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:107"]
  S15 -->|calls| T15
  S16["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  T16["function:_ASInitializeSignpostObservers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:43"]
  S16 -->|calls| T16
  S17["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  T17["property:ASDisplayNode::layer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.h:237"]
  S17 -->|calls| T17
  S18["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  T18["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S18 -->|calls| T18
  S19["function:ASInitializeFrameworkMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:92"]
  T19["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  S19 -->|calls| T19
  S20["function:ASInitializeFrameworkMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:92"]
  T20["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  S20 -->|calls| T20
  S21["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  T21["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S21 -->|calls| T21
  S22["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  T22["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S22 -->|calls| T22
  S23["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  T23["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S23 -->|calls| T23
  S24["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  T24["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S24 -->|calls| T24
  S25["function:ASFloorSizeValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:191"]
  T25["function:ASFloorPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

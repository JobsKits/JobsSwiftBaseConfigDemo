# `calls 符号关系 - 043`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:631"]
  T1["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:631"]
  S1 -->|calls| T1
  S2["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:631"]
  T2["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:609"]
  S2 -->|calls| T2
  S3["method:ASImageNode::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:638"]
  T3["method:ASImageNode::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:638"]
  S3 -->|calls| T3
  S4["method:ASImageNode::setCropEnabled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:654"]
  T4["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  S4 -->|calls| T4
  S5["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T5["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S5 -->|calls| T5
  S6["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T6["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S6 -->|calls| T6
  S7["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T7["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S7 -->|calls| T7
  S8["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T8["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S8 -->|calls| T8
  S9["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T9["method:_ASDisplayLayer::displayImmediately<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:158"]
  S9 -->|calls| T9
  S10["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T10["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S10 -->|calls| T10
  S11["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T11["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S11 -->|calls| T11
  S12["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T12["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S12 -->|calls| T12
  S13["method:ASImageNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T13["method:ASImageNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:752"]
  S13 -->|calls| T13
  S14["method:ASImageNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T14["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S14 -->|calls| T14
  S15["function:ASImageNodeRoundBorderModificationBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:791"]
  T15["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S15 -->|calls| T15
  S16["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:813"]
  T16["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:1"]
  T17["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S17 -->|calls| T17
  S18["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  T18["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S18 -->|calls| T18
  S19["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T19["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S19 -->|calls| T19
  S20["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T20["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S20 -->|calls| T20
  S21["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T21["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:1"]
  T22["function:ASCreatePointerBasedMutableSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:265"]
  S22 -->|calls| T22
  S23["function:_ASInitializeSignpostObservers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:43"]
  T23["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S23 -->|calls| T23
  S24["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  T24["function:ASNotifyInitialized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:107"]
  S24 -->|calls| T24
  S25["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  T25["function:_ASInitializeSignpostObservers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:43"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 093`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoNode::prepareToPlayAsset:withKeys:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:144"]
  T1["method:ASVideoNode::constructPlayerItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:126"]
  S1 -->|calls| T1
  S2["method:ASVideoNode::prepareToPlayAsset:withKeys:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:144"]
  T2["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  S2 -->|calls| T2
  S3["method:ASVideoNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:247"]
  T3["method:ASVideoNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:247"]
  S3 -->|calls| T3
  S4["method:ASVideoNode::calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:254"]
  T4["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S4 -->|calls| T4
  S5["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  T5["method:ASVideoNode::imageAtTime:completionHandler:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:289"]
  S5 -->|calls| T5
  S6["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  T6["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S6 -->|calls| T6
  S7["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  T7["function:ASAssetIsEqual<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  S7 -->|calls| T7
  S8["method:ASVideoNode::imageAtTime:completionHandler:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:289"]
  T8["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S8 -->|calls| T8
  S9["method:ASVideoNode::setVideoPlaceholderImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:315"]
  T9["function:ASContentModeFromVideoGravity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:28"]
  S9 -->|calls| T9
  S10["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T10["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S10 -->|calls| T10
  S11["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T11["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S11 -->|calls| T11
  S12["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T12["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S12 -->|calls| T12
  S13["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T13["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S13 -->|calls| T13
  S14["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T14["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  S14 -->|calls| T14
  S15["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T15["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S15 -->|calls| T15
  S16["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T16["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S16 -->|calls| T16
  S17["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T17["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S17 -->|calls| T17
  S18["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T18["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S18 -->|calls| T18
  S19["method:ASVideoNode::tapped<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:385"]
  T19["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S19 -->|calls| T19
  S20["method:ASVideoNode::tapped<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:385"]
  T20["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S20 -->|calls| T20
  S21["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T21["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  S21 -->|calls| T21
  S22["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T22["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S22 -->|calls| T22
  S23["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T23["method:ASVideoNode::prepareToPlayAsset:withKeys:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:144"]
  S23 -->|calls| T23
  S24["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  T24["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  S24 -->|calls| T24
  S25["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  T25["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

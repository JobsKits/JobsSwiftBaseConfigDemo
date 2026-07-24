# `calls 符号关系 - 074`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:97"]
  T1["method:ASVideoNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:97"]
  S1 -->|calls| T1
  S2["method:ASVideoNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:97"]
  T2["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S2 -->|calls| T2
  S3["method:ASVideoNode::constructPlayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:114"]
  T3["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S3 -->|calls| T3
  S4["method:ASVideoNode::constructPlayerItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:126"]
  T4["method:ASVideoPlayerNode::asset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:191"]
  S4 -->|calls| T4
  S5["method:ASVideoNode::prepareToPlayAsset:withKeys:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:144"]
  T5["method:ASVideoNode::constructPlayerItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:126"]
  S5 -->|calls| T5
  S6["method:ASVideoNode::prepareToPlayAsset:withKeys:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:144"]
  T6["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  S6 -->|calls| T6
  S7["method:ASVideoNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:247"]
  T7["method:ASVideoNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:247"]
  S7 -->|calls| T7
  S8["method:ASVideoNode::calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:254"]
  T8["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S8 -->|calls| T8
  S9["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  T9["method:ASVideoNode::imageAtTime:completionHandler:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:289"]
  S9 -->|calls| T9
  S10["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  T10["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S10 -->|calls| T10
  S11["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  T11["function:ASAssetIsEqual<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  S11 -->|calls| T11
  S12["method:ASVideoNode::imageAtTime:completionHandler:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:289"]
  T12["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S12 -->|calls| T12
  S13["method:ASVideoNode::setVideoPlaceholderImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:315"]
  T13["function:ASContentModeFromVideoGravity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:28"]
  S13 -->|calls| T13
  S14["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T14["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S14 -->|calls| T14
  S15["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T15["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S15 -->|calls| T15
  S16["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T16["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S16 -->|calls| T16
  S17["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T17["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S17 -->|calls| T17
  S18["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T18["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  S18 -->|calls| T18
  S19["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T19["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S19 -->|calls| T19
  S20["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T20["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S20 -->|calls| T20
  S21["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T21["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S21 -->|calls| T21
  S22["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T22["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S22 -->|calls| T22
  S23["method:ASVideoNode::tapped<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:385"]
  T23["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S23 -->|calls| T23
  S24["method:ASVideoNode::tapped<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:385"]
  T24["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S24 -->|calls| T24
  S25["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T25["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

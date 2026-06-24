# `calls 符号关系 - 075`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T1["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S1 -->|calls| T1
  S2["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T2["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S2 -->|calls| T2
  S3["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T3["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  S3 -->|calls| T3
  S4["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T4["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S4 -->|calls| T4
  S5["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T5["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S5 -->|calls| T5
  S6["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T6["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S6 -->|calls| T6
  S7["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T7["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S7 -->|calls| T7
  S8["method:ASVideoNode::tapped<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:385"]
  T8["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S8 -->|calls| T8
  S9["method:ASVideoNode::tapped<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:385"]
  T9["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S9 -->|calls| T9
  S10["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T10["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  S10 -->|calls| T10
  S11["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T11["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S11 -->|calls| T11
  S12["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T12["method:ASVideoNode::prepareToPlayAsset:withKeys:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:144"]
  S12 -->|calls| T12
  S13["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  T13["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  S13 -->|calls| T13
  S14["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  T14["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  S14 -->|calls| T14
  S15["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  T15["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S15 -->|calls| T15
  S16["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  T16["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  S16 -->|calls| T16
  S17["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  T17["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S17 -->|calls| T17
  S18["method:ASVideoNode::setAssetURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:506"]
  T18["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  S18 -->|calls| T18
  S19["method:ASVideoNode::setAsset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:528"]
  T19["function:ASAssetIsEqual<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  S19 -->|calls| T19
  S20["method:ASVideoNode::setAsset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:528"]
  T20["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  S20 -->|calls| T20
  S21["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  T21["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  S21 -->|calls| T21
  S22["method:ASVideoNode::setGravity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:620"]
  T22["function:ASContentModeFromVideoGravity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:28"]
  S22 -->|calls| T22
  S23["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  T23["method:ASVideoNode::constructPlayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:114"]
  S23 -->|calls| T23
  S24["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  T24["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S24 -->|calls| T24
  S25["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  T25["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

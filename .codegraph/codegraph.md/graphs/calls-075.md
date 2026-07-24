# `calls 符号关系 - 075`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T1["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S1 -->|calls| T1
  S2["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T2["method:ASVideoNode::prepareToPlayAsset:withKeys:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:144"]
  S2 -->|calls| T2
  S3["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  T3["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  S3 -->|calls| T3
  S4["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  T4["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  S4 -->|calls| T4
  S5["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  T5["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S5 -->|calls| T5
  S6["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  T6["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  S6 -->|calls| T6
  S7["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  T7["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S7 -->|calls| T7
  S8["method:ASVideoNode::setAssetURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:506"]
  T8["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  S8 -->|calls| T8
  S9["method:ASVideoNode::setAsset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:528"]
  T9["function:ASAssetIsEqual<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  S9 -->|calls| T9
  S10["method:ASVideoNode::setAsset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:528"]
  T10["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  S10 -->|calls| T10
  S11["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  T11["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  S11 -->|calls| T11
  S12["method:ASVideoNode::setGravity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:620"]
  T12["function:ASContentModeFromVideoGravity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:28"]
  S12 -->|calls| T12
  S13["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  T13["method:ASVideoNode::constructPlayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:114"]
  S13 -->|calls| T13
  S14["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  T14["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S14 -->|calls| T14
  S15["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  T15["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  S15 -->|calls| T15
  S16["method:ASVideoNode::resetToPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:721"]
  T16["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S16 -->|calls| T16
  S17["method:ASVideoNode::applicationDidBecomeActive:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:737"]
  T17["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S17 -->|calls| T17
  S18["method:ASVideoNode::didPlayToEnd:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:744"]
  T18["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S18 -->|calls| T18
  S19["method:ASVideoNode::didPlayToEnd:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:744"]
  T19["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S19 -->|calls| T19
  S20["method:ASVideoNode::setPlayerNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:811"]
  T20["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T21["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T22["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T23["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T24["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T25["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 078`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  T1["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S1 -->|calls| T1
  S2["method:ASVideoPlayerNode::showSpinner<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:637"]
  T2["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S2 -->|calls| T2
  S3["method:ASVideoPlayerNode::showSpinner<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:637"]
  T3["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S3 -->|calls| T3
  S4["method:ASVideoPlayerNode::didTapPlaybackButton:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:688"]
  T4["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  S4 -->|calls| T4
  S5["method:ASVideoPlayerNode::seekToTime:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:717"]
  T5["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  S5 -->|calls| T5
  S6["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  T6["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S6 -->|calls| T6
  S7["method:ASVideoPlayerNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:734"]
  T7["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S7 -->|calls| T7
  S8["method:ASVideoPlayerNode::isPlaying<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:739"]
  T8["method:ASVideoNode::isPlaying<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:704"]
  S8 -->|calls| T8
  S9["method:ASVideoPlayerNode::resetToPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:744"]
  T9["method:ASVideoNode::resetToPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:721"]
  S9 -->|calls| T9
  S10["method:ASVideoPlayerNode::layoutSpecThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:779"]
  T10["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S10 -->|calls| T10
  S11["method:ASVideoPlayerNode::defaultLayoutSpecThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:813"]
  T11["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S11 -->|calls| T11
  S12["method:ASVideoPlayerNode::defaultLayoutSpecThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:813"]
  T12["method:ASVideoPlayerNode::controlsForLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:749"]
  S12 -->|calls| T12
  S13["method:ASVideoPlayerNode::setControlsDisabled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:886"]
  T13["method:ASVideoPlayerNode::removeControls<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:311"]
  S13 -->|calls| T13
  S14["method:ASVideoPlayerNode::setControlsDisabled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:886"]
  T14["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  S14 -->|calls| T14
  S15["function:ASMainThreadAssertionsAreDisabled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASAssert.mm:41"]
  T15["function:ASMainThreadAssertionsDisabledKey<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASAssert.mm:32"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T16["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T17["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T18["function:ASLayerToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T19["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T20["method:ASResponderChainEnumerator::nextObject<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:28"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T21["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T22["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T23["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T24["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T25["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 078`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoPlayerNode::updateElapsedTimeLabel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:494"]
  T1["method:ASVideoPlayerNode::timeStringForCMTime:forTimeLabelType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:989"]
  S1 -->|calls| T1
  S2["method:ASVideoPlayerNode::updateElapsedTimeLabel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:494"]
  T2["method:ASVideoPlayerNode::timeLabelAttributedStringForString:forControlType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:503"]
  S2 -->|calls| T2
  S3["method:ASVideoPlayerNode::timeLabelAttributedStringForString:forControlType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:503"]
  T3["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S3 -->|calls| T3
  S4["method:ASVideoPlayerNode::videoNode:willChangePlayerState:toState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:522"]
  T4["method:ASVideoPlayerNode::updateDurationTimeLabel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:485"]
  S4 -->|calls| T4
  S5["method:ASVideoPlayerNode::videoNode:willChangePlayerState:toState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:522"]
  T5["method:ASVideoPlayerNode::removeSpinner<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:672"]
  S5 -->|calls| T5
  S6["method:ASVideoPlayerNode::videoNode:willChangePlayerState:toState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:522"]
  T6["method:ASVideoPlayerNode::showSpinner<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:637"]
  S6 -->|calls| T6
  S7["method:ASVideoPlayerNode::videoNode:willChangePlayerState:toState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:522"]
  T7["method:ASVideoPlayerNode::removeSpinner<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:672"]
  S7 -->|calls| T7
  S8["method:ASVideoPlayerNode::didTapVideoNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:583"]
  T8["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  S8 -->|calls| T8
  S9["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  T9["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S9 -->|calls| T9
  S10["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  T10["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S10 -->|calls| T10
  S11["method:ASVideoPlayerNode::showSpinner<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:637"]
  T11["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S11 -->|calls| T11
  S12["method:ASVideoPlayerNode::showSpinner<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:637"]
  T12["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S12 -->|calls| T12
  S13["method:ASVideoPlayerNode::didTapPlaybackButton:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:688"]
  T13["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  S13 -->|calls| T13
  S14["method:ASVideoPlayerNode::seekToTime:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:717"]
  T14["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  S14 -->|calls| T14
  S15["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  T15["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S15 -->|calls| T15
  S16["method:ASVideoPlayerNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:734"]
  T16["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S16 -->|calls| T16
  S17["method:ASVideoPlayerNode::isPlaying<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:739"]
  T17["method:ASVideoNode::isPlaying<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:704"]
  S17 -->|calls| T17
  S18["method:ASVideoPlayerNode::resetToPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:744"]
  T18["method:ASVideoNode::resetToPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:721"]
  S18 -->|calls| T18
  S19["method:ASVideoPlayerNode::layoutSpecThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:779"]
  T19["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S19 -->|calls| T19
  S20["method:ASVideoPlayerNode::defaultLayoutSpecThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:813"]
  T20["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S20 -->|calls| T20
  S21["method:ASVideoPlayerNode::defaultLayoutSpecThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:813"]
  T21["method:ASVideoPlayerNode::controlsForLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:749"]
  S21 -->|calls| T21
  S22["method:ASVideoPlayerNode::setControlsDisabled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:886"]
  T22["method:ASVideoPlayerNode::removeControls<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:311"]
  S22 -->|calls| T22
  S23["method:ASVideoPlayerNode::setControlsDisabled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:886"]
  T23["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  S23 -->|calls| T23
  S24["function:ASMainThreadAssertionsAreDisabled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASAssert.mm:41"]
  T24["function:ASMainThreadAssertionsDisabledKey<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASAssert.mm:32"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T25["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

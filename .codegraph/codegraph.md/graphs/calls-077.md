# `calls 符号关系 - 077`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T1["method:ASVideoPlayerNode::_locked_createScrubber<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:425"]
  S1 -->|calls| T1
  S2["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T2["method:ASVideoPlayerNode::_locked_createFullScreenButton<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:366"]
  S2 -->|calls| T2
  S3["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T3["method:ASVideoPlayerNode::_locked_createControlFlexGrowSpacer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:473"]
  S3 -->|calls| T3
  S4["method:ASVideoPlayerNode::removeControls<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:311"]
  T4["method:ASVideoPlayerNode::_locked_cleanCachedControls<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:327"]
  S4 -->|calls| T4
  S5["method:ASVideoPlayerNode::_locked_cleanCachedControls<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:327"]
  T5["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S5 -->|calls| T5
  S6["method:ASVideoPlayerNode::_locked_createPlaybackButton<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:338"]
  T6["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S6 -->|calls| T6
  S7["method:ASVideoPlayerNode::_locked_createFullScreenButton<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:366"]
  T7["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S7 -->|calls| T7
  S8["method:ASVideoPlayerNode::_locked_createElapsedTextField<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:388"]
  T8["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S8 -->|calls| T8
  S9["method:ASVideoPlayerNode::_locked_createElapsedTextField<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:388"]
  T9["method:ASVideoPlayerNode::timeLabelAttributedStringForString:forControlType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:503"]
  S9 -->|calls| T9
  S10["method:ASVideoPlayerNode::_locked_createDurationTextField<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:406"]
  T10["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S10 -->|calls| T10
  S11["method:ASVideoPlayerNode::_locked_createDurationTextField<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:406"]
  T11["method:ASVideoPlayerNode::timeLabelAttributedStringForString:forControlType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:503"]
  S11 -->|calls| T11
  S12["method:ASVideoPlayerNode::_locked_createDurationTextField<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:406"]
  T12["method:ASVideoPlayerNode::updateDurationTimeLabel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:485"]
  S12 -->|calls| T12
  S13["method:ASVideoPlayerNode::_locked_createControlFlexGrowSpacer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:473"]
  T13["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S13 -->|calls| T13
  S14["method:ASVideoPlayerNode::updateDurationTimeLabel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:485"]
  T14["method:ASVideoPlayerNode::timeStringForCMTime:forTimeLabelType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:989"]
  S14 -->|calls| T14
  S15["method:ASVideoPlayerNode::updateDurationTimeLabel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:485"]
  T15["method:ASVideoPlayerNode::timeLabelAttributedStringForString:forControlType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:503"]
  S15 -->|calls| T15
  S16["method:ASVideoPlayerNode::updateElapsedTimeLabel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:494"]
  T16["method:ASVideoPlayerNode::timeStringForCMTime:forTimeLabelType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:989"]
  S16 -->|calls| T16
  S17["method:ASVideoPlayerNode::updateElapsedTimeLabel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:494"]
  T17["method:ASVideoPlayerNode::timeLabelAttributedStringForString:forControlType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:503"]
  S17 -->|calls| T17
  S18["method:ASVideoPlayerNode::timeLabelAttributedStringForString:forControlType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:503"]
  T18["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S18 -->|calls| T18
  S19["method:ASVideoPlayerNode::videoNode:willChangePlayerState:toState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:522"]
  T19["method:ASVideoPlayerNode::updateDurationTimeLabel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:485"]
  S19 -->|calls| T19
  S20["method:ASVideoPlayerNode::videoNode:willChangePlayerState:toState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:522"]
  T20["method:ASVideoPlayerNode::removeSpinner<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:672"]
  S20 -->|calls| T20
  S21["method:ASVideoPlayerNode::videoNode:willChangePlayerState:toState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:522"]
  T21["method:ASVideoPlayerNode::showSpinner<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:637"]
  S21 -->|calls| T21
  S22["method:ASVideoPlayerNode::videoNode:willChangePlayerState:toState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:522"]
  T22["method:ASVideoPlayerNode::removeSpinner<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:672"]
  S22 -->|calls| T22
  S23["method:ASVideoPlayerNode::didTapVideoNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:583"]
  T23["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  S23 -->|calls| T23
  S24["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  T24["method:ASVideoNode::pause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S24 -->|calls| T24
  S25["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  T25["method:ASVideoNode::play<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

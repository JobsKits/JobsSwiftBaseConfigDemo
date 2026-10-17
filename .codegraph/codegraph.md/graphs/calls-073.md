# `calls 符号关系 - 073`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:PlayerControlsView::hide<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:184"]
  T1["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S1 -->|calls| T1
  S2["method:PlayerControlsView::updateCurrentTimeLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:193"]
  T2["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S2 -->|calls| T2
  S3["method:PlayerControlsView::updateCurrentTimeLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:193"]
  T3["method:PlayerControlsView::formatTime<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:201"]
  S3 -->|calls| T3
  S4["method:PlayerControlsView::updateDurationLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:197"]
  T4["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S4 -->|calls| T4
  S5["method:PlayerControlsView::updateDurationLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:197"]
  T5["method:PlayerControlsView::formatTime<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:201"]
  S5 -->|calls| T5
  S6["class:SphereGeometry<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/SphereGeometry.swift:16"]
  T6["method:SphereGeometry::generateSphere<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/SphereGeometry.swift:27"]
  S6 -->|calls| T6
  S7["method:VideoTextureDisplayLinkTarget::tick<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureDisplayLinkTarget.swift:19"]
  T7["method:VideoTextureManager::updateTexture<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:177"]
  S7 -->|calls| T7
  S8["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:63"]
  T8["method:VideoTextureManager::clearPlayback<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:88"]
  S8 -->|calls| T8
  S9["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:63"]
  T9["method:VideoTextureManager::fail<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:132"]
  S9 -->|calls| T9
  S10["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:63"]
  T10["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S10 -->|calls| T10
  S11["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:63"]
  T11["method:VideoTextureManager::setupDisplayLink<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:143"]
  S11 -->|calls| T11
  S12["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:63"]
  T12["method:VideoTextureManager::setupTimeObserver<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:151"]
  S12 -->|calls| T12
  S13["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:63"]
  T13["method:VideoTextureManager::setupNotifications<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:164"]
  S13 -->|calls| T13
  S14["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:63"]
  T14["method:VideoTextureManager::observePlayback<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:107"]
  S14 -->|calls| T14
  S15["method:VideoTextureManager::clearPlayback<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:88"]
  T15["method:JobsLiveFloatPlayer::pause<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:78"]
  S15 -->|calls| T15
  S16["method:VideoTextureManager::observePlayback<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:107"]
  T16["method:VideoTextureManager::fail<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:132"]
  S16 -->|calls| T16
  S17["method:VideoTextureManager::observePlayback<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:107"]
  T17["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S17 -->|calls| T17
  S18["method:VideoTextureManager::fail<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:132"]
  T18["method:PNPlayerDemoVC::videoPlaybackStateChanged<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PNPlayer/Demo@PNPlayer.swift:186"]
  S18 -->|calls| T18
  S19["method:VideoTextureManager::fail<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:132"]
  T19["method:VideoTextureManagerDelegate::videoPlaybackDidFail<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:20"]
  S19 -->|calls| T19
  S20["method:VideoTextureManager::setupDisplayLink<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:143"]
  T20["method:VideoTextureDisplayLinkTarget::tick<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureDisplayLinkTarget.swift:19"]
  S20 -->|calls| T20
  S21["method:VideoTextureManager::playerItemDidReachEnd<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:173"]
  T21["method:PNPlayerDemoVC::videoPlaybackStateChanged<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PNPlayer/Demo@PNPlayer.swift:186"]
  S21 -->|calls| T21
  S22["method:VideoTextureManager::updateTexture<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:177"]
  T22["method:VideoTextureManager::createTexture<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:187"]
  S22 -->|calls| T22
  S23["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:208"]
  T23["method:VideoPlayer::playToView:<br/>Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:200"]
  S23 -->|calls| T23
  S24["method:VideoTextureManager::pause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:215"]
  T24["method:PNPlayerDemoVC::videoPlaybackStateChanged<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PNPlayer/Demo@PNPlayer.swift:186"]
  S24 -->|calls| T24
  S25["method:VideoTextureManager::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:220"]
  T25["method:VideoTextureManager::pause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:215"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

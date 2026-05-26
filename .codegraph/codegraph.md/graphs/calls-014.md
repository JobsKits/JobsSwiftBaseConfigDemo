# `calls 符号关系 - 014`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T1["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S1 -->|calls| T1
  S2["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T2["method:UIStackView::bySpacing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:36"]
  S2 -->|calls| T2
  S3["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T3["method:UIStackView::byDistribution<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:24"]
  S3 -->|calls| T3
  S4["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T4["method:UIStackView::byAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:30"]
  S4 -->|calls| T4
  S5["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T5["method:UIStackView::byAxis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:18"]
  S5 -->|calls| T5
  S6["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T6["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:128"]
  S6 -->|calls| T6
  S7["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T7["method:PlayerControlsView::setupLayout<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:142"]
  S7 -->|calls| T7
  S8["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T8["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:128"]
  S8 -->|calls| T8
  S9["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T9["method:PlayerControlsView::setupLayout<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:142"]
  S9 -->|calls| T9
  S10["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:128"]
  T10["method:UIStackView::byAddArrangedSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:100"]
  S10 -->|calls| T10
  S11["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:128"]
  T11["method:PHPickerViewController::byAddTo<br/>JobsByPods/JobsByPhotosUI@Pods/PHPickerViewController.swift:78"]
  S11 -->|calls| T11
  S12["method:PlayerControlsView::updatePlayPauseButton<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:156"]
  T12["method:UIButton::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:823"]
  S12 -->|calls| T12
  S13["method:PlayerControlsView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:162"]
  T13["method:PlayerControlsView::updateDurationLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:200"]
  S13 -->|calls| T13
  S14["method:PlayerControlsView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:162"]
  T14["method:PlayerControlsView::updateCurrentTimeLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:196"]
  S14 -->|calls| T14
  S15["method:PlayerControlsView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:162"]
  T15["method:PlayerControlsView::updateDurationLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:200"]
  S15 -->|calls| T15
  S16["method:PlayerControlsView::updateCurrentTimeLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:196"]
  T16["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S16 -->|calls| T16
  S17["method:PlayerControlsView::updateCurrentTimeLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:196"]
  T17["method:PlayerControlsView::formatTime<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:204"]
  S17 -->|calls| T17
  S18["method:PlayerControlsView::updateDurationLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:200"]
  T18["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S18 -->|calls| T18
  S19["method:PlayerControlsView::updateDurationLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:200"]
  T19["method:PlayerControlsView::formatTime<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:204"]
  S19 -->|calls| T19
  S20["class:SphereGeometry<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/SphereGeometry.swift:17"]
  T20["method:SphereGeometry::generateSphere<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/SphereGeometry.swift:28"]
  S20 -->|calls| T20
  S21["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:54"]
  T21["method:VideoTextureManager::setupDisplayLink<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:72"]
  S21 -->|calls| T21
  S22["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:54"]
  T22["method:VideoTextureManager::setupTimeObserver<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:78"]
  S22 -->|calls| T22
  S23["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:54"]
  T23["method:VideoTextureManager::setupNotifications<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:88"]
  S23 -->|calls| T23
  S24["method:VideoTextureManager::setupTimeObserver<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:78"]
  T24["method:PNPlayerDemoVC::videoDidUpdateTime<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PNPlayer/Demo@PNPlayer.swift:164"]
  S24 -->|calls| T24
  S25["method:VideoTextureManager::playerItemDidReachEnd<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:97"]
  T25["method:PNPlayerDemoVC::videoPlaybackStateChanged<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PNPlayer/Demo@PNPlayer.swift:168"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

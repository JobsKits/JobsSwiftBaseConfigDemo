# `calls 符号关系 - 013`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T1["method:UIAlertAction::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:32"]
  S1 -->|calls| T1
  S2["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T2["method:UIAlertController::byTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:60"]
  S2 -->|calls| T2
  S3["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T3["method:JXSegmentedView::byContentEdgeInsets<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:79"]
  S3 -->|calls| T3
  S4["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T4["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:19"]
  S4 -->|calls| T4
  S5["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T5["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:29"]
  S5 -->|calls| T5
  S6["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T6["method:PNPlayerDemoVC::didTapPlayPause<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PNPlayer/Demo@PNPlayer.swift:152"]
  S6 -->|calls| T6
  S7["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T7["method:UISlider::byMaximumTrackTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISlider.swift:46"]
  S7 -->|calls| T7
  S8["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T8["method:UISlider::byMinimumTrackTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISlider.swift:40"]
  S8 -->|calls| T8
  S9["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T9["method:UISlider::byThumbTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISlider.swift:52"]
  S9 -->|calls| T9
  S10["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T10["method:UISlider::byValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISlider.swift:22"]
  S10 -->|calls| T10
  S11["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T11["method:UISlider::byMaximumValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISlider.swift:34"]
  S11 -->|calls| T11
  S12["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T12["method:UISlider::byMinimumValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISlider.swift:28"]
  S12 -->|calls| T12
  S13["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T13["method:PlayerControlsView::updateCurrentTimeLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:196"]
  S13 -->|calls| T13
  S14["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T14["method:PNPlayerDemoVC::didSeekToTime<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PNPlayer/Demo@PNPlayer.swift:157"]
  S14 -->|calls| T14
  S15["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T15["method:UILabel::byCompressionResistance<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:122"]
  S15 -->|calls| T15
  S16["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T16["method:UILabel::byHugging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:107"]
  S16 -->|calls| T16
  S17["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T17["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S17 -->|calls| T17
  S18["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T18["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S18 -->|calls| T18
  S19["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T19["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S19 -->|calls| T19
  S20["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T20["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S20 -->|calls| T20
  S21["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T21["method:UILabel::byCompressionResistance<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:122"]
  S21 -->|calls| T21
  S22["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T22["method:UILabel::byHugging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:107"]
  S22 -->|calls| T22
  S23["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T23["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S23 -->|calls| T23
  S24["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T24["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S24 -->|calls| T24
  S25["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:23"]
  T25["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

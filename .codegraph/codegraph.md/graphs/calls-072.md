# `calls 符号关系 - 072`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T1["method:UIButton::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:873"]
  S1 -->|calls| T1
  S2["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T2["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S2 -->|calls| T2
  S3["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T3["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S3 -->|calls| T3
  S4["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T4["method:PlayerControlsView::updateCurrentTimeLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:193"]
  S4 -->|calls| T4
  S5["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T5["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S5 -->|calls| T5
  S6["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T6["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S6 -->|calls| T6
  S7["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T7["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S7 -->|calls| T7
  S8["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T8["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:130"]
  S8 -->|calls| T8
  S9["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T9["method:PlayerControlsView::setupLayout<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:142"]
  S9 -->|calls| T9
  S10["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T10["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:130"]
  S10 -->|calls| T10
  S11["class:PlayerControlsView<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:25"]
  T11["method:PlayerControlsView::setupLayout<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:142"]
  S11 -->|calls| T11
  S12["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:130"]
  T12["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S12 -->|calls| T12
  S13["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:130"]
  T13["method:UIView::byCornerRadius<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:33"]
  S13 -->|calls| T13
  S14["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:130"]
  T14["method:UIView::byMasksToBounds<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:18"]
  S14 -->|calls| T14
  S15["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:130"]
  T15["method:UIStackView::byAddArrangedSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:97"]
  S15 -->|calls| T15
  S16["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:130"]
  T16["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S16 -->|calls| T16
  S17["method:PlayerControlsView::setupUI<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:130"]
  T17["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S17 -->|calls| T17
  S18["method:PlayerControlsView::updatePlayPauseButton<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:156"]
  T18["method:UIButton::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:873"]
  S18 -->|calls| T18
  S19["method:PlayerControlsView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:162"]
  T19["method:PlayerControlsView::updateDurationLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:197"]
  S19 -->|calls| T19
  S20["method:PlayerControlsView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:162"]
  T20["method:JobsSwiftNumberStepper::setValue<br/>JobsByPods/JobsSwiftNumberStepper@Pods/Core/JobsSwiftNumberStepper/JobsSwiftNumberStepper.swift:117"]
  S20 -->|calls| T20
  S21["method:PlayerControlsView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:162"]
  T21["method:PlayerControlsView::updateCurrentTimeLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:193"]
  S21 -->|calls| T21
  S22["method:PlayerControlsView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:162"]
  T22["method:PlayerControlsView::updateDurationLabel<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:197"]
  S22 -->|calls| T22
  S23["method:PlayerControlsView::show<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:176"]
  T23["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S23 -->|calls| T23
  S24["method:PlayerControlsView::show<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:176"]
  T24["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S24 -->|calls| T24
  S25["method:PlayerControlsView::hide<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/PlayerControlsView.swift:184"]
  T25["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

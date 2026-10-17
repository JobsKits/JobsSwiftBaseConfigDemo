# `calls 符号关系 - 156`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:22"]
  T1["method:UIButton::jobs_titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:125"]
  S1 -->|calls| T1
  S2["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:22"]
  T2["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:101"]
  S2 -->|calls| T2
  S3["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:22"]
  T3["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:101"]
  S3 -->|calls| T3
  S4["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:22"]
  T4["method:UIButton::jobs_backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:113"]
  S4 -->|calls| T4
  S5["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:22"]
  T5["method:UIButton::jobs_backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:113"]
  S5 -->|calls| T5
  S6["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:52"]
  T6["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:753"]
  S6 -->|calls| T6
  S7["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:52"]
  T7["method:UIButton::byTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:733"]
  S7 -->|calls| T7
  S8["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:52"]
  T8["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:753"]
  S8 -->|calls| T8
  S9["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:52"]
  T9["method:UIButton::byTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:733"]
  S9 -->|calls| T9
  S10["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:52"]
  T10["method:UIAlertController::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:372"]
  S10 -->|calls| T10
  S11["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:52"]
  T11["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:18"]
  S11 -->|calls| T11
  S12["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:52"]
  T12["method:BRPickerTheme::byTitleColor<br/>JobsByPods/BRPickerViewSwift@Pods/Theme/BRPickerTheme.swift:72"]
  S12 -->|calls| T12
  S13["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:52"]
  T13["method:UIButton::byTitleColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:803"]
  S13 -->|calls| T13
  S14["class:JobsCountdownBtnCtrl<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:83"]
  T14["method:JobsCountdownBtnCtrl::initialValue<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:182"]
  S14 -->|calls| T14
  S15["class:JobsCountdownBtnCtrl<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:83"]
  T15["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S15 -->|calls| T15
  S16["class:JobsCountdownBtnCtrl<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:83"]
  T16["method:JobsCountdownBtnCtrl::applyRender<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:223"]
  S16 -->|calls| T16
  S17["class:JobsCountdownBtnCtrl<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:83"]
  T17["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S17 -->|calls| T17
  S18["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:124"]
  T18["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:163"]
  S18 -->|calls| T18
  S19["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:124"]
  T19["method:JobsCountdownBtnCtrl::initialValue<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:182"]
  S19 -->|calls| T19
  S20["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:124"]
  T20["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S20 -->|calls| T20
  S21["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:124"]
  T21["method:JobsCountdownBtnCtrl::applyRender<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:223"]
  S21 -->|calls| T21
  S22["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:124"]
  T22["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S22 -->|calls| T22
  S23["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:124"]
  T23["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:192"]
  S23 -->|calls| T23
  S24["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:163"]
  T24["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S24 -->|calls| T24
  S25["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:163"]
  T25["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

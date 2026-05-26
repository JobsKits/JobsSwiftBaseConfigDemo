# `calls 符号关系 - 118`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:101"]
  T1["method:BRBasePicker::byTitle<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:26"]
  S1 -->|calls| T1
  S2["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:20"]
  T2["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  S2 -->|calls| T2
  S3["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:20"]
  T3["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  S3 -->|calls| T3
  S4["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:20"]
  T4["method:UIButton::jobs_attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:58"]
  S4 -->|calls| T4
  S5["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:20"]
  T5["method:UIButton::jobs_attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:58"]
  S5 -->|calls| T5
  S6["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:20"]
  T6["method:UIButton::jobs_titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:127"]
  S6 -->|calls| T6
  S7["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:20"]
  T7["method:UIButton::jobs_titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:127"]
  S7 -->|calls| T7
  S8["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:20"]
  T8["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:103"]
  S8 -->|calls| T8
  S9["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:20"]
  T9["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:103"]
  S9 -->|calls| T9
  S10["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:20"]
  T10["method:UIButton::jobs_backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:115"]
  S10 -->|calls| T10
  S11["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:20"]
  T11["method:UIButton::jobs_backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:115"]
  S11 -->|calls| T11
  S12["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  T12["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:719"]
  S12 -->|calls| T12
  S13["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  T13["method:UIButton::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:699"]
  S13 -->|calls| T13
  S14["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  T14["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:719"]
  S14 -->|calls| T14
  S15["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  T15["method:UIButton::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:699"]
  S15 -->|calls| T15
  S16["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  T16["method:UIBarButtonItemAppearance::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItemAppearance.swift:18"]
  S16 -->|calls| T16
  S17["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  T17["method:UIBarButtonItemAppearance::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItemAppearance.swift:18"]
  S17 -->|calls| T17
  S18["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  T18["method:UIButton::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:823"]
  S18 -->|calls| T18
  S19["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  T19["method:UIButton::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:823"]
  S19 -->|calls| T19
  S20["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  T20["method:UIButton::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:833"]
  S20 -->|calls| T20
  S21["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  T21["method:UIButton::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:833"]
  S21 -->|calls| T21
  S22["class:JobsCountdownBtnCtrl<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:88"]
  T22["method:JobsCountdownBtnCtrl::initialValue<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:187"]
  S22 -->|calls| T22
  S23["class:JobsCountdownBtnCtrl<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:88"]
  T23["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S23 -->|calls| T23
  S24["class:JobsCountdownBtnCtrl<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:88"]
  T24["method:JobsCountdownBtnCtrl::applyRender<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:225"]
  S24 -->|calls| T24
  S25["class:JobsCountdownBtnCtrl<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:88"]
  T25["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

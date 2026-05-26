# `calls 符号关系 - 119`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:129"]
  T1["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:168"]
  S1 -->|calls| T1
  S2["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:129"]
  T2["method:JobsCountdownBtnCtrl::initialValue<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:187"]
  S2 -->|calls| T2
  S3["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:129"]
  T3["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S3 -->|calls| T3
  S4["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:129"]
  T4["method:JobsCountdownBtnCtrl::applyRender<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:225"]
  S4 -->|calls| T4
  S5["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:129"]
  T5["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S5 -->|calls| T5
  S6["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:129"]
  T6["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:195"]
  S6 -->|calls| T6
  S7["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:168"]
  T7["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S7 -->|calls| T7
  S8["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:168"]
  T8["method:JobsLegacyButtonState::restore<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:54"]
  S8 -->|calls| T8
  S9["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:195"]
  T9["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:168"]
  S9 -->|calls| T9
  S10["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:195"]
  T10["method:JobsCountdownBtnCtrl::applyRender<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:225"]
  S10 -->|calls| T10
  S11["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:195"]
  T11["method:JobsTimer::onTick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:237"]
  S11 -->|calls| T11
  S12["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:195"]
  T12["method:JobsCountdownBtnCtrl::finishMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:246"]
  S12 -->|calls| T12
  S13["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:195"]
  T13["method:JobsCountdownBtnCtrl::applyRender<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:225"]
  S13 -->|calls| T13
  S14["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:195"]
  T14["method:JobsTimer::onTick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:237"]
  S14 -->|calls| T14
  S15["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:195"]
  T15["method:JobsCountdownBtnCtrl::finishMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:246"]
  S15 -->|calls| T15
  S16["method:JobsCountdownBtnCtrl::finishMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:246"]
  T16["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:168"]
  S16 -->|calls| T16
  S17["method:JobsCountdownBtnCtrl::finishMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:246"]
  T17["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:168"]
  S17 -->|calls| T17
  S18["method:JobsCountdownBtnCtrl::finishMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:246"]
  T18["method:JobsTimer::onFinish<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:243"]
  S18 -->|calls| T18
  S19["method:UIButton::byCountdownOnTapAuto<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:64"]
  T19["method:UIAlertAction::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:32"]
  S19 -->|calls| T19
  S20["method:UIButton::byCountdownOnTapAuto<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:64"]
  T20["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:129"]
  S20 -->|calls| T20
  S21["method:UIButton::jobsStopCountdown<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:84"]
  T21["method:JobsCountdownBinder::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:95"]
  S21 -->|calls| T21
  S22["method:UIButton::countdownStart<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:91"]
  T22["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:34"]
  S22 -->|calls| T22
  S23["method:UIButton::countdownStop<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:98"]
  T23["method:JobsCountdownBinder::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:95"]
  S23 -->|calls| T23
  S24["method:UIButton::countdownRestart<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:104"]
  T24["method:JobsCountdownBinder::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:95"]
  S24 -->|calls| T24
  S25["method:UIButton::countdownRestart<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:104"]
  T25["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:34"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

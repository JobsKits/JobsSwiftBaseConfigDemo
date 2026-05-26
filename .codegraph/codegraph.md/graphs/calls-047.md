# `calls 符号关系 - 047`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::cfgInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:84"]
  T1["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:63"]
  S1 -->|calls| T1
  S2["method:UIButton::cfgFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:87"]
  T2["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:63"]
  S2 -->|calls| T2
  S3["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:32"]
  T3["method:UIButton::applyDefaultTimerUI<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:72"]
  S3 -->|calls| T3
  S4["method:UIButton::onCountdownTick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:110"]
  T4["method:UIButton::onTimerTick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:86"]
  S4 -->|calls| T4
  S5["method:UIButton::onCountdownFinish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:120"]
  T5["method:UIButton::onTimerFinish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:99"]
  S5 -->|calls| T5
  S6["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  T6["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  S6 -->|calls| T6
  S7["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  T7["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S7 -->|calls| T7
  S8["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  T8["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:616"]
  S8 -->|calls| T8
  S9["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  T9["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:616"]
  S9 -->|calls| T9
  S10["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  T10["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  S10 -->|calls| T10
  S11["method:UIButton::pauseTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:235"]
  T11["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  S11 -->|calls| T11
  S12["method:UIButton::resumeTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:242"]
  T12["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S12 -->|calls| T12
  S13["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:249"]
  T13["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S13 -->|calls| T13
  S14["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:249"]
  T14["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:616"]
  S14 -->|calls| T14
  S15["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:249"]
  T15["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:616"]
  S15 -->|calls| T15
  S16["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:249"]
  T16["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  S16 -->|calls| T16
  S17["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  T17["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S17 -->|calls| T17
  S18["method:UIButton::startJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:335"]
  T18["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  S18 -->|calls| T18
  S19["method:UIButton::pauseJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:342"]
  T19["method:UIButton::pauseTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:235"]
  S19 -->|calls| T19
  S20["method:UIButton::resumeJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:345"]
  T20["method:UIButton::resumeTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:242"]
  S20 -->|calls| T20
  S21["method:UIButton::fireJobsTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:348"]
  T21["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:249"]
  S21 -->|calls| T21
  S22["method:UIButton::stopJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:351"]
  T22["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  S22 -->|calls| T22
  S23["method:UIButton::startJobsCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:354"]
  T23["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  S23 -->|calls| T23
  S24["method:UIButton::stopJobsCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:361"]
  T24["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  S24 -->|calls| T24
  S25["method:UIButton::byStartAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:86"]
  T25["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

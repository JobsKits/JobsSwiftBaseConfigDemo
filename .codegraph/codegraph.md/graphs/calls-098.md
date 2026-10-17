# `calls 符号关系 - 098`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::pauseTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:227"]
  T1["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S1 -->|calls| T1
  S2["method:UIButton::resumeTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:234"]
  T2["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:217"]
  S2 -->|calls| T2
  S3["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:241"]
  T3["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S3 -->|calls| T3
  S4["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:241"]
  T4["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:303"]
  S4 -->|calls| T4
  S5["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:303"]
  T5["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S5 -->|calls| T5
  S6["method:UIButton::startJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:323"]
  T6["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:127"]
  S6 -->|calls| T6
  S7["method:UIButton::pauseJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:330"]
  T7["method:UIButton::pauseTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:227"]
  S7 -->|calls| T7
  S8["method:UIButton::resumeJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:333"]
  T8["method:UIButton::resumeTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:234"]
  S8 -->|calls| T8
  S9["method:UIButton::fireJobsTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:336"]
  T9["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:241"]
  S9 -->|calls| T9
  S10["method:UIButton::stopJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:339"]
  T10["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:303"]
  S10 -->|calls| T10
  S11["method:UIButton::startJobsCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:342"]
  T11["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:127"]
  S11 -->|calls| T11
  S12["method:UIButton::stopJobsCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:349"]
  T12["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:303"]
  S12 -->|calls| T12
  S13["method:UIButton::byStartAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:87"]
  T13["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  S13 -->|calls| T13
  S14["method:UIButton::byStartAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:99"]
  T14["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  S14 -->|calls| T14
  S15["method:UIButton::byStartAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:111"]
  T15["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  S15 -->|calls| T15
  S16["method:UIButton::byStopAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:135"]
  T16["method:UIButton::_jobsStopTitleAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:218"]
  S16 -->|calls| T16
  S17["method:UIButton::byStopAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:135"]
  T17["method:UIButton::_jobsStopSubTitleAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:230"]
  S17 -->|calls| T17
  S18["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T18["method:UIButton::_jobsStopTitleAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:218"]
  S18 -->|calls| T18
  S19["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T19["method:UIButton::_jobsStopSubTitleAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:230"]
  S19 -->|calls| T19
  S20["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T20["method:UIButton::_jobsReceiveTickValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:242"]
  S20 -->|calls| T20
  S21["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T21["method:UIButton::_jobsTryFireEndIfAllFinished<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:301"]
  S21 -->|calls| T21
  S22["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T22["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:538"]
  S22 -->|calls| T22
  S23["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T23["method:UIButton::_jobsReceiveTickValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:242"]
  S23 -->|calls| T23
  S24["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T24["method:UIButton::_jobsTryFireEndIfAllFinished<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:301"]
  S24 -->|calls| T24
  S25["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T25["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:538"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

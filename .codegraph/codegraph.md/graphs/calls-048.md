# `calls 符号关系 - 048`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::byStartAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:98"]
  T1["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  S1 -->|calls| T1
  S2["method:UIButton::byStartAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:110"]
  T2["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  S2 -->|calls| T2
  S3["method:UIButton::byStopAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:134"]
  T3["method:UIButton::_jobsStopTitleAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:218"]
  S3 -->|calls| T3
  S4["method:UIButton::byStopAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:134"]
  T4["method:UIButton::_jobsStopSubTitleAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:230"]
  S4 -->|calls| T4
  S5["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T5["method:UIButton::_jobsStopTitleAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:218"]
  S5 -->|calls| T5
  S6["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T6["method:UIButton::_jobsStopSubTitleAnim<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:230"]
  S6 -->|calls| T6
  S7["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T7["method:UIButton::_jobsReceiveTickValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:242"]
  S7 -->|calls| T7
  S8["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T8["method:UIButton::_jobsTryFireEndIfAllFinished<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:303"]
  S8 -->|calls| T8
  S9["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T9["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  S9 -->|calls| T9
  S10["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T10["method:UIButton::_jobsReceiveTickValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:242"]
  S10 -->|calls| T10
  S11["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T11["method:UIButton::_jobsTryFireEndIfAllFinished<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:303"]
  S11 -->|calls| T11
  S12["method:UIButton::_jobsStartAnimIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:144"]
  T12["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  S12 -->|calls| T12
  S13["method:UIButton::_jobsReceiveTickValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:242"]
  T13["method:UIButton::_jobsFireTickOncePerFrame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:276"]
  S13 -->|calls| T13
  S14["method:JobsButtonNumberAnimConfig::Title::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:400"]
  T14["method:UIButton::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:725"]
  S14 -->|calls| T14
  S15["method:JobsButtonNumberAnimConfig::Title::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:407"]
  T15["method:UIBarButtonItemAppearance::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItemAppearance.swift:18"]
  S15 -->|calls| T15
  S16["method:JobsButtonNumberAnimConfig::SubTitle::bySubTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:482"]
  T16["method:UIButton::bySubTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:225"]
  S16 -->|calls| T16
  S17["method:JobsButtonNumberAnimConfig::SubTitle::bySubTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:489"]
  T17["method:UIButton::bySubTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:233"]
  S17 -->|calls| T17
  S18["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  T18["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S18 -->|calls| T18
  S19["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  T19["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:645"]
  S19 -->|calls| T19
  S20["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  T20["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  S20 -->|calls| T20
  S21["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  T21["method:JobsTimer::onTick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:237"]
  S21 -->|calls| T21
  S22["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  T22["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  S22 -->|calls| T22
  S23["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  T23["method:JobsTimer::onTick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:237"]
  S23 -->|calls| T23
  S24["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  T24["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S24 -->|calls| T24
  S25["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  T25["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

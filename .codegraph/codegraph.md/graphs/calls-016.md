# `calls 符号关系 - 016`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T1["method:UIButton::_sd_setOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:74"]
  S1 -->|calls| T1
  S2["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T2["method:UIButton::_sd_setContext<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:80"]
  S2 -->|calls| T2
  S3["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T3["method:UIButton::_sd_setProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:85"]
  S3 -->|calls| T3
  S4["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T4["method:UIButton::_sd_setCompleted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:91"]
  S4 -->|calls| T4
  S5["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T5["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  S5 -->|calls| T5
  S6["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T6["method:UIButton::_sd_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:56"]
  S6 -->|calls| T6
  S7["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T7["method:UIButton::_sd_setPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:62"]
  S7 -->|calls| T7
  S8["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T8["method:UIButton::_sd_setOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:74"]
  S8 -->|calls| T8
  S9["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T9["method:UIButton::_sd_setContext<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:80"]
  S9 -->|calls| T9
  S10["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T10["method:UIButton::_sd_setProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:85"]
  S10 -->|calls| T10
  S11["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T11["method:UIButton::_sd_setCompleted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:91"]
  S11 -->|calls| T11
  S12["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T12["method:UIButton::_sd_setTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:97"]
  S12 -->|calls| T12
  S13["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T13["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  S13 -->|calls| T13
  S14["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:32"]
  T14["method:UIButton::applyDefaultTimerUI<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:72"]
  S14 -->|calls| T14
  S15["method:UIButton::onCountdownTick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:110"]
  T15["method:UIButton::onTimerTick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:86"]
  S15 -->|calls| T15
  S16["method:UIButton::onCountdownFinish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:120"]
  T16["method:UIButton::onTimerFinish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:99"]
  S16 -->|calls| T16
  S17["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  T17["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  S17 -->|calls| T17
  S18["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  T18["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S18 -->|calls| T18
  S19["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  T19["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  S19 -->|calls| T19
  S20["method:UIButton::pauseTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:235"]
  T20["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  S20 -->|calls| T20
  S21["method:UIButton::resumeTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:242"]
  T21["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S21 -->|calls| T21
  S22["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:249"]
  T22["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S22 -->|calls| T22
  S23["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:249"]
  T23["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  S23 -->|calls| T23
  S24["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  T24["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S24 -->|calls| T24
  S25["method:UIButton::startJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:335"]
  T25["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

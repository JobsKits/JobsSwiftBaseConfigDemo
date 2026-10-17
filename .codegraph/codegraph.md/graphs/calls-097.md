# `calls 符号关系 - 097`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:416"]
  T1["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:352"]
  S1 -->|calls| T1
  S2["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:482"]
  T2["method:UIButton::_sd_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:56"]
  S2 -->|calls| T2
  S3["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:482"]
  T3["method:UIButton::_sd_setPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:62"]
  S3 -->|calls| T3
  S4["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:482"]
  T4["method:UIButton::_sd_setOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:74"]
  S4 -->|calls| T4
  S5["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:482"]
  T5["method:UIButton::_sd_setContext<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:80"]
  S5 -->|calls| T5
  S6["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:482"]
  T6["method:UIButton::_sd_setProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:85"]
  S6 -->|calls| T6
  S7["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:482"]
  T7["method:UIButton::_sd_setCompleted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:91"]
  S7 -->|calls| T7
  S8["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:482"]
  T8["method:UIButton::_sd_setTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:97"]
  S8 -->|calls| T8
  S9["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:482"]
  T9["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  S9 -->|calls| T9
  S10["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:27"]
  T10["property:UIButton::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:43"]
  S10 -->|calls| T10
  S11["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:27"]
  T11["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S11 -->|calls| T11
  S12["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:27"]
  T12["property:UIButton::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:109"]
  S12 -->|calls| T12
  S13["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:64"]
  T13["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:47"]
  S13 -->|calls| T13
  S14["method:UIButton::cfgTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:73"]
  T14["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:64"]
  S14 -->|calls| T14
  S15["method:UIButton::cfgTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:76"]
  T15["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:64"]
  S15 -->|calls| T15
  S16["method:UIButton::cfgBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:79"]
  T16["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:64"]
  S16 -->|calls| T16
  S17["method:UIButton::cfgCorner<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:82"]
  T17["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:64"]
  S17 -->|calls| T17
  S18["method:UIButton::cfgInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:85"]
  T18["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:64"]
  S18 -->|calls| T18
  S19["method:UIButton::cfgFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:88"]
  T19["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:64"]
  S19 -->|calls| T19
  S20["property:UIButton::timerState<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:44"]
  T20["method:UIButton::applyDefaultTimerUI<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:70"]
  S20 -->|calls| T20
  S21["method:UIButton::onCountdownTick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:111"]
  T21["method:UIButton::onTimerTick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:87"]
  S21 -->|calls| T21
  S22["method:UIButton::onCountdownFinish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:121"]
  T22["method:UIButton::onTimerFinish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:100"]
  S22 -->|calls| T22
  S23["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:127"]
  T23["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:303"]
  S23 -->|calls| T23
  S24["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:127"]
  T24["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S24 -->|calls| T24
  S25["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:127"]
  T25["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:303"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

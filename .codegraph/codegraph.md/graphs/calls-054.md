# `calls 符号关系 - 054`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::_applySubtitleToConfigurationNow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:134"]
  T1["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S1 -->|calls| T1
  S2["method:UIButton::isRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:30"]
  T2["method:UIButton::targetLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:22"]
  S2 -->|calls| T2
  S3["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:37"]
  T3["method:UIButton::targetLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:22"]
  S3 -->|calls| T3
  S4["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:37"]
  T4["method:CAAnimation::byRemovedOnCompletion<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:25"]
  S4 -->|calls| T4
  S5["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:37"]
  T5["method:CAPropertyAnimation::byCumulative<br/>JobsByPods/JobsByQuartzCore@Pods/CAPropertyAnimation.swift:25"]
  S5 -->|calls| T5
  S6["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:37"]
  T6["method:CAMediaTiming::byRepeatCount<br/>JobsByPods/JobsByQuartzCore@Pods/CAMediaTiming.swift:37"]
  S6 -->|calls| T6
  S7["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:37"]
  T7["method:JobsButtonNumberAnimConfig::Title::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:375"]
  S7 -->|calls| T7
  S8["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:37"]
  T8["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:19"]
  S8 -->|calls| T8
  S9["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:37"]
  T9["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:13"]
  S9 -->|calls| T9
  S10["method:UIButton::startRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:69"]
  T10["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:37"]
  S10 -->|calls| T10
  S11["method:UIButton::stopRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:84"]
  T11["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:37"]
  S11 -->|calls| T11
  S12["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:29"]
  T12["method:UIButton::jobs_invokeTapBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:77"]
  S12 -->|calls| T12
  S13["method:_JobsButtonLongPressSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:40"]
  T13["method:UIButton::jobs_invokeLongPressBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:83"]
  S13 -->|calls| T13
  S14["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  T14["method:UIButton::jobs_invokeTapBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:77"]
  S14 -->|calls| T14
  S15["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  T15["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S15 -->|calls| T15
  S16["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  T16["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:29"]
  S16 -->|calls| T16
  S17["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:120"]
  T17["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S17 -->|calls| T17
  S18["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:120"]
  T18["method:_JobsButtonLongPressSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:40"]
  S18 -->|calls| T18
  S19["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:152"]
  T19["method:UIButton::_jobsHandleAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:176"]
  S19 -->|calls| T19
  S20["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:152"]
  T20["method:UIButton::_jobsHandleAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:176"]
  S20 -->|calls| T20
  S21["method:UIButton::jobs_addTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:165"]
  T21["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:152"]
  S21 -->|calls| T21
  S22["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  T22["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:152"]
  S22 -->|calls| T22
  S23["method:UIButton::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:190"]
  T23["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S23 -->|calls| T23
  S24["method:UIButton::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:190"]
  T24["method:UIButton::jobs_addTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:165"]
  S24 -->|calls| T24
  S25["method:UIButton::onTapAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:203"]
  T25["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 050`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T1["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  S1 -->|calls| T1
  S2["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T2["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  S2 -->|calls| T2
  S3["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T3["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  S3 -->|calls| T3
  S4["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T4["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  S4 -->|calls| T4
  S5["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T5["method:JobsButtonNumberAnimRunner::buildAttributedIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:764"]
  S5 -->|calls| T5
  S6["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T6["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:775"]
  S6 -->|calls| T6
  S7["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T7["method:JobsButtonNumberAnimRunner::titleBaseFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:673"]
  S7 -->|calls| T7
  S8["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T8["method:JobsButtonNumberAnimRunner::titleBaseColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:677"]
  S8 -->|calls| T8
  S9["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T9["method:JobsButtonNumberAnimRunner::subTitleBaseFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:681"]
  S9 -->|calls| T9
  S10["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T10["method:JobsButtonNumberAnimRunner::subTitleBaseColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:685"]
  S10 -->|calls| T10
  S11["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T11["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:775"]
  S11 -->|calls| T11
  S12["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:775"]
  T12["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:719"]
  S12 -->|calls| T12
  S13["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:775"]
  T13["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:719"]
  S13 -->|calls| T13
  S14["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:775"]
  T14["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:719"]
  S14 -->|calls| T14
  S15["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:775"]
  T15["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:719"]
  S15 -->|calls| T15
  S16["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:775"]
  T16["method:UIButton::byAttributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:241"]
  S16 -->|calls| T16
  S17["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:775"]
  T17["method:UIButton::byAttributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:241"]
  S17 -->|calls| T17
  S18["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:775"]
  T18["method:UIButton::byAttributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:241"]
  S18 -->|calls| T18
  S19["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:775"]
  T19["method:UIButton::byAttributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:241"]
  S19 -->|calls| T19
  S20["method:JobsButtonNumberAnimRunner::findSubTitleLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:808"]
  T20["method:Bag::value<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:70"]
  S20 -->|calls| T20
  S21["method:JobsButtonNumberAnimRunner::findSubTitleLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:808"]
  T21["method:Bag::value<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:70"]
  S21 -->|calls| T21
  S22["method:JobsButtonNumberAnimRunner::findSubTitleLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:808"]
  T22["method:Bag::value<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:70"]
  S22 -->|calls| T22
  S23["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:824"]
  T23["method:JobsNumberFormatter::roundToDecimals<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:860"]
  S23 -->|calls| T23
  S24["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:824"]
  T24["method:JobsNumberFormatter::toFixedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:866"]
  S24 -->|calls| T24
  S25["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:824"]
  T25["variable:parts<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:20"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

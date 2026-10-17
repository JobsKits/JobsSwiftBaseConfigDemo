# `calls 符号关系 - 099`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::_jobsReceiveTickValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:242"]
  T1["method:UIButton::_jobsFireTickOncePerFrame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:278"]
  S1 -->|calls| T1
  S2["method:UIButton::_jobsTryFireEndIfAllFinished<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:301"]
  T2["method:JobsOCCentralLab::endWithReason:report:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:40"]
  S2 -->|calls| T2
  S3["method:JobsButtonNumberAnimConfig::Title::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:385"]
  T3["method:UIButton::byTitleFont<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:759"]
  S3 -->|calls| T3
  S4["method:JobsButtonNumberAnimConfig::Title::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:391"]
  T4["method:UIButton::byTitleColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:803"]
  S4 -->|calls| T4
  S5["method:JobsButtonNumberAnimConfig::SubTitle::bySubTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:454"]
  T5["method:UIButton::bySubTitleFont<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+Subtitle.swift:217"]
  S5 -->|calls| T5
  S6["method:JobsButtonNumberAnimConfig::SubTitle::bySubTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:460"]
  T6["method:UIButton::bySubTitleColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+Subtitle.swift:225"]
  S6 -->|calls| T6
  S7["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:538"]
  T7["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:591"]
  S7 -->|calls| T7
  S8["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:538"]
  T8["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:599"]
  S8 -->|calls| T8
  S9["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:538"]
  T9["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  S9 -->|calls| T9
  S10["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:538"]
  T10["field:JobsButtonNumberAnimRunner::onTick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:513"]
  S10 -->|calls| T10
  S11["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:538"]
  T11["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  S11 -->|calls| T11
  S12["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:538"]
  T12["field:JobsButtonNumberAnimRunner::onTick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:513"]
  S12 -->|calls| T12
  S13["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:538"]
  T13["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:591"]
  S13 -->|calls| T13
  S14["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:538"]
  T14["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:575"]
  S14 -->|calls| T14
  S15["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:575"]
  T15["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:591"]
  S15 -->|calls| T15
  S16["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:575"]
  T16["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  S16 -->|calls| T16
  S17["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:575"]
  T17["field:JobsButtonNumberAnimRunner::onTick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:513"]
  S17 -->|calls| T17
  S18["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:575"]
  T18["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:591"]
  S18 -->|calls| T18
  S19["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:591"]
  T19["field:JobsButtonNumberAnimRunner::onFinish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:514"]
  S19 -->|calls| T19
  S20["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:599"]
  T20["function:JobsButtonNumberAnimRunner::resolveValuesIfNeeded::nonEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:600"]
  S20 -->|calls| T20
  S21["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:599"]
  T21["function:JobsButtonNumberAnimRunner::resolveValuesIfNeeded::nonEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:600"]
  S21 -->|calls| T21
  S22["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:599"]
  T22["method:JobsButtonNumberAnimRunner::currentText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:617"]
  S22 -->|calls| T22
  S23["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:599"]
  T23["function:JobsButtonNumberAnimRunner::resolveValuesIfNeeded::nonEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:600"]
  S23 -->|calls| T23
  S24["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:599"]
  T24["function:JobsButtonNumberAnimRunner::resolveValuesIfNeeded::nonEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:600"]
  S24 -->|calls| T24
  S25["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:599"]
  T25["method:JobsButtonNumberAnimRunner::currentText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:617"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

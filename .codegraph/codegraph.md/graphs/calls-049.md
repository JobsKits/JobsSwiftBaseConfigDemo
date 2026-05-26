# `calls 符号关系 - 049`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsButtonNumberAnimRunner::start<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:574"]
  T1["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:616"]
  S1 -->|calls| T1
  S2["method:JobsButtonNumberAnimRunner::stop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:610"]
  T2["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S2 -->|calls| T2
  S3["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:616"]
  T3["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S3 -->|calls| T3
  S4["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:616"]
  T4["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  S4 -->|calls| T4
  S5["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:616"]
  T5["method:JobsTimer::onTick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:237"]
  S5 -->|calls| T5
  S6["method:JobsButtonNumberAnimRunner::tick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:616"]
  T6["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S6 -->|calls| T6
  S7["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  T7["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S7 -->|calls| T7
  S8["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  T8["method:JobsTimer::onFinish<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:243"]
  S8 -->|calls| T8
  S9["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:645"]
  T9["function:JobsButtonNumberAnimRunner::resolveValuesIfNeeded::nonEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:646"]
  S9 -->|calls| T9
  S10["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:645"]
  T10["function:JobsButtonNumberAnimRunner::resolveValuesIfNeeded::nonEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:646"]
  S10 -->|calls| T10
  S11["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:645"]
  T11["method:JobsButtonNumberAnimRunner::currentText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:666"]
  S11 -->|calls| T11
  S12["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:645"]
  T12["function:JobsButtonNumberAnimRunner::resolveValuesIfNeeded::nonEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:646"]
  S12 -->|calls| T12
  S13["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:645"]
  T13["function:JobsButtonNumberAnimRunner::resolveValuesIfNeeded::nonEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:646"]
  S13 -->|calls| T13
  S14["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:645"]
  T14["method:JobsButtonNumberAnimRunner::currentText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:666"]
  S14 -->|calls| T14
  S15["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:645"]
  T15["function:JobsButtonNumberAnimRunner::resolveValuesIfNeeded::nonEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:646"]
  S15 -->|calls| T15
  S16["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:645"]
  T16["method:JobsButtonNumberAnimRunner::parseDouble<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:799"]
  S16 -->|calls| T16
  S17["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:645"]
  T17["method:JobsButtonNumberAnimRunner::parseDouble<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:799"]
  S17 -->|calls| T17
  S18["method:JobsButtonNumberAnimRunner::titleBaseColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:677"]
  T18["method:UIButton::StateProxy::titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1018"]
  S18 -->|calls| T18
  S19["method:JobsButtonNumberAnimRunner::subTitleBaseFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:681"]
  T19["method:JobsButtonNumberAnimRunner::findSubTitleLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:808"]
  S19 -->|calls| T19
  S20["method:JobsButtonNumberAnimRunner::subTitleBaseColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:685"]
  T20["method:JobsButtonNumberAnimRunner::findSubTitleLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:808"]
  S20 -->|calls| T20
  S21["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T21["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:824"]
  S21 -->|calls| T21
  S22["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T22["method:UIButton::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:699"]
  S22 -->|calls| T22
  S23["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T23["method:UIButton::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:699"]
  S23 -->|calls| T23
  S24["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T24["method:UIButton::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:699"]
  S24 -->|calls| T24
  S25["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:692"]
  T25["method:UIButton::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:699"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

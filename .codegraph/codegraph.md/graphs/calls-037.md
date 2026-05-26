# `calls 符号关系 - 037`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:725"]
  T1["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S1 -->|calls| T1
  S2["method:UIButton::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:725"]
  T2["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S2 -->|calls| T2
  S3["method:UIButton::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:725"]
  T3["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S3 -->|calls| T3
  S4["method:UIButton::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:725"]
  T4["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S4 -->|calls| T4
  S5["method:UIButton::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:725"]
  T5["method:UIButton::StateProxy::titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1018"]
  S5 -->|calls| T5
  S6["method:UIButton::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:725"]
  T6["method:UIButton::StateProxy::titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1018"]
  S6 -->|calls| T6
  S7["method:UIButton::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:771"]
  T7["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S7 -->|calls| T7
  S8["method:UIButton::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:771"]
  T8["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  S8 -->|calls| T8
  S9["method:UIButton::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:771"]
  T9["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S9 -->|calls| T9
  S10["method:UIButton::byTitlePadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:805"]
  T10["method:UIButton::byTitlePadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:805"]
  S10 -->|calls| T10
  S11["method:UIButton::byTitlePadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:805"]
  T11["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S11 -->|calls| T11
  S12["method:UIButton::byTitlePadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:805"]
  T12["method:UIButton::_applyLegacyComposite<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+富文本.swift:110"]
  S12 -->|calls| T12
  S13["method:UIButton::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:823"]
  T13["method:UIButton::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:823"]
  S13 -->|calls| T13
  S14["method:UIButton::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:823"]
  T14["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S14 -->|calls| T14
  S15["method:UIButton::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:823"]
  T15["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S15 -->|calls| T15
  S16["method:UIButton::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:823"]
  T16["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  S16 -->|calls| T16
  S17["method:UIButton::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:823"]
  T17["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S17 -->|calls| T17
  S18["method:UIButton::byBackgroundImageContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:847"]
  T18["method:UIBackgroundConfiguration::byImageContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:122"]
  S18 -->|calls| T18
  S19["method:UIButton::ensureConfigUpdateHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:907"]
  T19["method:JobsNetworkingDemoBaseVC::append<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking共用网络接口/JobsNetworkingDemoBaseVC.swift:72"]
  S19 -->|calls| T19
  S20["method:UIButton::ensureConfigUpdateHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:907"]
  T20["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  S20 -->|calls| T20
  S21["function:UIButton::_ensureUnifiedUpdateHandlerInstalled::pickTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:932"]
  T21["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S21 -->|calls| T21
  S22["function:UIButton::_ensureUnifiedUpdateHandlerInstalled::pickTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:932"]
  T22["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S22 -->|calls| T22
  S23["function:UIButton::_ensureUnifiedUpdateHandlerInstalled::pickTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:932"]
  T23["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S23 -->|calls| T23
  S24["function:UIButton::_ensureUnifiedUpdateHandlerInstalled::pickTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:932"]
  T24["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S24 -->|calls| T24
  S25["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  T25["function:UIButton::_ensureUnifiedUpdateHandlerInstalled::pickTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:932"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

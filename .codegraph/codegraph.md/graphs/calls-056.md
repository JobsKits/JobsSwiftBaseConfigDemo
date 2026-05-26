# `calls 符号关系 - 056`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobs_titleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:144"]
  T1["method:UIButton::jobs_dslTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:139"]
  S1 -->|calls| T1
  S2["method:UIButton::jobs_titleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:144"]
  T2["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S2 -->|calls| T2
  S3["method:UIButton::jobs_titleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:144"]
  T3["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S3 -->|calls| T3
  S4["method:UIButton::jobs_subTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:173"]
  T4["method:UIButton::jobs_attributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:92"]
  S4 -->|calls| T4
  S5["method:UIButton::jobs_subTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:189"]
  T5["method:UIButton::jobs_attributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:92"]
  S5 -->|calls| T5
  S6["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:202"]
  T6["method:UIButton::jobs_uiEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:253"]
  S6 -->|calls| T6
  S7["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:202"]
  T7["method:UIButton::jobs_kvcEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:248"]
  S7 -->|calls| T7
  S8["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:202"]
  T8["method:UIButton::jobs_kvcEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:248"]
  S8 -->|calls| T8
  S9["method:UIButton::jobs_kvcEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:248"]
  T9["method:Bag::value<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:70"]
  S9 -->|calls| T9
  S10["method:UIButton::byLockTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:17"]
  T10["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S10 -->|calls| T10
  S11["method:UIButton::byLockTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:17"]
  T11["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S11 -->|calls| T11
  S12["method:UIButton::byLockTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:17"]
  T12["method:UIButton::byTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:35"]
  S12 -->|calls| T12
  S13["method:UIButton::byLockImageRenderingOriginal<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:37"]
  T13["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S13 -->|calls| T13
  S14["method:UIButton::byLockImageRenderingOriginal<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:37"]
  T14["method:UIButton::StateProxy::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1055"]
  S14 -->|calls| T14
  S15["method:UIButton::byLockTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:55"]
  T15["method:UIButton::ensureConfigUpdateHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:109"]
  S15 -->|calls| T15
  S16["method:UIButton::byLockTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:55"]
  T16["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S16 -->|calls| T16
  S17["method:UIButton::byLockBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:71"]
  T17["method:UIButton::ensureConfigUpdateHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:109"]
  S17 -->|calls| T17
  S18["method:UIButton::byLockBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:71"]
  T18["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S18 -->|calls| T18
  S19["method:UIButton::byLockBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:71"]
  T19["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S19 -->|calls| T19
  S20["method:UIButton::byLockBorderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:91"]
  T20["method:UIButton::ensureConfigUpdateHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:109"]
  S20 -->|calls| T20
  S21["method:UIButton::byLockBorderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:91"]
  T21["method:UIButton.Configuration::byBackgroundPatch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:106"]
  S21 -->|calls| T21
  S22["method:UIButton::byLockBorderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:91"]
  T22["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S22 -->|calls| T22
  S23["method:UIButton::ensureConfigUpdateHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:109"]
  T23["method:Date::adding<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterExtension.swift:32"]
  S23 -->|calls| T23
  S24["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  T24["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  S24 -->|calls| T24
  S25["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  T25["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 055`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::onLongPressAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:246"]
  T1["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:120"]
  S1 -->|calls| T1
  S2["method:UIButton::setBgCor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+背景色兜底.swift:17"]
  T2["method:FeedListCell::fill<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/View/FeedListCell.swift:89"]
  S2 -->|calls| T2
  S3["method:UIButton::setBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+背景色兜底.swift:25"]
  T3["method:FeedListCell::fill<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/View/FeedListCell.swift:89"]
  S3 -->|calls| T3
  S4["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:15"]
  T4["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  S4 -->|calls| T4
  S5["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  T5["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S5 -->|calls| T5
  S6["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  T6["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S6 -->|calls| T6
  S7["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  T7["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S7 -->|calls| T7
  S8["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  T8["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S8 -->|calls| T8
  S9["method:UIButton::jobs_attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:58"]
  T9["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S9 -->|calls| T9
  S10["method:UIButton::jobs_attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:58"]
  T10["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S10 -->|calls| T10
  S11["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:15"]
  T11["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:72"]
  S11 -->|calls| T11
  S12["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:72"]
  T12["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S12 -->|calls| T12
  S13["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:72"]
  T13["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S13 -->|calls| T13
  S14["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:72"]
  T14["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S14 -->|calls| T14
  S15["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:72"]
  T15["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S15 -->|calls| T15
  S16["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:15"]
  T16["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:103"]
  S16 -->|calls| T16
  S17["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:103"]
  T17["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S17 -->|calls| T17
  S18["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:103"]
  T18["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S18 -->|calls| T18
  S19["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:15"]
  T19["method:UIButton::jobs_backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:115"]
  S19 -->|calls| T19
  S20["method:UIButton::jobs_backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:115"]
  T20["method:UIButton::StateProxy::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1055"]
  S20 -->|calls| T20
  S21["method:UIButton::jobs_backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:115"]
  T21["method:UIButton::StateProxy::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1055"]
  S21 -->|calls| T21
  S22["method:UIButton::jobs_titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:127"]
  T22["method:UIButton::jobs_attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:58"]
  S22 -->|calls| T22
  S23["method:UIButton::jobs_titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:127"]
  T23["method:UIButton::StateProxy::titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1018"]
  S23 -->|calls| T23
  S24["method:UIButton::jobs_titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:127"]
  T24["method:UIButton::StateProxy::titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1018"]
  S24 -->|calls| T24
  S25["method:UIButton::jobs_titleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:144"]
  T25["method:UIButton::jobs_dslTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:139"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

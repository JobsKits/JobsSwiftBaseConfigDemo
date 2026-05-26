# `calls 符号关系 - 143`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsMarqueeView::createTimer<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:383"]
  T1["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S1 -->|calls| T1
  S2["method:JobsMarqueeView::createTimer<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:383"]
  T2["method:JobsMarqueeView::tickContinuous<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:500"]
  S2 -->|calls| T2
  S3["method:JobsMarqueeView::tickFrequency<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:420"]
  T3["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  S3 -->|calls| T3
  S4["method:JobsMarqueeView::tickContinuous<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:500"]
  T4["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  S4 -->|calls| T4
  S5["method:JobsMarqueeView::buildButtons<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:546"]
  T5["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  S5 -->|calls| T5
  S6["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T6["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:29"]
  S6 -->|calls| T6
  S7["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T7["method:UIButton::byImageEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:105"]
  S7 -->|calls| T7
  S8["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T8["method:UIButton::byTitleEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:116"]
  S8 -->|calls| T8
  S9["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T9["method:UIButton::byContentEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:87"]
  S9 -->|calls| T9
  S10["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T10["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S10 -->|calls| T10
  S11["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T11["method:UIButton::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:699"]
  S11 -->|calls| T11
  S12["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T12["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S12 -->|calls| T12
  S13["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T13["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:719"]
  S13 -->|calls| T13
  S14["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T14["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S14 -->|calls| T14
  S15["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T15["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:719"]
  S15 -->|calls| T15
  S16["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T16["method:UIButton::StateProxy::titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1018"]
  S16 -->|calls| T16
  S17["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T17["method:UIBarButtonItemAppearance::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItemAppearance.swift:18"]
  S17 -->|calls| T17
  S18["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T18["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S18 -->|calls| T18
  S19["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T19["method:UIButton::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:823"]
  S19 -->|calls| T19
  S20["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T20["method:UIButton::StateProxy::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1055"]
  S20 -->|calls| T20
  S21["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T21["method:UIButton::byBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:30"]
  S21 -->|calls| T21
  S22["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T22["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  S22 -->|calls| T22
  S23["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T23["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  S23 -->|calls| T23
  S24["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T24["method:UIButton::jobs_titleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:144"]
  S24 -->|calls| T24
  S25["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T25["method:UIButton::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:725"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

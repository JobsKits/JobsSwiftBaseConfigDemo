# `calls 符号关系 - 052`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:130"]
  T1["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S1 -->|calls| T1
  S2["method:UIButton::_jobs_unbindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:154"]
  T2["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S2 -->|calls| T2
  S3["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:32"]
  T3["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S3 -->|calls| T3
  S4["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:32"]
  T4["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S4 -->|calls| T4
  S5["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:32"]
  T5["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S5 -->|calls| T5
  S6["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:32"]
  T6["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S6 -->|calls| T6
  S7["class:UIButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:32"]
  T7["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S7 -->|calls| T7
  S8["method:UIButton::jobs_setSubtitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:64"]
  T8["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S8 -->|calls| T8
  S9["method:UIButton::jobs_setSubtitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:64"]
  T9["method:UILabel::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:46"]
  S9 -->|calls| T9
  S10["method:UIButton::byGradientMainTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:74"]
  T10["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:206"]
  S10 -->|calls| T10
  S11["method:UIButton::byGradientSubtitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:107"]
  T11["method:UIButton::_jobs_applySubGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:222"]
  S11 -->|calls| T11
  S12["method:UIButton::byGradientTitlesSame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:133"]
  T12["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:206"]
  S12 -->|calls| T12
  S13["method:UIButton::byGradientTitlesSame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:133"]
  T13["method:UIButton::_jobs_applySubGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:222"]
  S13 -->|calls| T13
  S14["method:UIButton::jobs_updateGradientTitlesLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:182"]
  T14["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:206"]
  S14 -->|calls| T14
  S15["method:UIButton::jobs_updateGradientTitlesLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:182"]
  T15["method:UIButton::_jobs_applySubGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:222"]
  S15 -->|calls| T15
  S16["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:206"]
  T16["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S16 -->|calls| T16
  S17["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:206"]
  T17["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S17 -->|calls| T17
  S18["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:206"]
  T18["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:236"]
  S18 -->|calls| T18
  S19["method:UIButton::_jobs_applySubGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:222"]
  T19["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:236"]
  S19 -->|calls| T19
  S20["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:236"]
  T20["method:CALayer::byMask<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:126"]
  S20 -->|calls| T20
  S21["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:236"]
  T21["method:JXSegmentedIndicatorGradientLineView::byEndPoint<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorGradientLineView.swift:32"]
  S21 -->|calls| T21
  S22["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:236"]
  T22["method:JXSegmentedIndicatorGradientLineView::byStartPoint<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorGradientLineView.swift:26"]
  S22 -->|calls| T22
  S23["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:236"]
  T23["method:JXSegmentedIndicatorGradientLineView::byColors<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorGradientLineView.swift:20"]
  S23 -->|calls| T23
  S24["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:236"]
  T24["method:UIView::byFrame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:113"]
  S24 -->|calls| T24
  S25["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:236"]
  T25["method:UIView::byFrame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:113"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

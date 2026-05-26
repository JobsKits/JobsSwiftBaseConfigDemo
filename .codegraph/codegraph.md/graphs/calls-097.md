# `calls 符号关系 - 097`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T1["method:UIView::byAddSublayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:445"]
  S1 -->|calls| T1
  S2["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T2["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:83"]
  S2 -->|calls| T2
  S3["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T3["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S3 -->|calls| T3
  S4["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T4["method:AttributeContainer::byStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:90"]
  S4 -->|calls| T4
  S5["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T5["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:314"]
  S5 -->|calls| T5
  S6["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T6["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsByQuartzCore@Pods/CAKeyframeAnimation.swift:20"]
  S6 -->|calls| T6
  S7["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T7["method:CALayer::byFrame<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:23"]
  S7 -->|calls| T7
  S8["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T8["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S8 -->|calls| T8
  S9["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T9["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:59"]
  S9 -->|calls| T9
  S10["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T10["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:53"]
  S10 -->|calls| T10
  S11["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T11["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S11 -->|calls| T11
  S12["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T12["method:UIView::jobs_removeFuseLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:231"]
  S12 -->|calls| T12
  S13["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T13["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:19"]
  S13 -->|calls| T13
  S14["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T14["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:13"]
  S14 -->|calls| T14
  S15["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T15["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:19"]
  S15 -->|calls| T15
  S16["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T16["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:13"]
  S16 -->|calls| T16
  S17["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T17["method:CAAnimation::byRemovedOnCompletion<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:25"]
  S17 -->|calls| T17
  S18["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T18["method:CAMediaTiming::byFillMode<br/>JobsByPods/JobsByQuartzCore@Pods/CAMediaTiming.swift:55"]
  S18 -->|calls| T18
  S19["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T19["method:CAAnimation::byTimingFunction<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:13"]
  S19 -->|calls| T19
  S20["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T20["method:JobsButtonNumberAnimConfig::Title::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:375"]
  S20 -->|calls| T20
  S21["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:208"]
  T21["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S21 -->|calls| T21
  S22["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:208"]
  T22["method:UIView::jobs_removeFuseLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:231"]
  S22 -->|calls| T22
  S23["method:UIView::jobs_layoutFuseIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:220"]
  T23["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsByQuartzCore@Pods/CAKeyframeAnimation.swift:20"]
  S23 -->|calls| T23
  S24["method:UIView::jobs_layoutFuseIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:220"]
  T24["method:CALayer::byFrame<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:23"]
  S24 -->|calls| T24
  S25["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  T25["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:208"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

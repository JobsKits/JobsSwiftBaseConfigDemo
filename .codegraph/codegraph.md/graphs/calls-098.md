# `calls 符号关系 - 098`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  T1["method:UIView::byAddSublayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:445"]
  S1 -->|calls| T1
  S2["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  T2["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:83"]
  S2 -->|calls| T2
  S3["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  T3["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S3 -->|calls| T3
  S4["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  T4["method:AttributeContainer::byStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:90"]
  S4 -->|calls| T4
  S5["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  T5["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:314"]
  S5 -->|calls| T5
  S6["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  T6["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsByQuartzCore@Pods/CAKeyframeAnimation.swift:20"]
  S6 -->|calls| T6
  S7["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  T7["method:CALayer::byFrame<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:23"]
  S7 -->|calls| T7
  S8["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  T8["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S8 -->|calls| T8
  S9["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  T9["method:UIView::jobs_prepareFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:240"]
  S9 -->|calls| T9
  S10["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  T10["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  S10 -->|calls| T10
  S11["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  T11["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  S11 -->|calls| T11
  S12["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  T12["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S12 -->|calls| T12
  S13["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  T13["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:59"]
  S13 -->|calls| T13
  S14["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  T14["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:53"]
  S14 -->|calls| T14
  S15["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  T15["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:59"]
  S15 -->|calls| T15
  S16["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  T16["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:53"]
  S16 -->|calls| T16
  S17["method:UIView.SuspendConfig::dsl<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:66"]
  T17["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S17 -->|calls| T17
  S18["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T18["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:33"]
  S18 -->|calls| T18
  S19["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T19["method:UIView::_fallbackWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:410"]
  S19 -->|calls| T19
  S20["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T20["method:UIView::_availableBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:404"]
  S20 -->|calls| T20
  S21["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T21["method:UIView::_origin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:311"]
  S21 -->|calls| T21
  S22["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T22["method:UIView::_origin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:311"]
  S22 -->|calls| T22
  S23["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T23["method:UIView::_clampFrameWithinContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:395"]
  S23 -->|calls| T23
  S24["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T24["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S24 -->|calls| T24
  S25["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T25["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:45"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

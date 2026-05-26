# `calls 符号关系 - 156`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  T1["method:CAAnimation::byRemovedOnCompletion<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:25"]
  S1 -->|calls| T1
  S2["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  T2["method:CAMediaTiming::byRepeatCount<br/>JobsByPods/JobsByQuartzCore@Pods/CAMediaTiming.swift:37"]
  S2 -->|calls| T2
  S3["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  T3["method:EKAttributes::byDuration<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:22"]
  S3 -->|calls| T3
  S4["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  T4["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:19"]
  S4 -->|calls| T4
  S5["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  T5["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:13"]
  S5 -->|calls| T5
  S6["method:JobsProgressBar::stopThumbRotation<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:699"]
  T6["method:JobsProgressBar::currentRotationZ<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:659"]
  S6 -->|calls| T6
  S7["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  T7["method:JobsProgressBar::stopThumbRotation<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:699"]
  S7 -->|calls| T7
  S8["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  T8["method:JobsProgressBar::currentRotationZ<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:659"]
  S8 -->|calls| T8
  S9["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  T9["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S9 -->|calls| T9
  S10["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  T10["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S10 -->|calls| T10
  S11["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  T11["method:CAMediaTiming::byFillMode<br/>JobsByPods/JobsByQuartzCore@Pods/CAMediaTiming.swift:55"]
  S11 -->|calls| T11
  S12["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  T12["method:CAAnimation::byRemovedOnCompletion<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:25"]
  S12 -->|calls| T12
  S13["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  T13["method:CAAnimation::byTimingFunction<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:13"]
  S13 -->|calls| T13
  S14["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  T14["method:EKAttributes::byDuration<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:22"]
  S14 -->|calls| T14
  S15["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  T15["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:19"]
  S15 -->|calls| T15
  S16["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  T16["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:13"]
  S16 -->|calls| T16
  S17["method:JobsProgressBar::layoutThumb<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:742"]
  T17["method:JobsProgressBar::applyThumbStyleIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:801"]
  S17 -->|calls| T17
  S18["method:JobsProgressBar::byProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:868"]
  T18["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  S18 -->|calls| T18
  S19["method:JobsProgressBar::byDisplayPercent<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:936"]
  T19["method:JobsProgressBar::setDisplayPercent<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:494"]
  S19 -->|calls| T19
  S20["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1028"]
  T20["method:UIView::byAddTo<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:30"]
  S20 -->|calls| T20
  S21["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1028"]
  T21["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S21 -->|calls| T21
  S22["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1028"]
  T22["method:UIView::byMasksToBounds<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:24"]
  S22 -->|calls| T22
  S23["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1028"]
  T23["method:UIView::byCornerRadius<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:39"]
  S23 -->|calls| T23
  S24["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1028"]
  T24["method:UIView::byBackgroundColor<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:18"]
  S24 -->|calls| T24
  S25["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1028"]
  T25["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:104"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

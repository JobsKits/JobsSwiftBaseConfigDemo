# `calls 符号关系 - 096`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::ensureRTBadgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:226"]
  T1["method:UIView::rt_badgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:234"]
  S1 -->|calls| T1
  S2["method:UIView::ensureRTBadgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:226"]
  T2["method:UIView::setRTBadgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:238"]
  S2 -->|calls| T2
  S3["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T3["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S3 -->|calls| T3
  S4["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T4["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S4 -->|calls| T4
  S5["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T5["method:_InsetLabel::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:336"]
  S5 -->|calls| T5
  S6["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T6["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S6 -->|calls| T6
  S7["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T7["method:RTBadgeConfig::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:68"]
  S7 -->|calls| T7
  S8["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T8["method:RTBadgeConfig::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:63"]
  S8 -->|calls| T8
  S9["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T9["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S9 -->|calls| T9
  S10["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T10["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S10 -->|calls| T10
  S11["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T11["method:_InsetLabel::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:336"]
  S11 -->|calls| T11
  S12["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T12["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S12 -->|calls| T12
  S13["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T13["method:RTBadgeConfig::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:68"]
  S13 -->|calls| T13
  S14["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T14["method:RTBadgeConfig::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:63"]
  S14 -->|calls| T14
  S15["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T15["method:UILabel::byAttributedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:85"]
  S15 -->|calls| T15
  S16["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  T16["method:PHPickerViewController::byAddTo<br/>JobsByPods/JobsByPhotosUI@Pods/PHPickerViewController.swift:78"]
  S16 -->|calls| T16
  S17["method:UIView::installRTBadgeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:286"]
  T17["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S17 -->|calls| T17
  S18["method:UIView::installRTBadgeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:286"]
  T18["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S18 -->|calls| T18
  S19["class:_InsetLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:300"]
  T19["method:UIView::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:606"]
  S19 -->|calls| T19
  S20["method:_InsetLabel::drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:312"]
  T20["method:_InsetLabel::drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:312"]
  S20 -->|calls| T20
  S21["method:_InsetLabel::textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:322"]
  T21["method:_InsetLabel::textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:322"]
  S21 -->|calls| T21
  S22["method:UIView::byFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:109"]
  T22["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  S22 -->|calls| T22
  S23["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T23["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:208"]
  S23 -->|calls| T23
  S24["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T24["enum_member:JobsTaskLifecycle::finished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:322"]
  S24 -->|calls| T24
  S25["method:UIView::jobs_startFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:124"]
  T25["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:208"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

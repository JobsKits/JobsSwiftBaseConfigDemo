# `calls 符号关系 - 094`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::bySpinStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:29"]
  T1["method:CAMediaTiming::byFillMode<br/>JobsByPods/JobsByQuartzCore@Pods/CAMediaTiming.swift:55"]
  S1 -->|calls| T1
  S2["method:UIView::bySpinStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:29"]
  T2["method:CAAnimation::byRemovedOnCompletion<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:25"]
  S2 -->|calls| T2
  S3["method:UIView::bySpinStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:29"]
  T3["method:JobsButtonNumberAnimConfig::Title::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:375"]
  S3 -->|calls| T3
  S4["method:UIView::bySpinStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:29"]
  T4["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:19"]
  S4 -->|calls| T4
  S5["method:UIView::bySpinStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:29"]
  T5["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:13"]
  S5 -->|calls| T5
  S6["method:UIView::bySpinResume<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:79"]
  T6["method:UIView::bySpinStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:29"]
  S6 -->|calls| T6
  S7["method:UIView::shake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:148"]
  T7["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S7 -->|calls| T7
  S8["method:UIView::shake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:148"]
  T8["method:CAKeyframeAnimation::byValues<br/>JobsByPods/JobsByQuartzCore@Pods/CAKeyframeAnimation.swift:14"]
  S8 -->|calls| T8
  S9["method:UIView::shake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:148"]
  T9["method:JobsButtonNumberAnimConfig::Title::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:375"]
  S9 -->|calls| T9
  S10["method:UIView::shake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:148"]
  T10["method:CAAnimation::byTimingFunction<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:13"]
  S10 -->|calls| T10
  S11["method:UIView::doShineAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:160"]
  T11["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S11 -->|calls| T11
  S12["method:UIView::doShineAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:160"]
  T12["method:CAAnimation::byRemovedOnCompletion<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:25"]
  S12 -->|calls| T12
  S13["method:UIView::doShineAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:160"]
  T13["method:CAMediaTiming::byFillMode<br/>JobsByPods/JobsByQuartzCore@Pods/CAMediaTiming.swift:55"]
  S13 -->|calls| T13
  S14["method:UIView::doShineAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:160"]
  T14["method:CAMediaTiming::byRepeatCount<br/>JobsByPods/JobsByQuartzCore@Pods/CAMediaTiming.swift:37"]
  S14 -->|calls| T14
  S15["method:UIView::doShineAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:160"]
  T15["method:JobsButtonNumberAnimConfig::Title::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:375"]
  S15 -->|calls| T15
  S16["method:UIView::doShineAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:160"]
  T16["method:CAMediaTiming::byAutoreverses<br/>JobsByPods/JobsByQuartzCore@Pods/CAMediaTiming.swift:49"]
  S16 -->|calls| T16
  S17["method:UIView::doShineAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:160"]
  T17["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:19"]
  S17 -->|calls| T17
  S18["method:UIView::doShineAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:160"]
  T18["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsByQuartzCore@Pods/CABasicAnimation.swift:13"]
  S18 -->|calls| T18
  S19["method:RTBadgeConfig::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:113"]
  T19["method:RTBadgeConfig::byShadowOffset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:108"]
  S19 -->|calls| T19
  S20["method:RTBadgeConfig::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:113"]
  T20["method:RTBadgeConfig::byShadowOpacity<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:103"]
  S20 -->|calls| T20
  S21["method:RTBadgeConfig::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:113"]
  T21["method:RTBadgeConfig::byShadowRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:98"]
  S21 -->|calls| T21
  S22["method:RTBadgeConfig::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:113"]
  T22["method:RTBadgeConfig::byShadowColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:93"]
  S22 -->|calls| T22
  S23["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T23["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S23 -->|calls| T23
  S24["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T24["method:UIView::ensureRTBadgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:226"]
  S24 -->|calls| T24
  S25["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T25["method:UIView::byBorderWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:86"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

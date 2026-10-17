# `calls 符号关系 - 102`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["property:UIButton::jobs_subtitleLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:36"]
  T1["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S1 -->|calls| T1
  S2["property:UIButton::jobs_subtitleLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:36"]
  T2["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S2 -->|calls| T2
  S3["method:UIButton::jobs_setSubtitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:63"]
  T3["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S3 -->|calls| T3
  S4["method:UIButton::jobs_setSubtitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:63"]
  T4["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S4 -->|calls| T4
  S5["method:UIButton::byGradientMainTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:74"]
  T5["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:202"]
  S5 -->|calls| T5
  S6["method:UIButton::byGradientSubtitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:107"]
  T6["method:UIButton::_jobs_applySubGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:218"]
  S6 -->|calls| T6
  S7["method:UIButton::byGradientTitlesSame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:133"]
  T7["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:202"]
  S7 -->|calls| T7
  S8["method:UIButton::byGradientTitlesSame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:133"]
  T8["method:UIButton::_jobs_applySubGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:218"]
  S8 -->|calls| T8
  S9["method:UIButton::jobs_updateGradientTitlesLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:181"]
  T9["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:202"]
  S9 -->|calls| T9
  S10["method:UIButton::jobs_updateGradientTitlesLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:181"]
  T10["method:UIButton::_jobs_applySubGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:218"]
  S10 -->|calls| T10
  S11["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:202"]
  T11["property:UIButton::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:43"]
  S11 -->|calls| T11
  S12["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:202"]
  T12["property:UIButton::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:43"]
  S12 -->|calls| T12
  S13["method:UIButton::_jobs_applyMainGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:202"]
  T13["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:232"]
  S13 -->|calls| T13
  S14["method:UIButton::_jobs_applySubGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:218"]
  T14["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:232"]
  S14 -->|calls| T14
  S15["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:232"]
  T15["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S15 -->|calls| T15
  S16["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:232"]
  T16["method:CATextLayer::byString<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATextLayer.swift:18"]
  S16 -->|calls| T16
  S17["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:232"]
  T17["method:CALayer::byAddSublayer<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:89"]
  S17 -->|calls| T17
  S18["method:UIButton::_jobs_applyGradient<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:232"]
  T18["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S18 -->|calls| T18
  S19["method:UIButton::isRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:33"]
  T19["method:UIButton::targetLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:22"]
  S19 -->|calls| T19
  S20["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:39"]
  T20["method:UIButton::targetLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:22"]
  S20 -->|calls| T20
  S21["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:39"]
  T21["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:12"]
  S21 -->|calls| T21
  S22["method:UIButton::startRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:74"]
  T22["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:39"]
  S22 -->|calls| T22
  S23["method:UIButton::stopRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:89"]
  T23["method:UIButton::setRotating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+旋转动画.swift:39"]
  S23 -->|calls| T23
  S24["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:28"]
  T24["method:UIButton::jobs_invokeTapBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:76"]
  S24 -->|calls| T24
  S25["method:_JobsButtonLongPressSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:39"]
  T25["method:UIButton::jobs_invokeLongPressBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:82"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

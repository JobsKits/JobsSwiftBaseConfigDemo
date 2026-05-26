# `calls 符号关系 - 028`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIColor::getRGBDelta<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:286"]
  T1["method:UIColor::getRGB<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:265"]
  S1 -->|calls| T1
  S2["method:UIColor::colorWith<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:295"]
  T2["enum_member:TextFormatStrategy::uppercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:18"]
  S2 -->|calls| T2
  S3["class:UIColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:308"]
  T3["method:UIColor::randomColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:310"]
  S3 -->|calls| T3
  S4["method:UIColor::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:365"]
  T4["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S4 -->|calls| T4
  S5["method:UIDatePicker::byDateByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIDatePicker.swift:42"]
  T5["method:JobsRefreshCache::setDate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:426"]
  S5 -->|calls| T5
  S6["method:UIDatePicker::byDateBy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIDatePicker.swift:49"]
  T6["method:JobsRefreshCache::setDate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:426"]
  S6 -->|calls| T6
  S7["method:AttributeContainer::byUIKit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:195"]
  T7["enum_member:HTTPMethod::patch<br/>JobsByPods/JobsNetworking@Pods/Support/HTTPMethod.swift:15"]
  S7 -->|calls| T7
  S8["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  T8["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S8 -->|calls| T8
  S9["method:UIListContentConfiguration::byAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:102"]
  T9["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S9 -->|calls| T9
  S10["method:UIListContentConfiguration::bySecondaryText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:107"]
  T10["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S10 -->|calls| T10
  S11["method:UIListContentConfiguration::bySecondaryAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:112"]
  T11["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S11 -->|calls| T11
  S12["method:UIListContentConfiguration::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:117"]
  T12["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S12 -->|calls| T12
  S13["method:UIListContentConfiguration::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:122"]
  T13["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S13 -->|calls| T13
  S14["method:UIListContentConfiguration::byAxesPreservingSuperviewLayoutMargins<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:127"]
  T14["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S14 -->|calls| T14
  S15["method:UIListContentConfiguration::byDirectionalLayoutMargins<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:132"]
  T15["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S15 -->|calls| T15
  S16["method:UIListContentConfiguration::byLayoutMargins<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:137"]
  T16["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S16 -->|calls| T16
  S17["method:UIListContentConfiguration::byPrefersSideBySideTextAndSecondaryText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:147"]
  T17["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S17 -->|calls| T17
  S18["method:UIListContentConfiguration::byImageToTextPadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:152"]
  T18["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S18 -->|calls| T18
  S19["method:UIListContentConfiguration::byPrimarySecondaryHorizontalPadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:157"]
  T19["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S19 -->|calls| T19
  S20["method:UIListContentConfiguration::byPrimarySecondaryVerticalPadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:162"]
  T20["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S20 -->|calls| T20
  S21["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:167"]
  T21["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S21 -->|calls| T21
  S22["method:UIListContentConfiguration::byTextFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:173"]
  T22["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S22 -->|calls| T22
  S23["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  T23["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S23 -->|calls| T23
  S24["method:UIListContentConfiguration::byTextColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:183"]
  T24["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S24 -->|calls| T24
  S25["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  T25["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 035`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::byImageEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:105"]
  T1["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S1 -->|calls| T1
  S2["method:UIButton::byTitleEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:116"]
  T2["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  S2 -->|calls| T2
  S3["method:UIButton::byTitleEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:116"]
  T3["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S3 -->|calls| T3
  S4["method:UIButton::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:252"]
  T4["method:UIButton::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:252"]
  S4 -->|calls| T4
  S5["method:UIButton::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:252"]
  T5["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S5 -->|calls| T5
  S6["method:UIButton::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:252"]
  T6["method:UIButton::_jobsSyncLegacyInsetsIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:674"]
  S6 -->|calls| T6
  S7["method:UIButton::byContentEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:269"]
  T7["method:UIButton::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:252"]
  S7 -->|calls| T7
  S8["method:UIButton::byContentEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:269"]
  T8["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S8 -->|calls| T8
  S9["method:UIButton::byContentEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:269"]
  T9["method:UIButton::_jobsSyncLegacyInsetsIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:674"]
  S9 -->|calls| T9
  S10["method:UIButton::byImageEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:287"]
  T10["method:UIButton.Configuration::byImagePadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:182"]
  S10 -->|calls| T10
  S11["method:UIButton::byImageEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:287"]
  T11["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S11 -->|calls| T11
  S12["method:UIButton::byTitleEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:299"]
  T12["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  S12 -->|calls| T12
  S13["method:UIButton::byTitleEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:299"]
  T13["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S13 -->|calls| T13
  S14["method:UIButton::byImageCircleBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:393"]
  T14["method:UIButton::byMasksToBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:446"]
  S14 -->|calls| T14
  S15["method:UIButton::byImageCircleBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:393"]
  T15["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:65"]
  S15 -->|calls| T15
  S16["method:UIButton::byImageCircleBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:393"]
  T16["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S16 -->|calls| T16
  S17["method:UIButton::byImageCircleBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:393"]
  T17["method:UIView::byContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:195"]
  S17 -->|calls| T17
  S18["method:UIButton::byClearConfigurationBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:423"]
  T18["method:UIButton::byConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:28"]
  S18 -->|calls| T18
  S19["method:UIButton::byNormalBgColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:434"]
  T19["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S19 -->|calls| T19
  S20["method:UIButton::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:452"]
  T20["method:UIButton::byMasksToBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:446"]
  S20 -->|calls| T20
  S21["method:UIButton::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:452"]
  T21["method:UIView::byShadowOffset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:110"]
  S21 -->|calls| T21
  S22["method:UIButton::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:452"]
  T22["method:UIView::byShadowRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:92"]
  S22 -->|calls| T22
  S23["method:UIButton::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:452"]
  T23["method:UIView::byShadowOpacity<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:104"]
  S23 -->|calls| T23
  S24["method:UIButton::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:452"]
  T24["method:CALayer::byShadowColor<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:256"]
  S24 -->|calls| T24
  S25["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:466"]
  T25["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:466"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

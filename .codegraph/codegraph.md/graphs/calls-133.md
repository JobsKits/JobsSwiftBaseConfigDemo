# `calls 符号关系 - 133`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T1["method:RTBadgeConfig::byShadowOffset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:110"]
  S1 -->|calls| T1
  S2["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T2["method:RTBadgeConfig::byShadowOpacity<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:105"]
  S2 -->|calls| T2
  S3["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T3["method:RTBadgeConfig::byShadowRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:100"]
  S3 -->|calls| T3
  S4["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T4["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  S4 -->|calls| T4
  S5["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T5["method:UIView::installRTBadgeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:285"]
  S5 -->|calls| T5
  S6["method:UIView::byCornerBadgeText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:170"]
  T6["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  S6 -->|calls| T6
  S7["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:176"]
  T7["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  S7 -->|calls| T7
  S8["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:176"]
  T8["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S8 -->|calls| T8
  S9["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:176"]
  T9["method:RTBadgeConfig::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:115"]
  S9 -->|calls| T9
  S10["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:176"]
  T10["method:RTBadgeConfig::byBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:80"]
  S10 -->|calls| T10
  S11["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:176"]
  T11["method:RTBadgeConfig::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:60"]
  S11 -->|calls| T11
  S12["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:176"]
  T12["method:RTBadgeConfig::byOffset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:45"]
  S12 -->|calls| T12
  S13["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:176"]
  T13["method:RTBadgeConfig::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:75"]
  S13 -->|calls| T13
  S14["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:176"]
  T14["method:RTBadgeConfig::byInset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:55"]
  S14 -->|calls| T14
  S15["method:UIView::setCornerBadgeHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:195"]
  T15["method:UIView::rt_badgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:233"]
  S15 -->|calls| T15
  S16["method:UIView::removeCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:205"]
  T16["method:UIView::rt_badgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:233"]
  S16 -->|calls| T16
  S17["method:UIView::removeCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:205"]
  T17["method:UIView::setRTBadgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:237"]
  S17 -->|calls| T17
  S18["method:_BadgeContainerView::layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:215"]
  T18["method:UIView::byCornerRadius<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:33"]
  S18 -->|calls| T18
  S19["method:UIView::ensureRTBadgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:225"]
  T19["method:UIView::rt_badgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:233"]
  S19 -->|calls| T19
  S20["method:UIView::ensureRTBadgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:225"]
  T20["method:UIView::setRTBadgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:237"]
  S20 -->|calls| T20
  S21["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T21["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S21 -->|calls| T21
  S22["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T22["method:_InsetLabel::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:335"]
  S22 -->|calls| T22
  S23["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T23["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:26"]
  S23 -->|calls| T23
  S24["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T24["method:RTBadgeConfig::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:70"]
  S24 -->|calls| T24
  S25["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:246"]
  T25["method:RTBadgeConfig::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:65"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

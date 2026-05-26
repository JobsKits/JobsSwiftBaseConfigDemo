# `calls 符号关系 - 095`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T1["method:RTBadgeConfig::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:58"]
  S1 -->|calls| T1
  S2["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T2["method:UIView::byZPosition<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:80"]
  S2 -->|calls| T2
  S3["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T3["method:UIView::byBorderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:74"]
  S3 -->|calls| T3
  S4["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T4["method:UIView::byMasksToBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:57"]
  S4 -->|calls| T4
  S5["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T5["method:RTBadgeConfig::byShadowOffset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:108"]
  S5 -->|calls| T5
  S6["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T6["method:RTBadgeConfig::byShadowOpacity<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:103"]
  S6 -->|calls| T6
  S7["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T7["method:RTBadgeConfig::byShadowRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:98"]
  S7 -->|calls| T7
  S8["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T8["method:UIView::install<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:247"]
  S8 -->|calls| T8
  S9["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  T9["method:UIView::installRTBadgeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:286"]
  S9 -->|calls| T9
  S10["method:UIView::byCornerBadgeText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:171"]
  T10["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  S10 -->|calls| T10
  S11["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:177"]
  T11["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:130"]
  S11 -->|calls| T11
  S12["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:177"]
  T12["method:UIView::byAdd<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:45"]
  S12 -->|calls| T12
  S13["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:177"]
  T13["method:RTBadgeConfig::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:73"]
  S13 -->|calls| T13
  S14["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:177"]
  T14["method:RTBadgeConfig::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:58"]
  S14 -->|calls| T14
  S15["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:177"]
  T15["method:RTBadgeConfig::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:113"]
  S15 -->|calls| T15
  S16["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:177"]
  T16["method:RTBadgeConfig::byBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:78"]
  S16 -->|calls| T16
  S17["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:177"]
  T17["method:RTBadgeConfig::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:58"]
  S17 -->|calls| T17
  S18["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:177"]
  T18["method:RTBadgeConfig::byOffset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:43"]
  S18 -->|calls| T18
  S19["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:177"]
  T19["method:RTBadgeConfig::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:73"]
  S19 -->|calls| T19
  S20["method:UIView::byCornerDot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:177"]
  T20["method:RTBadgeConfig::byInset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:53"]
  S20 -->|calls| T20
  S21["method:UIView::setCornerBadgeHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:196"]
  T21["method:UIView::rt_badgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:234"]
  S21 -->|calls| T21
  S22["method:UIView::removeCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:206"]
  T22["method:UIView::rt_badgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:234"]
  S22 -->|calls| T22
  S23["method:UIView::removeCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:206"]
  T23["method:UIView::setRTBadgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:238"]
  S23 -->|calls| T23
  S24["method:_BadgeContainerView::layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:216"]
  T24["method:_BadgeContainerView::layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:216"]
  S24 -->|calls| T24
  S25["method:_BadgeContainerView::layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:216"]
  T25["method:RTBadgeConfig::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:73"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

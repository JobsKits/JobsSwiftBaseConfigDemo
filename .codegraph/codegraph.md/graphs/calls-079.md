# `calls 符号关系 - 079`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:244"]
  T1["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S1 -->|calls| T1
  S2["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:244"]
  T2["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S2 -->|calls| T2
  S3["method:JobsFooterAnimator::layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:306"]
  T3["method:JobsFooterAnimator::layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:306"]
  S3 -->|calls| T3
  S4["method:JobsFooterAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:315"]
  T4["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S4 -->|calls| T4
  S5["method:JobsFooterAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:315"]
  T5["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S5 -->|calls| T5
  S6["method:JobsFooterAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:315"]
  T6["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S6 -->|calls| T6
  S7["method:JobsFooterAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:315"]
  T7["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S7 -->|calls| T7
  S8["method:JobsRefreshCache::setDate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:426"]
  T8["method:JobsRefreshCache::key<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:423"]
  S8 -->|calls| T8
  S9["method:JobsRefreshCache::date<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:430"]
  T9["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:36"]
  S9 -->|calls| T9
  S10["method:JobsRefreshCache::date<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:430"]
  T10["method:JobsRefreshCache::key<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:423"]
  S10 -->|calls| T10
  S11["method:JobsRefreshCache::setExpiredInterval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:435"]
  T11["method:JobsRefreshCache::key<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:423"]
  S11 -->|calls| T11
  S12["method:JobsRefreshCache::expiredInterval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:440"]
  T12["method:JobsRefreshCache::key<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:423"]
  S12 -->|calls| T12
  S13["method:JobsRefreshCache::expiredInterval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:440"]
  T13["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:36"]
  S13 -->|calls| T13
  S14["method:JobsRefreshCache::isExpired<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:446"]
  T14["method:JobsRefreshCache::date<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:430"]
  S14 -->|calls| T14
  S15["method:JobsRefreshCache::isExpired<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:446"]
  T15["method:JobsRefreshCache::expiredInterval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:440"]
  S15 -->|calls| T15
  S16["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:22"]
  T16["method:UIButton::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:466"]
  S16 -->|calls| T16
  S17["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:22"]
  T17["method:NSTextAttachment::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/NSTextAttachment.swift:39"]
  S17 -->|calls| T17
  S18["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:22"]
  T18["method:UIButton::bySubTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:233"]
  S18 -->|calls| T18
  S19["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:22"]
  T19["method:UIBarItem::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarItem.swift:111"]
  S19 -->|calls| T19
  S20["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:22"]
  T20["method:UIButton::bySubTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:225"]
  S20 -->|calls| T20
  S21["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:22"]
  T21["method:UIBarItem::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarItem.swift:102"]
  S21 -->|calls| T21
  S22["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:22"]
  T22["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  S22 -->|calls| T22
  S23["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:22"]
  T23["method:UIBarItem::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarItem.swift:24"]
  S23 -->|calls| T23
  S24["enum:JobsEmptyAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:21"]
  T24["method:JobsEmptyAuto::_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:59"]
  S24 -->|calls| T24
  S25["enum:JobsEmptyAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:21"]
  T25["method:JobsEmptyAuto::_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

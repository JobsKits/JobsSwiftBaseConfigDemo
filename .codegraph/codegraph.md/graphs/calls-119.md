# `calls 符号关系 - 119`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T1["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S1 -->|calls| T1
  S2["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T2["method:UIActivityIndicatorView::byHidesWhenStopped<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:28"]
  S2 -->|calls| T2
  S3["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T3["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S3 -->|calls| T3
  S4["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T4["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S4 -->|calls| T4
  S5["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T5["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S5 -->|calls| T5
  S6["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T6["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S6 -->|calls| T6
  S7["method:JobsHeaderAnimator::layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:212"]
  T7["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S7 -->|calls| T7
  S8["method:JobsHeaderAnimator::layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:212"]
  T8["method:PhotoTableViewCell::updateConstraints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/ASDKgram/Sample/PhotoTableViewCell.m:307"]
  S8 -->|calls| T8
  S9["method:JobsHeaderAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:224"]
  T9["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S9 -->|calls| T9
  S10["method:JobsHeaderAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:224"]
  T10["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S10 -->|calls| T10
  S11["method:JobsHeaderAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:224"]
  T11["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S11 -->|calls| T11
  S12["method:JobsHeaderAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:224"]
  T12["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S12 -->|calls| T12
  S13["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T13["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S13 -->|calls| T13
  S14["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T14["method:UILabel::byFont<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:81"]
  S14 -->|calls| T14
  S15["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T15["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S15 -->|calls| T15
  S16["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T16["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S16 -->|calls| T16
  S17["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T17["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S17 -->|calls| T17
  S18["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T18["method:UIActivityIndicatorView::byHidesWhenStopped<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:28"]
  S18 -->|calls| T18
  S19["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T19["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S19 -->|calls| T19
  S20["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T20["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S20 -->|calls| T20
  S21["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T21["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S21 -->|calls| T21
  S22["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T22["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S22 -->|calls| T22
  S23["class:JobsFooterAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:247"]
  T23["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S23 -->|calls| T23
  S24["method:JobsFooterAnimator::layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:308"]
  T24["method:PhotoTableViewCell::updateConstraints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/ASDKgram/Sample/PhotoTableViewCell.m:307"]
  S24 -->|calls| T24
  S25["method:JobsFooterAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:317"]
  T25["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

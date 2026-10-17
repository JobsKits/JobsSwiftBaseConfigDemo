# `calls 符号关系 - 120`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsFooterAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:317"]
  T1["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S1 -->|calls| T1
  S2["method:JobsFooterAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:317"]
  T2["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S2 -->|calls| T2
  S3["method:JobsFooterAnimator::refresh<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:317"]
  T3["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S3 -->|calls| T3
  S4["method:JobsRefreshCache::setDate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:429"]
  T4["method:JobsRefreshCache::key<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:426"]
  S4 -->|calls| T4
  S5["method:JobsRefreshCache::date<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:433"]
  T5["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:34"]
  S5 -->|calls| T5
  S6["method:JobsRefreshCache::date<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:433"]
  T6["method:JobsRefreshCache::key<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:426"]
  S6 -->|calls| T6
  S7["method:JobsRefreshCache::setExpiredInterval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:438"]
  T7["method:JobsRefreshCache::key<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:426"]
  S7 -->|calls| T7
  S8["method:JobsRefreshCache::setExpiredInterval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:438"]
  T8["method:NSMapTable::removeObjectForPage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:141"]
  S8 -->|calls| T8
  S9["method:JobsRefreshCache::expiredInterval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:443"]
  T9["method:JobsRefreshCache::key<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:426"]
  S9 -->|calls| T9
  S10["method:JobsRefreshCache::expiredInterval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:443"]
  T10["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:34"]
  S10 -->|calls| T10
  S11["method:JobsRefreshCache::isExpired<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:449"]
  T11["method:JobsRefreshCache::date<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:433"]
  S11 -->|calls| T11
  S12["method:JobsRefreshCache::isExpired<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:449"]
  T12["method:JobsRefreshCache::expiredInterval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:443"]
  S12 -->|calls| T12
  S13["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:24"]
  T13["method:UIButton::byTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:733"]
  S13 -->|calls| T13
  S14["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:24"]
  T14["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S14 -->|calls| T14
  S15["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:24"]
  T15["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S15 -->|calls| T15
  S16["enum:JobsEmptyAuto::Config<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:24"]
  T16["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S16 -->|calls| T16
  S17["enum:JobsEmptyAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:23"]
  T17["method:JobsEmptyAuto::_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:61"]
  S17 -->|calls| T17
  S18["enum:JobsEmptyAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:23"]
  T18["method:JobsEmptyAuto::_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:61"]
  S18 -->|calls| T18
  S19["enum:JobsEmptyAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:23"]
  T19["method:JobsEmptyAuto::_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:61"]
  S19 -->|calls| T19
  S20["enum:JobsEmptyAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:23"]
  T20["method:ASCollectionNode::performBatchUpdates:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:992"]
  S20 -->|calls| T20
  S21["enum:JobsEmptyAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:23"]
  T21["method:UICollectionView::jobs_swizzled_performBatchUpdates<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:31"]
  S21 -->|calls| T21
  S22["enum:_JobsEmptyAutoBootstrap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:71"]
  T22["method:JobsEmptyAuto::enable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:60"]
  S22 -->|calls| T22
  S23["method:UIScrollView::byEmptyButtonLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:130"]
  T23["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  S23 -->|calls| T23
  S24["method:UIScrollView::byClearEmptyButtonLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:147"]
  T24["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:263"]
  S24 -->|calls| T24
  S25["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  T25["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:228"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

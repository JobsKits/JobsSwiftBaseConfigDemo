# `calls 符号关系 - 107`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::byShimmering<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:416"]
  T1["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:362"]
  S1 -->|calls| T1
  S2["method:UIView::byShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:427"]
  T2["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  S2 -->|calls| T2
  S3["method:UIButton::jobs_fgOverlayRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:488"]
  T3["method:UIButton::jobs_effectiveContentRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:544"]
  S3 -->|calls| T3
  S4["method:UIButton::jobs_layoutFGOverlayIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:558"]
  T4["method:UIButton::jobs_fgOverlayRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:488"]
  S4 -->|calls| T4
  S5["method:UIButton::jobs_layoutFGOverlayIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:558"]
  T5["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:385"]
  S5 -->|calls| T5
  S6["method:UIButton::jobs_fgOverlay_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:580"]
  T6["method:UIButton::jobs_fgOverlay_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:580"]
  S6 -->|calls| T6
  S7["method:UIButton::jobs_fgOverlay_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:580"]
  T7["method:UIButton::jobs_layoutFGOverlayIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:558"]
  S7 -->|calls| T7
  S8["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:590"]
  T8["method:UIButton::jobs_enableForegroundOverlayAutoLayoutUpdatesOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:455"]
  S8 -->|calls| T8
  S9["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:590"]
  T9["method:UIButton::jobs_getOrCreateFGOverlayView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:476"]
  S9 -->|calls| T9
  S10["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:590"]
  T10["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:329"]
  S10 -->|calls| T10
  S11["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:590"]
  T11["method:UIButton::jobs_layoutFGOverlayIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:558"]
  S11 -->|calls| T11
  S12["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:590"]
  T12["method:UIButton::jobs_layoutFGOverlayIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:558"]
  S12 -->|calls| T12
  S13["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:590"]
  T13["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:385"]
  S13 -->|calls| T13
  S14["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:590"]
  T14["method:UIButton::jobs_layoutFGOverlayIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:558"]
  S14 -->|calls| T14
  S15["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:590"]
  T15["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:385"]
  S15 -->|calls| T15
  S16["method:UIButton::_jobs_stopForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:617"]
  T16["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:362"]
  S16 -->|calls| T16
  S17["method:UIViewController::byDismiss<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+DSL.swift:253"]
  T17["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S17 -->|calls| T17
  S18["method:UIViewController::byShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+DSL.swift:264"]
  T18["enum_member:JobsSlideCase::show<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:176"]
  S18 -->|calls| T18
  S19["method:UIViewController::addChildVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+DSL.swift:288"]
  T19["method:JobsSlot::layout<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:113"]
  S19 -->|calls| T19
  S20["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:27"]
  T20["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S20 -->|calls| T20
  S21["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:27"]
  T21["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:101"]
  S21 -->|calls| T21
  S22["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:27"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S22 -->|calls| T22
  S23["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:27"]
  T23["method:UIViewController::jobs_prepareNavRightButtonSizeIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:82"]
  S23 -->|calls| T23
  S24["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:27"]
  T24["method:UIView::byHeight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:194"]
  S24 -->|calls| T24
  S25["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:27"]
  T25["method:UIView::byTranslatesAutoresizingMaskIntoConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:219"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

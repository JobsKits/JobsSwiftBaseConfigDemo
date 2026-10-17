# `calls 符号关系 - 147`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::jobsEnsureNavigationBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:288"]
  T1["method:UIBarButtonItem::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:73"]
  S1 -->|calls| T1
  S2["method:UIViewController::jobsEnsureNavigationBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:288"]
  T2["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:575"]
  S2 -->|calls| T2
  S3["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  T3["method:UIViewController::jobsBindGKNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:205"]
  S3 -->|calls| T3
  S4["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  T4["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:241"]
  S4 -->|calls| T4
  S5["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  T5["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:575"]
  S5 -->|calls| T5
  S6["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  T6["method:UIBarButtonItem::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:73"]
  S6 -->|calls| T6
  S7["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S7 -->|calls| T7
  S8["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  T8["method:UIViewController::jobs_prepareNavRightButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:386"]
  S8 -->|calls| T8
  S9["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  T9["method:UIBarButtonItem::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:73"]
  S9 -->|calls| T9
  S10["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  T10["method:UIStackView::byAxis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:17"]
  S10 -->|calls| T10
  S11["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  T11["method:UIViewController::jobsEnsureDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:391"]
  S11 -->|calls| T11
  S12["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  T12["method:UIViewController::byGKNavBarHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:588"]
  S12 -->|calls| T12
  S13["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:334"]
  T13["method:UIViewController::jobsBindGKNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:205"]
  S13 -->|calls| T13
  S14["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:334"]
  T14["method:UIViewController::tr_setGKNavTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:360"]
  S14 -->|calls| T14
  S15["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:334"]
  T15["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:575"]
  S15 -->|calls| T15
  S16["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:334"]
  T16["method:UIBarButtonItem::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:73"]
  S16 -->|calls| T16
  S17["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:334"]
  T17["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S17 -->|calls| T17
  S18["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:334"]
  T18["method:UIViewController::jobs_prepareNavRightButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:386"]
  S18 -->|calls| T18
  S19["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:334"]
  T19["method:UIBarButtonItem::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:73"]
  S19 -->|calls| T19
  S20["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:334"]
  T20["method:UIStackView::byAxis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:17"]
  S20 -->|calls| T20
  S21["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:334"]
  T21["method:UIViewController::jobsEnsureDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:391"]
  S21 -->|calls| T21
  S22["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:334"]
  T22["method:UIViewController::byGKNavBarHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:588"]
  S22 -->|calls| T22
  S23["method:UIViewController::tr_setGKNavTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:360"]
  T23["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:194"]
  S23 -->|calls| T23
  S24["method:UIViewController::jobs_prepareNavRightButtonSizeIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:367"]
  T24["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S24 -->|calls| T24
  S25["method:UIViewController::jobs_prepareNavRightButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:386"]
  T25["method:UIButton::byClearConfigurationBackground<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:423"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

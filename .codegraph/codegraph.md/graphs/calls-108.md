# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:27"]
  T1["method:UIStackView::bySpacing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:36"]
  S1 -->|calls| T1
  S2["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:27"]
  T2["method:UIStackView::byDistribution<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:24"]
  S2 -->|calls| T2
  S3["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:27"]
  T3["method:UIStackView::byAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:30"]
  S3 -->|calls| T3
  S4["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:27"]
  T4["method:UIStackView::byAxis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:18"]
  S4 -->|calls| T4
  S5["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:52"]
  T5["method:UIViewController::tr_setGKNavTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:75"]
  S5 -->|calls| T5
  S6["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:52"]
  T6["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:101"]
  S6 -->|calls| T6
  S7["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:52"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S7 -->|calls| T7
  S8["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:52"]
  T8["method:UIViewController::jobs_prepareNavRightButtonSizeIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:82"]
  S8 -->|calls| T8
  S9["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:52"]
  T9["method:UIView::byHeight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:194"]
  S9 -->|calls| T9
  S10["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:52"]
  T10["method:UIView::byTranslatesAutoresizingMaskIntoConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:219"]
  S10 -->|calls| T10
  S11["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:52"]
  T11["method:UIStackView::bySpacing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:36"]
  S11 -->|calls| T11
  S12["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:52"]
  T12["method:UIStackView::byDistribution<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:24"]
  S12 -->|calls| T12
  S13["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:52"]
  T13["method:UIStackView::byAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:30"]
  S13 -->|calls| T13
  S14["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:52"]
  T14["method:UIStackView::byAxis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:18"]
  S14 -->|calls| T14
  S15["method:UIViewController::tr_setGKNavTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:75"]
  T15["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S15 -->|calls| T15
  S16["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:101"]
  T16["method:UIAlertAction::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:32"]
  S16 -->|calls| T16
  S17["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:101"]
  T17["method:UIButton::byTitleEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:116"]
  S17 -->|calls| T17
  S18["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:101"]
  T18["method:UIButton::byContentEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:87"]
  S18 -->|calls| T18
  S19["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:101"]
  T19["method:NSTextAttachment::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/NSTextAttachment.swift:39"]
  S19 -->|calls| T19
  S20["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:101"]
  T20["method:UIAlertController::byTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:60"]
  S20 -->|calls| T20
  S21["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:101"]
  T21["method:UIViewController::byFrame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+DSL.swift:33"]
  S21 -->|calls| T21
  S22["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:101"]
  T22["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  S22 -->|calls| T22
  S23["class:UIViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+SnapKit.swift:19"]
  T23["method:UIView::byContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:195"]
  S23 -->|calls| T23
  S24["class:UIViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+SnapKit.swift:19"]
  T24["method:UIView::byClipsToBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:51"]
  S24 -->|calls| T24
  S25["class:UIViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+SnapKit.swift:19"]
  T25["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 152`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::__probe_viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:241"]
  T1["method:UIViewController::__probe_viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:241"]
  S1 -->|calls| T1
  S2["method:UIViewController::__probe_viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:241"]
  T2["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S2 -->|calls| T2
  S3["method:UIViewController::__probe_viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:245"]
  T3["method:UIViewController::__probe_viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:245"]
  S3 -->|calls| T3
  S4["method:UIViewController::__probe_viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:245"]
  T4["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S4 -->|calls| T4
  S5["method:UIViewController::jobsForceHideSystemNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:31"]
  T5["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S5 -->|calls| T5
  S6["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:67"]
  T6["function:UIViewController::_nb_swizzleOnce::exch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:72"]
  S6 -->|calls| T6
  S7["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:67"]
  T7["method:OverviewViewController::viewWillAppear<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/OverviewViewController.swift:38"]
  S7 -->|calls| T7
  S8["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:67"]
  T8["method:UIViewController::_nb_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:83"]
  S8 -->|calls| T8
  S9["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:67"]
  T9["function:UIViewController::_nb_swizzleOnce::exch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:72"]
  S9 -->|calls| T9
  S10["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:67"]
  T10["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:75"]
  S10 -->|calls| T10
  S11["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:67"]
  T11["method:UIViewController::_nb_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:92"]
  S11 -->|calls| T11
  S12["method:UIViewController::_nb_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:83"]
  T12["method:UIViewController::_nb_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:83"]
  S12 -->|calls| T12
  S13["method:UIViewController::_nb_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:92"]
  T13["method:UIViewController::_nb_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:92"]
  S13 -->|calls| T13
  S14["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  T14["function:UINavigationController::_jobs_installPopSwizzlesIfNeeded::exch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:108"]
  S14 -->|calls| T14
  S15["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  T15["method:UINavigationController::popViewController<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:125"]
  S15 -->|calls| T15
  S16["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  T16["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:121"]
  S16 -->|calls| T16
  S17["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  T17["function:UINavigationController::_jobs_installPopSwizzlesIfNeeded::exch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:108"]
  S17 -->|calls| T17
  S18["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  T18["method:UINavigationController::popToViewController<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:137"]
  S18 -->|calls| T18
  S19["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  T19["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:142"]
  S19 -->|calls| T19
  S20["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  T20["function:UINavigationController::_jobs_installPopSwizzlesIfNeeded::exch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:108"]
  S20 -->|calls| T20
  S21["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  T21["method:UINavigationController::popToRootViewController<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:149"]
  S21 -->|calls| T21
  S22["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  T22["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:162"]
  S22 -->|calls| T22
  S23["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:121"]
  T23["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:121"]
  S23 -->|calls| T23
  S24["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:121"]
  T24["method:CATransition::byType<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATransition.swift:21"]
  S24 -->|calls| T24
  S25["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:121"]
  T25["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

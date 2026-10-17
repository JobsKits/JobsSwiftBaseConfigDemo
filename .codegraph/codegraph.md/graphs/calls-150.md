# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::_JobsAppearSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:104"]
  T1["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:70"]
  S1 -->|calls| T1
  S2["method:UIViewController::_JobsAppearSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:104"]
  T2["method:UIViewController::jobs_viewDidAppear_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:116"]
  S2 -->|calls| T2
  S3["method:UIViewController::jobs_viewDidAppear_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:116"]
  T3["method:UIViewController::jobs_viewDidAppear_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:116"]
  S3 -->|calls| T3
  S4["method:UIViewController::jobs_viewDidAppear_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:116"]
  T4["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S4 -->|calls| T4
  S5["method:UITestVC::loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:55"]
  T5["method:UITestView::hostLoadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:20"]
  S5 -->|calls| T5
  S6["method:UITestVC::viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:60"]
  T6["method:UITestView::hostViewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:23"]
  S6 -->|calls| T6
  S7["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:65"]
  T7["method:ASDKViewController::viewWillAppear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:182"]
  S7 -->|calls| T7
  S8["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:65"]
  T8["method:UITestView::hostViewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:26"]
  S8 -->|calls| T8
  S9["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:70"]
  T9["method:ViewController::viewDidAppear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASTableViewStressTest/Sample/ViewController.m:69"]
  S9 -->|calls| T9
  S10["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:70"]
  T10["method:UITestView::hostViewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:29"]
  S10 -->|calls| T10
  S11["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:75"]
  T11["method:UnityViewControllerBase::viewWillDisappear:<br/>Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:37"]
  S11 -->|calls| T11
  S12["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:75"]
  T12["method:UITestView::hostViewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:32"]
  S12 -->|calls| T12
  S13["method:UITestVC::viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:80"]
  T13["method:AsyncViewController::viewDidDisappear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/SynchronousConcurrency/Sample/AsyncViewController.m:30"]
  S13 -->|calls| T13
  S14["method:UITestVC::viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:80"]
  T14["method:UITestView::hostViewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:35"]
  S14 -->|calls| T14
  S15["method:UITestVC::viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:85"]
  T15["method:UITestView::hostViewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:38"]
  S15 -->|calls| T15
  S16["method:UITestVC::viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:90"]
  T16["method:UITestView::hostViewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:41"]
  S16 -->|calls| T16
  S17["method:UITestVC::viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:95"]
  T17["method:UITestView::hostViewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:44"]
  S17 -->|calls| T17
  S18["method:UIViewController::bindVCLifecycleListener<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:132"]
  T18["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:170"]
  S18 -->|calls| T18
  S19["property:UIViewController::_vcLifecycleListeners<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:154"]
  T19["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S19 -->|calls| T19
  S20["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:170"]
  T20["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:203"]
  S20 -->|calls| T20
  S21["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:170"]
  T21["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:203"]
  S21 -->|calls| T21
  S22["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:170"]
  T22["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:203"]
  S22 -->|calls| T22
  S23["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:170"]
  T23["method:OverviewViewController::viewWillAppear<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/OverviewViewController.swift:38"]
  S23 -->|calls| T23
  S24["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:170"]
  T24["method:UIViewController::__probe_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:221"]
  S24 -->|calls| T24
  S25["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:170"]
  T25["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:203"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

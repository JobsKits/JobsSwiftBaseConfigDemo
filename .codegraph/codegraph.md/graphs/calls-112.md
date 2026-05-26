# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T1["method:UITestVC::viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:81"]
  S1 -->|calls| T1
  S2["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T2["method:UIViewController::__probe_viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:234"]
  S2 -->|calls| T2
  S3["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T3["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S3 -->|calls| T3
  S4["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T4["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S4 -->|calls| T4
  S5["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T5["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S5 -->|calls| T5
  S6["method:UIViewController::__probe_loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:214"]
  T6["method:UIViewController::__probe_loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:214"]
  S6 -->|calls| T6
  S7["method:UIViewController::__probe_loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:214"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S7 -->|calls| T7
  S8["method:UIViewController::__probe_viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:218"]
  T8["method:UIViewController::__probe_viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:218"]
  S8 -->|calls| T8
  S9["method:UIViewController::__probe_viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:218"]
  T9["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S9 -->|calls| T9
  S10["method:UIViewController::__probe_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:222"]
  T10["method:UIViewController::__probe_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:222"]
  S10 -->|calls| T10
  S11["method:UIViewController::__probe_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:222"]
  T11["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S11 -->|calls| T11
  S12["method:UIViewController::__probe_viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:226"]
  T12["method:UIViewController::__probe_viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:226"]
  S12 -->|calls| T12
  S13["method:UIViewController::__probe_viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:226"]
  T13["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S13 -->|calls| T13
  S14["method:UIViewController::__probe_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:230"]
  T14["method:UIViewController::__probe_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:230"]
  S14 -->|calls| T14
  S15["method:UIViewController::__probe_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:230"]
  T15["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S15 -->|calls| T15
  S16["method:UIViewController::__probe_viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:234"]
  T16["method:UIViewController::__probe_viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:234"]
  S16 -->|calls| T16
  S17["method:UIViewController::__probe_viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:234"]
  T17["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S17 -->|calls| T17
  S18["method:UIViewController::__probe_viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:238"]
  T18["method:UIViewController::__probe_viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:238"]
  S18 -->|calls| T18
  S19["method:UIViewController::__probe_viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:238"]
  T19["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S19 -->|calls| T19
  S20["method:UIViewController::__probe_viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:242"]
  T20["method:UIViewController::__probe_viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:242"]
  S20 -->|calls| T20
  S21["method:UIViewController::__probe_viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:242"]
  T21["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S21 -->|calls| T21
  S22["method:UIViewController::__probe_viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:246"]
  T22["method:UIViewController::__probe_viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:246"]
  S22 -->|calls| T22
  S23["method:UIViewController::__probe_viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:246"]
  T23["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S23 -->|calls| T23
  S24["method:UIViewController::jobsForceHideSystemNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:31"]
  T24["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S24 -->|calls| T24
  S25["method:UIViewController::byNavBarHiddenLifecycle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:54"]
  T25["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:68"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

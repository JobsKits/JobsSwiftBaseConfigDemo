# `calls 符号关系 - 111`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:71"]
  T1["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:71"]
  S1 -->|calls| T1
  S2["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:71"]
  T2["method:UITestView::hostViewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:29"]
  S2 -->|calls| T2
  S3["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:76"]
  T3["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:76"]
  S3 -->|calls| T3
  S4["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:76"]
  T4["method:UITestView::hostViewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:32"]
  S4 -->|calls| T4
  S5["method:UITestVC::viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:81"]
  T5["method:UITestVC::viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:81"]
  S5 -->|calls| T5
  S6["method:UITestVC::viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:81"]
  T6["method:UITestView::hostViewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:35"]
  S6 -->|calls| T6
  S7["method:UITestVC::viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:86"]
  T7["method:UITestVC::viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:86"]
  S7 -->|calls| T7
  S8["method:UITestVC::viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:86"]
  T8["method:UITestView::hostViewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:38"]
  S8 -->|calls| T8
  S9["method:UITestVC::viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:91"]
  T9["method:UITestVC::viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:91"]
  S9 -->|calls| T9
  S10["method:UITestVC::viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:91"]
  T10["method:UITestView::hostViewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:41"]
  S10 -->|calls| T10
  S11["method:UITestVC::viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:96"]
  T11["method:UITestVC::viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:96"]
  S11 -->|calls| T11
  S12["method:UITestVC::viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:96"]
  T12["method:UITestView::hostViewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:44"]
  S12 -->|calls| T12
  S13["method:UIViewController::bindVCLifecycleListener<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:133"]
  T13["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  S13 -->|calls| T13
  S14["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T14["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S14 -->|calls| T14
  S15["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T15["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S15 -->|calls| T15
  S16["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T16["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S16 -->|calls| T16
  S17["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T17["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:66"]
  S17 -->|calls| T17
  S18["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T18["method:UIViewController::__probe_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:222"]
  S18 -->|calls| T18
  S19["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T19["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S19 -->|calls| T19
  S20["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T20["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:71"]
  S20 -->|calls| T20
  S21["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T21["method:UIViewController::__probe_viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:226"]
  S21 -->|calls| T21
  S22["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T22["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S22 -->|calls| T22
  S23["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T23["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:76"]
  S23 -->|calls| T23
  S24["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T24["method:UIViewController::__probe_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:230"]
  S24 -->|calls| T24
  S25["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T25["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

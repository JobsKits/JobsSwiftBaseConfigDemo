# `calls 符号关系 - 028`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::bindVCLifecycleListener<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:133"]
  T1["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  S1 -->|calls| T1
  S2["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T2["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S2 -->|calls| T2
  S3["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T3["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S3 -->|calls| T3
  S4["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T4["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S4 -->|calls| T4
  S5["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T5["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:66"]
  S5 -->|calls| T5
  S6["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T6["method:UIViewController::__probe_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:222"]
  S6 -->|calls| T6
  S7["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T7["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S7 -->|calls| T7
  S8["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T8["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:71"]
  S8 -->|calls| T8
  S9["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T9["method:UIViewController::__probe_viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:226"]
  S9 -->|calls| T9
  S10["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T10["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S10 -->|calls| T10
  S11["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T11["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:76"]
  S11 -->|calls| T11
  S12["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T12["method:UIViewController::__probe_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:230"]
  S12 -->|calls| T12
  S13["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T13["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S13 -->|calls| T13
  S14["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T14["method:UITestVC::viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:81"]
  S14 -->|calls| T14
  S15["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T15["method:UIViewController::__probe_viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:234"]
  S15 -->|calls| T15
  S16["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T16["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S16 -->|calls| T16
  S17["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T17["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S17 -->|calls| T17
  S18["method:VCLifecycleSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:171"]
  T18["method:VCLifecycleSwizzler::swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:204"]
  S18 -->|calls| T18
  S19["method:UIViewController::__probe_loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:214"]
  T19["method:UIViewController::__probe_loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:214"]
  S19 -->|calls| T19
  S20["method:UIViewController::__probe_loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:214"]
  T20["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S20 -->|calls| T20
  S21["method:UIViewController::__probe_viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:218"]
  T21["method:UIViewController::__probe_viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:218"]
  S21 -->|calls| T21
  S22["method:UIViewController::__probe_viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:218"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S22 -->|calls| T22
  S23["method:UIViewController::__probe_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:222"]
  T23["method:UIViewController::__probe_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:222"]
  S23 -->|calls| T23
  S24["method:UIViewController::__probe_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:222"]
  T24["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S24 -->|calls| T24
  S25["method:UIViewController::__probe_viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:226"]
  T25["method:UIViewController::__probe_viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:226"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

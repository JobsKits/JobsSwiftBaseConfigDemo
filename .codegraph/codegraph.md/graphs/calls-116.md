# `calls 符号关系 - 116`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:240"]
  T1["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  S1 -->|calls| T1
  S2["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:240"]
  T2["method:UIViewController::jobs_isSameDestination<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:124"]
  S2 -->|calls| T2
  S3["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:240"]
  T3["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  S3 -->|calls| T3
  S4["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:240"]
  T4["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S4 -->|calls| T4
  S5["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:240"]
  T5["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S5 -->|calls| T5
  S6["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:240"]
  T6["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S6 -->|calls| T6
  S7["method:UIWindow::byAttach<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:20"]
  T7["method:UIWindow::byAttach<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:20"]
  S7 -->|calls| T7
  S8["method:UIWindow::byScreen<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:50"]
  T8["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S8 -->|calls| T8
  S9["method:UIWindow::byAttach<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:67"]
  T9["method:UIWindow::byAttach<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:67"]
  S9 -->|calls| T9
  S10["method:UIWindow::byScreen<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:97"]
  T10["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S10 -->|calls| T10
  S11["method:UIWindow::snapshotImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:134"]
  T11["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S11 -->|calls| T11
  S12["method:UIWindow::presentOnTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:140"]
  T12["method:UIWindow::jobsTopMost<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:73"]
  S12 -->|calls| T12
  S13["method:UIWindow::presentOnTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:140"]
  T13["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S13 -->|calls| T13
  S14["class:UIWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:15"]
  T14["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:33"]
  S14 -->|calls| T14
  S15["class:UIWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:15"]
  T15["method:UIWindow::byWindowLevel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:44"]
  S15 -->|calls| T15
  S16["method:UIWindow::jobsMake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:30"]
  T16["method:UIWindow::jobsMake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:30"]
  S16 -->|calls| T16
  S17["method:UIWindow::jobsMake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:30"]
  T17["method:UIWindow::_makeIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:86"]
  S17 -->|calls| T17
  S18["method:UIWindow::jobsMake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:30"]
  T18["method:UIWindow::byWindowLevel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:44"]
  S18 -->|calls| T18
  S19["method:UIWindow::jobsMake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:30"]
  T19["method:UIWindow::byRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:38"]
  S19 -->|calls| T19
  S20["method:UIWindow::jobsMake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:48"]
  T20["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S20 -->|calls| T20
  S21["method:UIWindow::jobsMake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:48"]
  T21["method:UIWindow::_makeIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:86"]
  S21 -->|calls| T21
  S22["method:UIWindow::jobsMake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:48"]
  T22["method:UIWindow::byWindowLevel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:44"]
  S22 -->|calls| T22
  S23["method:UIWindow::jobsTopMost<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:73"]
  T23["method:UIWindow::jobsTopMost<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:73"]
  S23 -->|calls| T23
  S24["method:UIWindow::jobsTopMost<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:73"]
  T24["method:UIWindow::jobsTopMost<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:73"]
  S24 -->|calls| T24
  S25["method:UIWindow::jobsTopMost<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:73"]
  T25["method:UIWindow::jobsTopMost<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow.swift:73"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

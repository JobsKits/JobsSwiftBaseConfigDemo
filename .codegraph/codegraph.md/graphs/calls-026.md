# `calls 符号关系 - 026`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:22"]
  T1["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S1 -->|calls| T1
  S2["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  T2["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S2 -->|calls| T2
  S3["method:UIView::jobs_hasVisibleTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:45"]
  T3["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:22"]
  S3 -->|calls| T3
  S4["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  T4["import:JobsNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:15"]
  S4 -->|calls| T4
  S5["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  T5["method:UIView::_setJobsNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:68"]
  S5 -->|calls| T5
  S6["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  T6["method:BaseWebView::jobsNavBarDidToggle<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+NavBarHost.swift:20"]
  S6 -->|calls| T6
  S7["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  T7["method:UIView::_setJobsNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:68"]
  S7 -->|calls| T7
  S8["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  T8["method:BaseWebView::jobsNavBarDidToggle<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+NavBarHost.swift:20"]
  S8 -->|calls| T8
  S9["method:UIView::byNavBarEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:118"]
  T9["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S9 -->|calls| T9
  S10["method:UIView::byNavBarStyle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:127"]
  T10["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S10 -->|calls| T10
  S11["method:UIView::byNavBarTitleProvider<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:136"]
  T11["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S11 -->|calls| T11
  S12["method:UIView::byNavBarBackButtonProvider<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:145"]
  T12["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S12 -->|calls| T12
  S13["method:UIView::byNavBarBackButtonLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:154"]
  T13["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S13 -->|calls| T13
  S14["method:UIView::byNavBarOnBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:163"]
  T14["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S14 -->|calls| T14
  S15["method:UIView::byNavBarLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:172"]
  T15["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S15 -->|calls| T15
  S16["class:Reactive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T16["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S16 -->|calls| T16
  S17["class:Reactive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T17["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S17 -->|calls| T17
  S18["class:Reactive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T18["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  S18 -->|calls| T18
  S19["class:Reactive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T19["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:32"]
  S19 -->|calls| T19
  S20["class:Reactive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T20["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S20 -->|calls| T20
  S21["method:UIView::_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:22"]
  T21["method:UIView::_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:22"]
  S21 -->|calls| T21
  S22["method:UIView::_recursiveSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:28"]
  T22["method:UIView::_recursiveSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:28"]
  S22 -->|calls| T22
  S23["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T23["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S23 -->|calls| T23
  S24["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T24["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S24 -->|calls| T24
  S25["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T25["method:UIView::height<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:40"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

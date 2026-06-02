# `calls 符号关系 - 027`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T1["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  S1 -->|calls| T1
  S2["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T2["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:32"]
  S2 -->|calls| T2
  S3["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T3["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S3 -->|calls| T3
  S4["method:UIView::onJobsTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:39"]
  T4["method:UIView::addJobsAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:58"]
  S4 -->|calls| T4
  S5["method:UIView::onJobsChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:45"]
  T5["method:UIView::addJobsAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:58"]
  S5 -->|calls| T5
  S6["method:UIView::onJobsEvent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:51"]
  T6["method:UIView::addJobsAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:58"]
  S6 -->|calls| T6
  S7["method:UIView::_jobs_handleViewTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:88"]
  T7["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:29"]
  S7 -->|calls| T7
  S8["method:UITestVC::loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:56"]
  T8["method:UITestVC::loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:56"]
  S8 -->|calls| T8
  S9["method:UITestVC::loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:56"]
  T9["method:UITestView::hostLoadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:20"]
  S9 -->|calls| T9
  S10["method:UITestVC::viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:61"]
  T10["method:UITestVC::viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:61"]
  S10 -->|calls| T10
  S11["method:UITestVC::viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:61"]
  T11["method:UITestView::hostViewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:23"]
  S11 -->|calls| T11
  S12["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:66"]
  T12["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:66"]
  S12 -->|calls| T12
  S13["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:66"]
  T13["method:UITestView::hostViewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:26"]
  S13 -->|calls| T13
  S14["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:71"]
  T14["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:71"]
  S14 -->|calls| T14
  S15["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:71"]
  T15["method:UITestView::hostViewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:29"]
  S15 -->|calls| T15
  S16["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:76"]
  T16["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:76"]
  S16 -->|calls| T16
  S17["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:76"]
  T17["method:UITestView::hostViewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:32"]
  S17 -->|calls| T17
  S18["method:UITestVC::viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:81"]
  T18["method:UITestVC::viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:81"]
  S18 -->|calls| T18
  S19["method:UITestVC::viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:81"]
  T19["method:UITestView::hostViewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:35"]
  S19 -->|calls| T19
  S20["method:UITestVC::viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:86"]
  T20["method:UITestVC::viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:86"]
  S20 -->|calls| T20
  S21["method:UITestVC::viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:86"]
  T21["method:UITestView::hostViewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:38"]
  S21 -->|calls| T21
  S22["method:UITestVC::viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:91"]
  T22["method:UITestVC::viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:91"]
  S22 -->|calls| T22
  S23["method:UITestVC::viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:91"]
  T23["method:UITestView::hostViewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:41"]
  S23 -->|calls| T23
  S24["method:UITestVC::viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:96"]
  T24["method:UITestVC::viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:96"]
  S24 -->|calls| T24
  S25["method:UITestVC::viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:96"]
  T25["method:UITestView::hostViewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:44"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

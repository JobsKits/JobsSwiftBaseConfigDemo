# `calls 符号关系 - 110`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T1["method:UITapGestureRecognizer::byTaps<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:115"]
  S1 -->|calls| T1
  S2["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T2["method:JobsSideDrawerVC::closeDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:220"]
  S2 -->|calls| T2
  S3["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T3["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S3 -->|calls| T3
  S4["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T4["method:UIViewController::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+DSL.swift:26"]
  S4 -->|calls| T4
  S5["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T5["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S5 -->|calls| T5
  S6["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T6["method:UIView::jobs_addGestureRetView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:592"]
  S6 -->|calls| T6
  S7["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T7["method:UIViewController::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+DSL.swift:26"]
  S7 -->|calls| T7
  S8["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T8["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S8 -->|calls| T8
  S9["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T9["method:UIView::jobs_addGestureRetView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:592"]
  S9 -->|calls| T9
  S10["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T10["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S10 -->|calls| T10
  S11["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T11["method:UIViewController::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+DSL.swift:26"]
  S11 -->|calls| T11
  S12["method:JobsSideDrawerVC::viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:153"]
  T12["method:JobsSideDrawerVC::viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:153"]
  S12 -->|calls| T12
  S13["method:JobsSideDrawerVC::setDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:179"]
  T13["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S13 -->|calls| T13
  S14["method:JobsSideDrawerVC::setDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:179"]
  T14["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S14 -->|calls| T14
  S15["method:JobsSideDrawerVC::toggleDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:212"]
  T15["method:JobsSideDrawerVC::closeDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:220"]
  S15 -->|calls| T15
  S16["method:JobsSideDrawerVC::toggleDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:212"]
  T16["method:JobsSideDrawerVC::openDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:216"]
  S16 -->|calls| T16
  S17["method:JobsSideDrawerVC::openDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:216"]
  T17["method:JobsSideDrawerVC::setDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:179"]
  S17 -->|calls| T17
  S18["method:JobsSideDrawerVC::closeDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:220"]
  T18["method:JobsSideDrawerVC::setDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:179"]
  S18 -->|calls| T18
  S19["method:UIViewController::jobs_findMainNavFromAncestors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:255"]
  T19["method:JobsMainPushProviding::jobs_prepareForMainPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:242"]
  S19 -->|calls| T19
  S20["method:UITestVC::loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:56"]
  T20["method:UITestVC::loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:56"]
  S20 -->|calls| T20
  S21["method:UITestVC::loadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:56"]
  T21["method:UITestView::hostLoadView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:20"]
  S21 -->|calls| T21
  S22["method:UITestVC::viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:61"]
  T22["method:UITestVC::viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:61"]
  S22 -->|calls| T22
  S23["method:UITestVC::viewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:61"]
  T23["method:UITestView::hostViewDidLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:23"]
  S23 -->|calls| T23
  S24["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:66"]
  T24["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:66"]
  S24 -->|calls| T24
  S25["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:66"]
  T25["method:UITestView::hostViewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:26"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

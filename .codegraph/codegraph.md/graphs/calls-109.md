# `calls 符号关系 - 109`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  T1["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:42"]
  S1 -->|calls| T1
  S2["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  T2["method:UINavigationController::popViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:126"]
  S2 -->|calls| T2
  S3["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  T3["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S3 -->|calls| T3
  S4["method:UIViewController::byCompletion<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:59"]
  T4["method:UIViewController::_JobsAppearSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:104"]
  S4 -->|calls| T4
  S5["method:UIViewController::byCompletion<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:59"]
  T5["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S5 -->|calls| T5
  S6["method:UIViewController::byCompletion<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:59"]
  T6["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S6 -->|calls| T6
  S7["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S7 -->|calls| T7
  S8["method:UIViewController::_JobsAppearSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:104"]
  T8["method:UITestVC::viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:71"]
  S8 -->|calls| T8
  S9["method:UIViewController::_JobsAppearSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:104"]
  T9["method:UIViewController::jobs_viewDidAppear_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:116"]
  S9 -->|calls| T9
  S10["method:UIViewController::jobs_viewDidAppear_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:116"]
  T10["method:UIViewController::jobs_viewDidAppear_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:116"]
  S10 -->|calls| T10
  S11["method:UIViewController::jobs_viewDidAppear_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:116"]
  T11["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S11 -->|calls| T11
  S12["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T12["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S12 -->|calls| T12
  S13["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T13["method:UIPageViewController::byDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIPageViewController.swift:36"]
  S13 -->|calls| T13
  S14["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T14["method:UIGestureRecognizer::byName<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:84"]
  S14 -->|calls| T14
  S15["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T15["method:UIAlertAction::byEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:19"]
  S15 -->|calls| T15
  S16["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T16["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:45"]
  S16 -->|calls| T16
  S17["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T17["method:UIPanGestureRecognizer::byMaxTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:157"]
  S17 -->|calls| T17
  S18["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T18["method:UIPanGestureRecognizer::byMinTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:151"]
  S18 -->|calls| T18
  S19["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T19["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S19 -->|calls| T19
  S20["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T20["method:JobsSideDrawerVC::setDrawer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:179"]
  S20 -->|calls| T20
  S21["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T21["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S21 -->|calls| T21
  S22["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T22["method:UIGestureRecognizer::byName<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:84"]
  S22 -->|calls| T22
  S23["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T23["method:UIAlertAction::byEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:19"]
  S23 -->|calls| T23
  S24["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T24["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:45"]
  S24 -->|calls| T24
  S25["class:JobsSideDrawerVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:46"]
  T25["method:UITapGestureRecognizer::byTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:121"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

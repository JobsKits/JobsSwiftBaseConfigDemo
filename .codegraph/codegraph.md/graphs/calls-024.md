# `calls 符号关系 - 024`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UINavigationController::interactionControllerForAnimationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:39"]
  T1["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S1 -->|calls| T1
  S2["method:UINavigationController::willShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:48"]
  T2["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S2 -->|calls| T2
  S3["method:UINavigationController::didShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:57"]
  T3["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S3 -->|calls| T3
  S4["method:UINavigationController::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:66"]
  T4["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S4 -->|calls| T4
  S5["method:UINavigationController::supportedInterfaceOrientations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:74"]
  T5["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S5 -->|calls| T5
  S6["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:92"]
  T6["method:UINavigationController::animationControllerForOperation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:28"]
  S6 -->|calls| T6
  S7["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:109"]
  T7["method:UINavigationController::interactionControllerForAnimationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:39"]
  S7 -->|calls| T7
  S8["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:116"]
  T8["method:UINavigationController::willShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:48"]
  S8 -->|calls| T8
  S9["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:124"]
  T9["method:UINavigationController::didShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:57"]
  S9 -->|calls| T9
  S10["method:JobsNavigationControllerBlocksProxy::navigationControllerPreferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:133"]
  T10["method:UINavigationController::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:66"]
  S10 -->|calls| T10
  S11["method:JobsNavigationControllerBlocksProxy::navigationControllerSupportedInterfaceOrientations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:139"]
  T11["method:UINavigationController::supportedInterfaceOrientations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:74"]
  S11 -->|calls| T11
  S12["method:UIScrollView::byScrollTargetWeak<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:19"]
  T12["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S12 -->|calls| T12
  S13["method:UIScrollView::byScrollTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:27"]
  T13["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S13 -->|calls| T13
  S14["method:UIScrollView::byScrollTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:27"]
  T14["method:UIScrollView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:171"]
  S14 -->|calls| T14
  S15["method:UIScrollView::willBeginDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:36"]
  T15["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S15 -->|calls| T15
  S16["method:UIScrollView::didScroll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:42"]
  T16["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S16 -->|calls| T16
  S17["method:UIScrollView::didEndDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:48"]
  T17["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S17 -->|calls| T17
  S18["method:UIScrollView::willBeginDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:54"]
  T18["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S18 -->|calls| T18
  S19["method:UIScrollView::didEndDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:60"]
  T19["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S19 -->|calls| T19
  S20["method:UIScrollView::scrollViewShouldScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:66"]
  T20["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S20 -->|calls| T20
  S21["method:UIScrollView::didScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:72"]
  T21["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S21 -->|calls| T21
  S22["method:JobsScrollViewBlocksProxy::scrollViewWillBeginDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:90"]
  T22["method:UIScrollView::willBeginDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:36"]
  S22 -->|calls| T22
  S23["method:JobsScrollViewBlocksProxy::scrollViewDidScroll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:95"]
  T23["method:UIScrollView::didScroll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:42"]
  S23 -->|calls| T23
  S24["method:JobsScrollViewBlocksProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:100"]
  T24["method:UIScrollView::didEndDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:48"]
  S24 -->|calls| T24
  S25["method:JobsScrollViewBlocksProxy::scrollViewWillBeginDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:105"]
  T25["method:UIScrollView::willBeginDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:54"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

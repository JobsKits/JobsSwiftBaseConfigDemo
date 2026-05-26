# `calls 符号关系 - 075`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UINavigationBarAppearance::bySubtitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:175"]
  T1["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S1 -->|calls| T1
  S2["method:UINavigationBarAppearance::bySubtitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:186"]
  T2["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S2 -->|calls| T2
  S3["method:UINavigationController::pushViewControllerByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:108"]
  T3["method:UINavigationController::pushViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:114"]
  S3 -->|calls| T3
  S4["method:UINavigationController::pushViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:114"]
  T4["method:UINavigationController::pushViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:114"]
  S4 -->|calls| T4
  S5["method:UINavigationController::popViewControllerByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:120"]
  T5["method:UINavigationController::popViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:126"]
  S5 -->|calls| T5
  S6["method:UINavigationController::popViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:126"]
  T6["method:UINavigationController::popViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:126"]
  S6 -->|calls| T6
  S7["method:UINavigationController::popToViewControllerByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:132"]
  T7["method:UINavigationController::popToViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:138"]
  S7 -->|calls| T7
  S8["method:UINavigationController::popToViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:138"]
  T8["method:UINavigationController::popToViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:138"]
  S8 -->|calls| T8
  S9["method:UINavigationController::popToRootViewControllerByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:144"]
  T9["method:UINavigationController::popToRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:150"]
  S9 -->|calls| T9
  S10["method:UINavigationController::popToRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:150"]
  T10["method:UINavigationController::popToRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:150"]
  S10 -->|calls| T10
  S11["method:UINavigationController::byShowVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:157"]
  T11["enum_member:JobsSlideCase::show<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:176"]
  S11 -->|calls| T11
  S12["method:UINavigationController::jobs_pushOrPopTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:173"]
  T12["method:UIViewController::jobs_isSameDestination<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:124"]
  S12 -->|calls| T12
  S13["method:UINavigationController::jobs_pushOrPopTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:173"]
  T13["method:UIViewController::jobs_isSameDestination<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:124"]
  S13 -->|calls| T13
  S14["method:UINavigationController::jobs_pushOrPopTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:173"]
  T14["method:UINavigationController::popToViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:138"]
  S14 -->|calls| T14
  S15["method:UINavigationController::jobs_pushOrPopTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:173"]
  T15["method:UINavigationController::pushViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:114"]
  S15 -->|calls| T15
  S16["method:UINavigationController::byNavTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:20"]
  T16["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S16 -->|calls| T16
  S17["method:UINavigationController::animationControllerForOperation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:28"]
  T17["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S17 -->|calls| T17
  S18["method:UINavigationController::interactionControllerForAnimationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:39"]
  T18["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S18 -->|calls| T18
  S19["method:UINavigationController::willShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:48"]
  T19["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S19 -->|calls| T19
  S20["method:UINavigationController::didShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:57"]
  T20["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S20 -->|calls| T20
  S21["method:UINavigationController::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:66"]
  T21["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S21 -->|calls| T21
  S22["method:UINavigationController::supportedInterfaceOrientations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:74"]
  T22["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S22 -->|calls| T22
  S23["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:92"]
  T23["method:UINavigationController::animationControllerForOperation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:28"]
  S23 -->|calls| T23
  S24["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:109"]
  T24["method:UINavigationController::interactionControllerForAnimationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:39"]
  S24 -->|calls| T24
  S25["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:116"]
  T25["method:UINavigationController::willShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:48"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

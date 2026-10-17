# `calls 符号关系 - 039`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorBaseVC::viewDidAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:192"]
  T1["method:UIViewController::byGKNavBarHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:588"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorBaseVC::viewDidAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:192"]
  T2["method:UIViewController::jobsForceHideSystemNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:31"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorBaseVC::viewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:198"]
  T3["method:UnityViewControllerBase::viewWillDisappear:<br/>Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:37"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorBaseVC::viewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:198"]
  T4["method:JobsAppDoorBaseVC::cancelSubmission<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:226"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorBaseVC::viewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:198"]
  T5["method:UIViewController::jobsForceHideSystemNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:31"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorBaseVC::viewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:198"]
  T6["method:JobsAppDoorBaseVC::setVolumePanelVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:318"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorBaseVC::viewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:198"]
  T7["method:JobsAppDoorBackgroundView::pause<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:83"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorBaseVC::openCountryCodePicker<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:209"]
  T8["method:JobsAppDoorInputView::setCountry<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:60"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorBaseVC::openCountryCodePicker<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:209"]
  T9["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:118"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorBaseVC::finishToHome<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:218"]
  T10["field:JobsAppDoorBaseVC::homeHandler<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:43"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorBaseVC::finishToHome<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:218"]
  T11["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorBaseVC::cancelSubmission<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:226"]
  T12["method:JobsAppDoorBaseVC::setSubmissionState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:239"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorBaseVC::setSubmissionState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:239"]
  T13["method:JobsAppDoorBaseVC::submissionStateDidChange<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:237"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorBaseVC::setSubmissionState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:239"]
  T14["field:JobsAppDoorBaseVC::onSubmissionStateChanged<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:32"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorBaseVC::finishSubmission<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:245"]
  T15["method:JobsAppDoorBaseVC::setSubmissionState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:239"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorBaseVC::finishSubmission<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:245"]
  T16["method:JobsAppDoorBaseVC::setSubmissionState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:239"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorBaseVC::dispatchSubmit<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:258"]
  T17["field:JobsAppDoorBaseVC::submitHandler<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:26"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorBaseVC::dispatchSubmit<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:258"]
  T18["method:JobsAppDoorBaseVC::setSubmissionState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:239"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorBaseVC::dispatchSubmit<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:258"]
  T19["method:JobsAppDoorBaseVC::finishSubmission<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:245"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorBaseVC::dispatchSubmit<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:258"]
  T20["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorBaseVC::dispatchSubmit<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:258"]
  T21["method:JobsAppDoorBaseVC::finishSubmission<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:245"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorBaseVC::runEntrancePop<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:292"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorBaseVC::runEntrancePop<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:292"]
  T23["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorBaseVC::runEntrancePop<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:292"]
  T24["method:UIView::jobsAnimateKeyframes<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+AnimationDSL.swift:69"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorBaseVC::runEntrancePop<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:292"]
  T25["method:UIView::jobsAddKeyframe<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+AnimationDSL.swift:85"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

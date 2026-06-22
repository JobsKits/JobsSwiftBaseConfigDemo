# `calls 符号关系 - 037`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDKNavigationController::popToRootViewControllerAnimated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:70"]
  T1["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S1 -->|calls| T1
  S2["method:ASDKNavigationController::popToRootViewControllerAnimated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:70"]
  T2["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S2 -->|calls| T2
  S3["method:ASDKNavigationController::popToRootViewControllerAnimated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:70"]
  T3["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S3 -->|calls| T3
  S4["method:ASDKNavigationController::setViewControllers:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:80"]
  T4["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S4 -->|calls| T4
  S5["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T5["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S5 -->|calls| T5
  S6["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T6["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S6 -->|calls| T6
  S7["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T7["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  S7 -->|calls| T7
  S8["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T8["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S8 -->|calls| T8
  S9["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  T9["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S9 -->|calls| T9
  S10["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  T10["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  S10 -->|calls| T10
  S11["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  T11["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S11 -->|calls| T11
  S12["method:ASDKNavigationController::popViewControllerAnimated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:104"]
  T12["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S12 -->|calls| T12
  S13["method:ASDKNavigationController::popViewControllerAnimated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:104"]
  T13["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T14["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T15["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T16["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T17["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T18["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  T19["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  S19 -->|calls| T19
  S20["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  T20["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S20 -->|calls| T20
  S21["method:ASDKViewController::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:42"]
  T21["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S21 -->|calls| T21
  S22["method:ASDKViewController::initWithNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:55"]
  T22["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  S22 -->|calls| T22
  S23["method:ASDKViewController::initWithNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:55"]
  T23["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S23 -->|calls| T23
  S24["method:ASDKViewController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:67"]
  T24["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  S24 -->|calls| T24
  S25["method:ASDKViewController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:67"]
  T25["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

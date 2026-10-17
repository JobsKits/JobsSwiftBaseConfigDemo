# `calls 符号关系 - 196`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseVC::viewWillAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:34"]
  T1["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  S1 -->|calls| T1
  S2["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:39"]
  T2["method:ViewController::viewDidAppear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASTableViewStressTest/Sample/ViewController.m:69"]
  S2 -->|calls| T2
  S3["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:39"]
  T3["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  S3 -->|calls| T3
  S4["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:39"]
  T4["method:JobsBluetoothMockTransport::byEnabled<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothMockTransport/JobsBluetoothMockTransport.swift:26"]
  S4 -->|calls| T4
  S5["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:39"]
  T5["method:JobsTextField::byDelegate<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:103"]
  S5 -->|calls| T5
  S6["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T6["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S6 -->|calls| T6
  S7["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T7["method:WKWebViewConfiguration::byPreferences<br/>JobsByPods/JobsSwiftDSL@Pods/WebKit/WKWebViewConfiguration.swift:37"]
  S7 -->|calls| T7
  S8["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T8["method:Style::byTitleAlignmentCenter<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:310"]
  S8 -->|calls| T8
  S9["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T9["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S9 -->|calls| T9
  S10["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T10["method:Style::byHairlineHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:305"]
  S10 -->|calls| T10
  S11["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T11["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S11 -->|calls| T11
  S12["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T12["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S12 -->|calls| T12
  S13["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T13["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  S13 -->|calls| T13
  S14["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T14["method:UIView::jobs_hasVisibleTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:45"]
  S14 -->|calls| T14
  S15["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T15["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S15 -->|calls| T15
  S16["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T16["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  S16 -->|calls| T16
  S17["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:35"]
  T17["method:Dictionary::stringValue<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Dictionary.swift:22"]
  S17 -->|calls| T17
  S18["method:BaseWebVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:142"]
  T18["method:BaseVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:28"]
  S18 -->|calls| T18
  S19["method:BaseWebVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:142"]
  T19["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:294"]
  S19 -->|calls| T19
  S20["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:21"]
  T20["method:UIScrollView::byAlwaysBounceVertical<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:43"]
  S20 -->|calls| T20
  S21["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:21"]
  T21["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S21 -->|calls| T21
  S22["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:21"]
  T22["method:UIImageView::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIImageView/UIImageView+DSL.swift:19"]
  S22 -->|calls| T22
  S23["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:21"]
  T23["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S23 -->|calls| T23
  S24["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:21"]
  T24["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S24 -->|calls| T24
  S25["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:21"]
  T25["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

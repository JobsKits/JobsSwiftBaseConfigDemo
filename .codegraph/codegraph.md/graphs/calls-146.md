# `calls 符号关系 - 146`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  T1["method:UIButton::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:873"]
  S1 -->|calls| T1
  S2["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  T2["method:UIButton::byThemeImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/Theme/JobsTheme+DSL.swift:47"]
  S2 -->|calls| T2
  S3["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  T3["method:BRBasePicker::bind<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:103"]
  S3 -->|calls| T3
  S4["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  T4["method:UIBarButtonItem::bySelected<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:127"]
  S4 -->|calls| T4
  S5["method:UIViewController::jobsBindGKNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:205"]
  T5["method:BRBasePicker::bind<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:103"]
  S5 -->|calls| T5
  S6["method:UIViewController::jobsBindGKNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:205"]
  T6["method:JobsThemeCenter::resolvedColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsTheme.swift:220"]
  S6 -->|calls| T6
  S7["method:UIViewController::jobsBindGKNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:205"]
  T7["method:JobsThemeCenter::resolvedColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsTheme.swift:220"]
  S7 -->|calls| T7
  S8["method:UIViewController::jobsBindSystemNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:216"]
  T8["method:BRBasePicker::bind<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:103"]
  S8 -->|calls| T8
  S9["method:UIViewController::jobsBindSystemNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:216"]
  T9["method:JobsThemeCenter::resolvedColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsTheme.swift:220"]
  S9 -->|calls| T9
  S10["method:UIViewController::jobsBindSystemNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:216"]
  T10["method:JobsThemeCenter::resolvedColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsTheme.swift:220"]
  S10 -->|calls| T10
  S11["method:UIViewController::jobsBindSystemNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:216"]
  T11["method:UINavigationBar::byBarTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:31"]
  S11 -->|calls| T11
  S12["method:UIViewController::jobsBindSystemNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:216"]
  T12["method:UINavigationBar::byTitleTextAttributes<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:52"]
  S12 -->|calls| T12
  S13["method:UIViewController::jobsBindSystemNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:216"]
  T13["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S13 -->|calls| T13
  S14["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T14["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:82"]
  S14 -->|calls| T14
  S15["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T15["method:UIViewController::jobsBindSystemNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:216"]
  S15 -->|calls| T15
  S16["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T16["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S16 -->|calls| T16
  S17["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T17["method:UINavigationController::byNavBarHidden<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:41"]
  S17 -->|calls| T17
  S18["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T18["method:UIViewController::jobsEnsureDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:391"]
  S18 -->|calls| T18
  S19["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T19["method:UIViewController::jobsBindGKNavigationTheme<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:205"]
  S19 -->|calls| T19
  S20["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T20["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S20 -->|calls| T20
  S21["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T21["method:UIViewController::tr_setGKNavTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:360"]
  S21 -->|calls| T21
  S22["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T22["method:UIViewController::jobsEnsureDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:391"]
  S22 -->|calls| T22
  S23["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T23["method:UIViewController::jobsEnsureNavigationBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:288"]
  S23 -->|calls| T23
  S24["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  T24["method:UIViewController::byGKNavBarHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:588"]
  S24 -->|calls| T24
  S25["method:UIViewController::jobsEnsureNavigationBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:288"]
  T25["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:82"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

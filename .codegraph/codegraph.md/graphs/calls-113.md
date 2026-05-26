# `calls 符号关系 - 113`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:68"]
  T1["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S1 -->|calls| T1
  S2["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:68"]
  T2["function:UIViewController::_nb_swizzleOnce::exch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:74"]
  S2 -->|calls| T2
  S3["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:68"]
  T3["method:UITestVC::viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:66"]
  S3 -->|calls| T3
  S4["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:68"]
  T4["method:UIViewController::_nb_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:85"]
  S4 -->|calls| T4
  S5["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:68"]
  T5["function:UIViewController::_nb_swizzleOnce::exch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:74"]
  S5 -->|calls| T5
  S6["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:68"]
  T6["method:UITestVC::viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:76"]
  S6 -->|calls| T6
  S7["method:UIViewController::_nb_swizzleOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:68"]
  T7["method:UIViewController::_nb_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:94"]
  S7 -->|calls| T7
  S8["method:UIViewController::_nb_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:85"]
  T8["method:UIViewController::_nb_viewWillAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:85"]
  S8 -->|calls| T8
  S9["method:UIViewController::_nb_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:94"]
  T9["method:UIViewController::_nb_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:94"]
  S9 -->|calls| T9
  S10["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  T10["function:UINavigationController::_jobs_installPopSwizzlesIfNeeded::exch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:111"]
  S10 -->|calls| T10
  S11["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  T11["method:UINavigationController::popViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:126"]
  S11 -->|calls| T11
  S12["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  T12["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  S12 -->|calls| T12
  S13["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  T13["function:UINavigationController::_jobs_installPopSwizzlesIfNeeded::exch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:111"]
  S13 -->|calls| T13
  S14["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  T14["method:UINavigationController::popToViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:138"]
  S14 -->|calls| T14
  S15["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  T15["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  S15 -->|calls| T15
  S16["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  T16["function:UINavigationController::_jobs_installPopSwizzlesIfNeeded::exch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:111"]
  S16 -->|calls| T16
  S17["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  T17["method:UINavigationController::popToRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:150"]
  S17 -->|calls| T17
  S18["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  T18["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  S18 -->|calls| T18
  S19["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  T19["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  S19 -->|calls| T19
  S20["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  T20["method:CAAnimation::byTimingFunction<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:13"]
  S20 -->|calls| T20
  S21["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  T21["method:JobsButtonNumberAnimConfig::Title::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:375"]
  S21 -->|calls| T21
  S22["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  T22["method:CATransition::bySubtype<br/>JobsByPods/JobsByQuartzCore@Pods/CATransition.swift:29"]
  S22 -->|calls| T22
  S23["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  T23["method:CAGradientLayer::byType<br/>JobsByPods/JobsByQuartzCore@Pods/CAGradientLayer.swift:69"]
  S23 -->|calls| T23
  S24["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  T24["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S24 -->|calls| T24
  S25["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  T25["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

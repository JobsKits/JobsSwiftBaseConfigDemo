# `calls 符号关系 - 153`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:121"]
  T1["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:121"]
  S1 -->|calls| T1
  S2["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:121"]
  T2["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:121"]
  S2 -->|calls| T2
  S3["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:142"]
  T3["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:142"]
  S3 -->|calls| T3
  S4["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:142"]
  T4["method:CATransition::byType<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATransition.swift:21"]
  S4 -->|calls| T4
  S5["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:142"]
  T5["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S5 -->|calls| T5
  S6["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:142"]
  T6["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:142"]
  S6 -->|calls| T6
  S7["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:142"]
  T7["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:142"]
  S7 -->|calls| T7
  S8["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:162"]
  T8["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:162"]
  S8 -->|calls| T8
  S9["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:162"]
  T9["method:CATransition::byType<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATransition.swift:21"]
  S9 -->|calls| T9
  S10["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:162"]
  T10["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S10 -->|calls| T10
  S11["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:162"]
  T11["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:162"]
  S11 -->|calls| T11
  S12["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:162"]
  T12["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:162"]
  S12 -->|calls| T12
  S13["property:UIViewController::_jobs_entryDirection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:71"]
  T13["enum:JobsPushDirection<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:403"]
  S13 -->|calls| T13
  S14["method:UIViewController::_consumeDirection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:108"]
  T14["method:UIViewController::byDirectionReset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:102"]
  S14 -->|calls| T14
  S15["method:UIViewController::_consumeDirection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:108"]
  T15["enum:JobsPushDirection<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:403"]
  S15 -->|calls| T15
  S16["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:118"]
  T16["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  S16 -->|calls| T16
  S17["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:124"]
  T17["method:UIViewController::byDirection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:96"]
  S17 -->|calls| T17
  S18["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T18["method:UIViewController::_consumeDirection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:108"]
  S18 -->|calls| T18
  S19["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T19["method:UIResponder::jobsNearestVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:30"]
  S19 -->|calls| T19
  S20["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T20["method:UIViewController::jobs_findMainNavFromAncestors<br/>JobsByPods/JobsViewPush@Pods/Core/JobsSideDrawer/JobsSideDrawer.swift:647"]
  S20 -->|calls| T20
  S21["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T21["method:UINavigationController::_jobs_lockPushing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:236"]
  S21 -->|calls| T21
  S22["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T22["method:CATransition::bySubtype<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATransition.swift:27"]
  S22 -->|calls| T22
  S23["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T23["method:CATransition::byType<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATransition.swift:21"]
  S23 -->|calls| T23
  S24["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T24["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S24 -->|calls| T24
  S25["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T25["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

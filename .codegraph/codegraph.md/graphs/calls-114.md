# `calls 符号关系 - 114`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  T1["method:UINavigationController::_jobs_popViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:127"]
  S1 -->|calls| T1
  S2["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  T2["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  S2 -->|calls| T2
  S3["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  T3["method:JobsButtonNumberAnimConfig::Title::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:375"]
  S3 -->|calls| T3
  S4["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  T4["method:CATransition::bySubtype<br/>JobsByPods/JobsByQuartzCore@Pods/CATransition.swift:29"]
  S4 -->|calls| T4
  S5["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  T5["method:CAGradientLayer::byType<br/>JobsByPods/JobsByQuartzCore@Pods/CAGradientLayer.swift:69"]
  S5 -->|calls| T5
  S6["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  T6["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S6 -->|calls| T6
  S7["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  T7["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  S7 -->|calls| T7
  S8["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  T8["method:UINavigationController::_jobs_popToViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:148"]
  S8 -->|calls| T8
  S9["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  T9["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  S9 -->|calls| T9
  S10["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  T10["method:CAAnimation::byTimingFunction<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:13"]
  S10 -->|calls| T10
  S11["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  T11["method:JobsButtonNumberAnimConfig::Title::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:375"]
  S11 -->|calls| T11
  S12["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  T12["method:CATransition::bySubtype<br/>JobsByPods/JobsByQuartzCore@Pods/CATransition.swift:29"]
  S12 -->|calls| T12
  S13["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  T13["method:CAGradientLayer::byType<br/>JobsByPods/JobsByQuartzCore@Pods/CAGradientLayer.swift:69"]
  S13 -->|calls| T13
  S14["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  T14["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S14 -->|calls| T14
  S15["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  T15["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  S15 -->|calls| T15
  S16["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  T16["method:UINavigationController::_jobs_popToRootViewController_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:168"]
  S16 -->|calls| T16
  S17["method:UIViewController::_consumeDirection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:94"]
  T17["method:UIViewController::byDirectionReset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:88"]
  S17 -->|calls| T17
  S18["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:104"]
  T18["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:104"]
  S18 -->|calls| T18
  S19["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:110"]
  T19["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:110"]
  S19 -->|calls| T19
  S20["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:110"]
  T20["method:UIViewController::byDirection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:82"]
  S20 -->|calls| T20
  S21["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T21["method:UIViewController::_consumeDirection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:94"]
  S21 -->|calls| T21
  S22["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T22["method:UIResponder::jobsNearestVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:30"]
  S22 -->|calls| T22
  S23["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T23["method:UIViewController::jobs_findMainNavFromAncestors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+侧滑抽屉容器.swift:255"]
  S23 -->|calls| T23
  S24["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T24["method:UINavigationController::_jobs_lockPushing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:244"]
  S24 -->|calls| T24
  S25["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T25["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

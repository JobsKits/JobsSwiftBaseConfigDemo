# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T1["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  S1 -->|calls| T1
  S2["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T2["method:UINavigationController::pushViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:114"]
  S2 -->|calls| T2
  S3["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T3["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S3 -->|calls| T3
  S4["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T4["method:UINavigationController::pushViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:114"]
  S4 -->|calls| T4
  S5["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T5["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S5 -->|calls| T5
  S6["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T6["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S6 -->|calls| T6
  S7["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T7["method:UINavigationController::_jobs_lockPushing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:244"]
  S7 -->|calls| T7
  S8["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T8["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S8 -->|calls| T8
  S9["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T9["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:106"]
  S9 -->|calls| T9
  S10["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T10["method:UINavigationController::pushViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:114"]
  S10 -->|calls| T10
  S11["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T11["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S11 -->|calls| T11
  S12["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T12["method:UINavigationController::pushViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:114"]
  S12 -->|calls| T12
  S13["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T13["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S13 -->|calls| T13
  S14["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T14["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S14 -->|calls| T14
  S15["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T15["method:UIViewController::byModalPresentationStyle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+DSL.swift:39"]
  S15 -->|calls| T15
  S16["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T16["method:UINavigationController::byNavigationBarHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:29"]
  S16 -->|calls| T16
  S17["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T17["method:CAAnimation::byTimingFunction<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:13"]
  S17 -->|calls| T17
  S18["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T18["method:JobsButtonNumberAnimConfig::Title::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:375"]
  S18 -->|calls| T18
  S19["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T19["method:CATransition::bySubtype<br/>JobsByPods/JobsByQuartzCore@Pods/CATransition.swift:29"]
  S19 -->|calls| T19
  S20["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T20["method:CAGradientLayer::byType<br/>JobsByPods/JobsByQuartzCore@Pods/CAGradientLayer.swift:69"]
  S20 -->|calls| T20
  S21["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T21["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S21 -->|calls| T21
  S22["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T22["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S22 -->|calls| T22
  S23["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T23["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S23 -->|calls| T23
  S24["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:120"]
  T24["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S24 -->|calls| T24
  S25["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:240"]
  T25["method:UIResponder::jobsNearestVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

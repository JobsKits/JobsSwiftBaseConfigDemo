# `calls 符号关系 - 154`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T1["method:UINavigationController::pushViewController<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:113"]
  S1 -->|calls| T1
  S2["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T2["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  S2 -->|calls| T2
  S3["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T3["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S3 -->|calls| T3
  S4["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T4["method:UINavigationController::pushViewController<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:113"]
  S4 -->|calls| T4
  S5["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T5["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  S5 -->|calls| T5
  S6["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T6["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S6 -->|calls| T6
  S7["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T7["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S7 -->|calls| T7
  S8["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T8["method:UINavigationController::_jobs_lockPushing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:236"]
  S8 -->|calls| T8
  S9["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T9["method:CATransition::bySubtype<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATransition.swift:27"]
  S9 -->|calls| T9
  S10["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T10["method:CATransition::byType<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATransition.swift:21"]
  S10 -->|calls| T10
  S11["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T11["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S11 -->|calls| T11
  S12["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T12["method:UINavigationController::_jobs_installPopSwizzlesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+系统导航栏设置.swift:104"]
  S12 -->|calls| T12
  S13["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T13["method:UINavigationController::pushViewController<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:113"]
  S13 -->|calls| T13
  S14["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T14["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  S14 -->|calls| T14
  S15["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T15["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S15 -->|calls| T15
  S16["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T16["method:UINavigationController::pushViewController<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:113"]
  S16 -->|calls| T16
  S17["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T17["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  S17 -->|calls| T17
  S18["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T18["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S18 -->|calls| T18
  S19["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T19["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S19 -->|calls| T19
  S20["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T20["method:UIViewController::byModalPresentationStyle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIViewController/UIViewController+DSL.swift:40"]
  S20 -->|calls| T20
  S21["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T21["method:UINavigationController::byNavigationBarHidden<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:29"]
  S21 -->|calls| T21
  S22["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T22["method:CATransition::byType<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATransition.swift:21"]
  S22 -->|calls| T22
  S23["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T23["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  S23 -->|calls| T23
  S24["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T24["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S24 -->|calls| T24
  S25["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T25["method:UIViewController::jobsEnsureNavigationDefaults<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:244"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 171`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:19"]
  T1["method:JobsLottieRefreshView::jobs_setupLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:155"]
  S1 -->|calls| T1
  S2["class:JobsLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:19"]
  T2["method:JobsLottieRefreshView::jobs_setupLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:155"]
  S2 -->|calls| T2
  S3["class:JobsLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:19"]
  T3["method:JobsLottieRefreshView::jobs_setupLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:155"]
  S3 -->|calls| T3
  S4["method:JobsLottieRefreshView::didMoveToWindow<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:70"]
  T4["method:JobsLottieRefreshView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:99"]
  S4 -->|calls| T4
  S5["method:JobsLottieRefreshView::didMoveToWindow<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:70"]
  T5["method:JobsAppDoorBackgroundView::pause<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:83"]
  S5 -->|calls| T5
  S6["method:JobsLottieRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:79"]
  T6["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S6 -->|calls| T6
  S7["method:JobsLottieRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:79"]
  T7["method:JobsClockView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:248"]
  S7 -->|calls| T7
  S8["method:JobsLottieRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:79"]
  T8["method:JobsAppDoorBackgroundView::play<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:79"]
  S8 -->|calls| T8
  S9["method:JobsLottieRefreshView::byPause<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:92"]
  T9["method:JobsAppDoorBackgroundView::pause<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:83"]
  S9 -->|calls| T9
  S10["method:JobsLottieRefreshView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:99"]
  T10["method:JobsLottieRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:79"]
  S10 -->|calls| T10
  S11["method:JobsLottieRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:104"]
  T11["method:JobsClockView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:248"]
  S11 -->|calls| T11
  S12["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T12["method:JobsAppDoorBackgroundView::pause<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:83"]
  S12 -->|calls| T12
  S13["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T13["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S13 -->|calls| T13
  S14["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T14["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S14 -->|calls| T14
  S15["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T15["method:JobsAppDoorBackgroundView::pause<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:83"]
  S15 -->|calls| T15
  S16["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T16["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S16 -->|calls| T16
  S17["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T17["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S17 -->|calls| T17
  S18["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T18["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S18 -->|calls| T18
  S19["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T19["method:JobsLottieRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:79"]
  S19 -->|calls| T19
  S20["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T20["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S20 -->|calls| T20
  S21["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T21["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S21 -->|calls| T21
  S22["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T22["method:JobsLottieRefreshView::byPause<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:92"]
  S22 -->|calls| T22
  S23["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T23["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S23 -->|calls| T23
  S24["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T24["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S24 -->|calls| T24
  S25["method:JobsLottieRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:120"]
  T25["method:JobsLottieRefreshView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:104"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

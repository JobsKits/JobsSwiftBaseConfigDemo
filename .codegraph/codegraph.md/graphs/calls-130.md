# `calls 符号关系 - 130`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:34"]
  T1["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S1 -->|calls| T1
  S2["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:34"]
  T2["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:34"]
  S2 -->|calls| T2
  S3["method:UIView::jobs_hasVisibleTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:45"]
  T3["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:21"]
  S3 -->|calls| T3
  S4["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  T4["method:UIView::_setJobsNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:67"]
  S4 -->|calls| T4
  S5["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  T5["method:BaseWebView::jobsNavBarDidToggle<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+NavBarHost.swift:19"]
  S5 -->|calls| T5
  S6["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  T6["method:UIView::_setJobsNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:67"]
  S6 -->|calls| T6
  S7["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  T7["method:BaseWebView::jobsNavBarDidToggle<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+NavBarHost.swift:19"]
  S7 -->|calls| T7
  S8["method:UIView::byNavBarEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:117"]
  T8["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  S8 -->|calls| T8
  S9["method:UIView::byNavBarStyle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:126"]
  T9["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  S9 -->|calls| T9
  S10["method:UIView::byNavBarTitleProvider<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:135"]
  T10["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  S10 -->|calls| T10
  S11["method:UIView::byNavBarBackButtonProvider<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:144"]
  T11["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  S11 -->|calls| T11
  S12["method:UIView::byNavBarBackButtonLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:153"]
  T12["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  S12 -->|calls| T12
  S13["method:UIView::byNavBarOnBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:162"]
  T13["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  S13 -->|calls| T13
  S14["method:UIView::byNavBarLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:171"]
  T14["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:76"]
  S14 -->|calls| T14
  S15["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:43"]
  T15["method:LottieAnimationView::bySpeed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:147"]
  S15 -->|calls| T15
  S16["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:43"]
  T16["method:JobsAppDoorBackgroundView::play<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:79"]
  S16 -->|calls| T16
  S17["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:77"]
  T17["method:LottieAnimationView::byBackgroundBehavior<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:153"]
  S17 -->|calls| T17
  S18["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:77"]
  T18["method:JobsAppDoorBackgroundView::play<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:79"]
  S18 -->|calls| T18
  S19["method:UIView::lottiePlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:104"]
  T19["method:JobsAppDoorBackgroundView::play<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:79"]
  S19 -->|calls| T19
  S20["method:UIView::lottiePause<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:110"]
  T20["method:JobsAppDoorBackgroundView::pause<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:83"]
  S20 -->|calls| T20
  S21["method:UIView::lottieStop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:116"]
  T21["method:JobsClockView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:248"]
  S21 -->|calls| T21
  S22["method:UIView::lottieReplace<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:128"]
  T22["method:VideoPlayer::playToView:<br/>Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:200"]
  S22 -->|calls| T22
  S23["property:Reactive::keyboardHeight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T23["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S23 -->|calls| T23
  S24["property:Reactive::keyboardHeight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T24["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S24 -->|calls| T24
  S25["method:JobsSkeletonPulse::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SkeletonView.swift:125"]
  T25["method:CABasicAnimation::byToValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

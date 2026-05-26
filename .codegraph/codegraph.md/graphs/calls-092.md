# `calls 符号关系 - 092`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  T1["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S1 -->|calls| T1
  S2["method:UIView::jobs_hasVisibleTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:45"]
  T2["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:22"]
  S2 -->|calls| T2
  S3["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  T3["import:JobsNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:15"]
  S3 -->|calls| T3
  S4["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  T4["method:UIView::_setJobsNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:68"]
  S4 -->|calls| T4
  S5["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  T5["method:BaseWebView::jobsNavBarDidToggle<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+NavBarHost.swift:20"]
  S5 -->|calls| T5
  S6["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  T6["method:UIView::_setJobsNavBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:68"]
  S6 -->|calls| T6
  S7["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  T7["method:BaseWebView::jobsNavBarDidToggle<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+NavBarHost.swift:20"]
  S7 -->|calls| T7
  S8["method:UIView::byNavBarEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:118"]
  T8["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S8 -->|calls| T8
  S9["method:UIView::byNavBarStyle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:127"]
  T9["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S9 -->|calls| T9
  S10["method:UIView::byNavBarTitleProvider<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:136"]
  T10["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S10 -->|calls| T10
  S11["method:UIView::byNavBarBackButtonProvider<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:145"]
  T11["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S11 -->|calls| T11
  S12["method:UIView::byNavBarBackButtonLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:154"]
  T12["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S12 -->|calls| T12
  S13["method:UIView::byNavBarOnBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:163"]
  T13["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S13 -->|calls| T13
  S14["method:UIView::byNavBarLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:172"]
  T14["method:UIView::_applyNavBarConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:77"]
  S14 -->|calls| T14
  S15["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:42"]
  T15["method:LottieAnimationView::byBackgroundBehavior<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:158"]
  S15 -->|calls| T15
  S16["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:42"]
  T16["method:LottieAnimationView::byLottieContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:155"]
  S16 -->|calls| T16
  S17["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:42"]
  T17["method:LottieAnimationView::byLoop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:149"]
  S17 -->|calls| T17
  S18["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:42"]
  T18["method:LottieAnimationView::bySpeed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:152"]
  S18 -->|calls| T18
  S19["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:42"]
  T19["method:JobsLottieConfig::configure<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshEnums.swift:115"]
  S19 -->|calls| T19
  S20["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:42"]
  T20["method:VideoPlayer::playToView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:201"]
  S20 -->|calls| T20
  S21["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:78"]
  T21["method:JobsLottieConfig::configure<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshEnums.swift:115"]
  S21 -->|calls| T21
  S22["method:UIView::byLottieAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:78"]
  T22["method:VideoPlayer::playToView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:201"]
  S22 -->|calls| T22
  S23["method:UIView::lottiePlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:107"]
  T23["method:VideoPlayer::playToView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:201"]
  S23 -->|calls| T23
  S24["method:UIView::lottiePause<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:113"]
  T24["method:JobsMarqueeView::pause<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:341"]
  S24 -->|calls| T24
  S25["method:UIView::lottieStop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:119"]
  T25["method:JobsClockView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:230"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

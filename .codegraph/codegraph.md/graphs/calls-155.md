# `calls 符号关系 - 155`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::byPush<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:134"]
  T1["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S1 -->|calls| T1
  S2["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:268"]
  T2["method:UIResponder::jobsNearestVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:30"]
  S2 -->|calls| T2
  S3["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:268"]
  T3["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:53"]
  S3 -->|calls| T3
  S4["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:268"]
  T4["method:UIViewController::jobs_isSameDestination<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIViewController/UIViewController+JobsRouteComparable.swift:17"]
  S4 -->|calls| T4
  S5["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:268"]
  T5["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:53"]
  S5 -->|calls| T5
  S6["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:268"]
  T6["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S6 -->|calls| T6
  S7["method:UIViewController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+自定义进入方向.swift:268"]
  T7["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S7 -->|calls| T7
  S8["property:URL::img<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/URL/URL.swift:20"]
  T8["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S8 -->|calls| T8
  S9["class:JobsCountdownBinder<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:20"]
  T9["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S9 -->|calls| T9
  S10["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:35"]
  T10["method:JobsCountdownBinder::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:91"]
  S10 -->|calls| T10
  S11["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:35"]
  T11["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:98"]
  S11 -->|calls| T11
  S12["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:35"]
  T12["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S12 -->|calls| T12
  S13["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:35"]
  T13["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:47"]
  S13 -->|calls| T13
  S14["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:35"]
  T14["method:UIButton::bySubTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+Subtitle.swift:206"]
  S14 -->|calls| T14
  S15["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:35"]
  T15["method:BRBasePicker::byTitle<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:32"]
  S15 -->|calls| T15
  S16["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:35"]
  T16["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:98"]
  S16 -->|calls| T16
  S17["method:JobsCountdownBinder::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:91"]
  T17["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S17 -->|calls| T17
  S18["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:98"]
  T18["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:47"]
  S18 -->|calls| T18
  S19["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:98"]
  T19["method:UIButton::bySubTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+Subtitle.swift:206"]
  S19 -->|calls| T19
  S20["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:98"]
  T20["method:BRBasePicker::byTitle<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:32"]
  S20 -->|calls| T20
  S21["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:22"]
  T21["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  S21 -->|calls| T21
  S22["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:22"]
  T22["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  S22 -->|calls| T22
  S23["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:22"]
  T23["method:UIButton::jobs_attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:57"]
  S23 -->|calls| T23
  S24["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:22"]
  T24["method:UIButton::jobs_attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:57"]
  S24 -->|calls| T24
  S25["struct:JobsLegacyButtonState<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:22"]
  T25["method:UIButton::jobs_titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:125"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

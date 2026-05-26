# `calls 符号关系 - 051`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:824"]
  T1["method:JobsNumberFormatter::groupDigits<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:870"]
  S1 -->|calls| T1
  S2["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:824"]
  T2["method:JobsNumberFormatter::groupDigits<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:870"]
  S2 -->|calls| T2
  S3["method:JobsNumberFormatter::roundToDecimals<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:860"]
  T3["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:115"]
  S3 -->|calls| T3
  S4["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  T4["function:onMainImmediateOrAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:245"]
  S4 -->|calls| T4
  S5["method:UIButton::_jobs_nextToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:37"]
  T5["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S5 -->|calls| T5
  S6["method:UIButton::_jobs_nextToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:37"]
  T6["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S6 -->|calls| T6
  S7["method:UIButton::_jobs_isCurrentToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:53"]
  T7["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S7 -->|calls| T7
  S8["method:UIButton::_jobs_startForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:62"]
  T8["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:590"]
  S8 -->|calls| T8
  S9["method:UIButton::_jobs_stopForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:66"]
  T9["method:UIButton::_jobs_stopForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:617"]
  S9 -->|calls| T9
  S10["method:UIButton::_jobs_startBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:70"]
  T10["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:329"]
  S10 -->|calls| T10
  S11["method:UIButton::_jobs_startBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:70"]
  T11["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:385"]
  S11 -->|calls| T11
  S12["method:UIButton::_jobs_stopBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:88"]
  T12["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:362"]
  S12 -->|calls| T12
  S13["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  T13["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:94"]
  S13 -->|calls| T13
  S14["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  T14["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S14 -->|calls| T14
  S15["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  T15["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:107"]
  S15 -->|calls| T15
  S16["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  T16["method:UIButton::StateProxy::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1055"]
  S16 -->|calls| T16
  S17["method:UIButton::_jobs_loadingPlaceholderImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:146"]
  T17["method:UIImage::_jobs_transparentPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:154"]
  S17 -->|calls| T17
  S18["method:UIImage::_jobs_transparentPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:154"]
  T18["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S18 -->|calls| T18
  S19["method:UIButton::byTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:44"]
  T19["enum_member:JobsImageSource::url<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:20"]
  S19 -->|calls| T19
  S20["method:UIButton::byTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:44"]
  T20["method:UIButton::_jobs_unbindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:154"]
  S20 -->|calls| T20
  S21["method:UIButton::byTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:44"]
  T21["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:130"]
  S21 -->|calls| T21
  S22["method:UIButton::byRemoveTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:84"]
  T22["method:UIButton::_jobs_unbindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:154"]
  S22 -->|calls| T22
  S23["method:UIButton::_jobs_onTapPlaySound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:101"]
  T23["method:VideoPlayer::playToView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:201"]
  S23 -->|calls| T23
  S24["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:130"]
  T24["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S24 -->|calls| T24
  S25["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:130"]
  T25["method:UIButton::_jobs_onTapPlaySound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:101"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

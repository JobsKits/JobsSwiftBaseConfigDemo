# `calls 符号关系 - 101`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:780"]
  T1["method:JobsNumberFormatter::groupDigits<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:820"]
  S1 -->|calls| T1
  S2["method:JobsNumberFormatter::roundToDecimals<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:810"]
  T2["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:151"]
  S2 -->|calls| T2
  S3["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  T3["function:onMainImmediateOrAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:245"]
  S3 -->|calls| T3
  S4["method:UIButton::_jobs_nextToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:37"]
  T4["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S4 -->|calls| T4
  S5["method:UIButton::_jobs_nextToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:37"]
  T5["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S5 -->|calls| T5
  S6["method:UIButton::_jobs_isCurrentToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:53"]
  T6["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S6 -->|calls| T6
  S7["method:UIButton::_jobs_startForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:62"]
  T7["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:644"]
  S7 -->|calls| T7
  S8["method:UIButton::_jobs_stopForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:66"]
  T8["method:UIButton::_jobs_stopForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:649"]
  S8 -->|calls| T8
  S9["method:UIButton::_jobs_startBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:70"]
  T9["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  S9 -->|calls| T9
  S10["method:UIButton::_jobs_startBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:70"]
  T10["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  S10 -->|calls| T10
  S11["method:UIButton::_jobs_stopBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:86"]
  T11["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:386"]
  S11 -->|calls| T11
  S12["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:91"]
  T12["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:55"]
  S12 -->|calls| T12
  S13["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:91"]
  T13["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S13 -->|calls| T13
  S14["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:107"]
  T14["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:69"]
  S14 -->|calls| T14
  S15["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:107"]
  T15["property:UIButton::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:109"]
  S15 -->|calls| T15
  S16["method:UIButton::_jobs_loadingPlaceholderImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:143"]
  T16["method:UIImage::_jobs_transparentPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:151"]
  S16 -->|calls| T16
  S17["method:UIImage::_jobs_transparentPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:151"]
  T17["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S17 -->|calls| T17
  S18["method:UIButton::byTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:43"]
  T18["field:_JobsSoundBox::url<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:28"]
  S18 -->|calls| T18
  S19["method:UIButton::byTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:43"]
  T19["method:UIButton::_jobs_unbindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:151"]
  S19 -->|calls| T19
  S20["method:UIButton::byTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:43"]
  T20["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:127"]
  S20 -->|calls| T20
  S21["method:UIButton::byRemoveTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:83"]
  T21["method:UIButton::_jobs_unbindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:151"]
  S21 -->|calls| T21
  S22["method:UIButton::_jobs_onTapPlaySound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:100"]
  T22["method:VideoPlayer::playToView:<br/>Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:200"]
  S22 -->|calls| T22
  S23["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:127"]
  T23["method:UIButton::_jobs_onTapPlaySound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:100"]
  S23 -->|calls| T23
  S24["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:127"]
  T24["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:164"]
  S24 -->|calls| T24
  S25["property:UIButton::jobs_subtitleLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+字体颜色渐变.swift:36"]
  T25["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:26"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

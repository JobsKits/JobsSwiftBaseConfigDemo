# `calls 符号关系 - 043`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T1["method:UIButton::_jobs_loadingPlaceholderImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:146"]
  S1 -->|calls| T1
  S2["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T2["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S2 -->|calls| T2
  S3["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T3["method:UIButton::_jobs_isCurrentToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:53"]
  S3 -->|calls| T3
  S4["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T4["method:UIButton::_jobs_stopForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:66"]
  S4 -->|calls| T4
  S5["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T5["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  S5 -->|calls| T5
  S6["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T6["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S6 -->|calls| T6
  S7["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T7["method:UIButton::_jobs_isCurrentToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:53"]
  S7 -->|calls| T7
  S8["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T8["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  S8 -->|calls| T8
  S9["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T9["method:UIButton::_jobs_startForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:62"]
  S9 -->|calls| T9
  S10["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T10["method:UIButton::_jobs_sdBuildContext<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:253"]
  S10 -->|calls| T10
  S11["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T11["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:26"]
  S11 -->|calls| T11
  S12["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T12["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S12 -->|calls| T12
  S13["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T13["method:UIButton::_jobs_isCurrentToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:53"]
  S13 -->|calls| T13
  S14["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T14["method:UIButton::_jobs_stopForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:66"]
  S14 -->|calls| T14
  S15["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T15["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  S15 -->|calls| T15
  S16["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T16["method:UIButton::_jobs_stopForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:66"]
  S16 -->|calls| T16
  S17["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T17["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S17 -->|calls| T17
  S18["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T18["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  S18 -->|calls| T18
  S19["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T19["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  S19 -->|calls| T19
  S20["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T20["method:UIButton::_jobs_stopForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:66"]
  S20 -->|calls| T20
  S21["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T21["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  S21 -->|calls| T21
  S22["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T22["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S22 -->|calls| T22
  S23["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T23["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S23 -->|calls| T23
  S24["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T24["method:UIButton::_jobs_startBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:70"]
  S24 -->|calls| T24
  S25["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T25["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

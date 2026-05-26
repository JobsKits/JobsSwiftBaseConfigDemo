# `calls 符号关系 - 040`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T1["method:UIButton::_jobs_stopForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:66"]
  S1 -->|calls| T1
  S2["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T2["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  S2 -->|calls| T2
  S3["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T3["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S3 -->|calls| T3
  S4["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T4["method:UIButton::_jobs_isCurrentToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:53"]
  S4 -->|calls| T4
  S5["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T5["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  S5 -->|calls| T5
  S6["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T6["method:UIButton::_jobs_startForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:62"]
  S6 -->|calls| T6
  S7["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T7["method:UIButton::_jobs_kfUpsertDownsampleOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:232"]
  S7 -->|calls| T7
  S8["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T8["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S8 -->|calls| T8
  S9["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T9["method:UIButton::_jobs_isCurrentToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:53"]
  S9 -->|calls| T9
  S10["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T10["method:UIButton::_jobs_stopForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:66"]
  S10 -->|calls| T10
  S11["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T11["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  S11 -->|calls| T11
  S12["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T12["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:93"]
  S12 -->|calls| T12
  S13["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  T13["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:25"]
  S13 -->|calls| T13
  S14["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T14["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S14 -->|calls| T14
  S15["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T15["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S15 -->|calls| T15
  S16["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T16["method:UIButton::_jobs_startBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:70"]
  S16 -->|calls| T16
  S17["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T17["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S17 -->|calls| T17
  S18["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T18["method:UIButton::_jobs_stopBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:88"]
  S18 -->|calls| T18
  S19["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T19["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S19 -->|calls| T19
  S20["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T20["method:UIButton::_jobs_guessBackgroundTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:138"]
  S20 -->|calls| T20
  S21["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T21["method:UIButton::_jobs_kfUpsertDownsampleOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:232"]
  S21 -->|calls| T21
  S22["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T22["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S22 -->|calls| T22
  S23["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T23["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S23 -->|calls| T23
  S24["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T24["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S24 -->|calls| T24
  S25["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T25["method:UIButton::_jobs_stopBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:88"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

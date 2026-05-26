# `calls 符号关系 - 044`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T1["method:UIButton::_jobs_stopBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:88"]
  S1 -->|calls| T1
  S2["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T2["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S2 -->|calls| T2
  S3["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T3["method:UIButton::_jobs_guessBackgroundTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:138"]
  S3 -->|calls| T3
  S4["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T4["method:UIButton::_jobs_sdBuildContext<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:253"]
  S4 -->|calls| T4
  S5["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T5["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S5 -->|calls| T5
  S6["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T6["method:UIButton::_jobs_stopBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:88"]
  S6 -->|calls| T6
  S7["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T7["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S7 -->|calls| T7
  S8["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T8["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S8 -->|calls| T8
  S9["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T9["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S9 -->|calls| T9
  S10["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T10["method:UIButton::_jobs_stopBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:88"]
  S10 -->|calls| T10
  S11["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  T11["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S11 -->|calls| T11
  S12["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T12["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S12 -->|calls| T12
  S13["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T13["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S13 -->|calls| T13
  S14["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T14["method:UIButton::StateProxy::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1055"]
  S14 -->|calls| T14
  S15["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T15["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S15 -->|calls| T15
  S16["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T16["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S16 -->|calls| T16
  S17["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T17["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S17 -->|calls| T17
  S18["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T18["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S18 -->|calls| T18
  S19["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T19["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S19 -->|calls| T19
  S20["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T20["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S20 -->|calls| T20
  S21["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T21["method:UIButton::_sd_setBgTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:103"]
  S21 -->|calls| T21
  S22["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T22["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S22 -->|calls| T22
  S23["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T23["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S23 -->|calls| T23
  S24["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T24["method:UIButton::_sd_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:56"]
  S24 -->|calls| T24
  S25["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T25["method:UIButton::_sd_setPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:62"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

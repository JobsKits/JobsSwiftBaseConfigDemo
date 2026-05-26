# `calls 符号关系 - 041`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T1["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S1 -->|calls| T1
  S2["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T2["method:UIButton::_jobs_stopBackgroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:88"]
  S2 -->|calls| T2
  S3["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:305"]
  T3["method:UIButton::_jobs_forceSetBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:109"]
  S3 -->|calls| T3
  S4["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T4["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S4 -->|calls| T4
  S5["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T5["method:UIButton::StateProxy::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1055"]
  S5 -->|calls| T5
  S6["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T6["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S6 -->|calls| T6
  S7["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T7["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S7 -->|calls| T7
  S8["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T8["method:UIButton::_kf_setBgTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:65"]
  S8 -->|calls| T8
  S9["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T9["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S9 -->|calls| T9
  S10["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T10["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S10 -->|calls| T10
  S11["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T11["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S11 -->|calls| T11
  S12["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T12["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S12 -->|calls| T12
  S13["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T13["method:UIButton::_jobs_guessBackgroundTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:138"]
  S13 -->|calls| T13
  S14["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T14["method:UIButton::_jobs_kfUpsertDownsampleOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:232"]
  S14 -->|calls| T14
  S15["method:UIButton::kf_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:393"]
  T15["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S15 -->|calls| T15
  S16["method:UIButton::kf_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:469"]
  T16["method:UIButton::_kf_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:47"]
  S16 -->|calls| T16
  S17["method:UIButton::kf_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:469"]
  T17["method:UIButton::_kf_setPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:53"]
  S17 -->|calls| T17
  S18["method:UIButton::kf_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:469"]
  T18["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S18 -->|calls| T18
  S19["method:UIButton::kf_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:469"]
  T19["method:UIButton::_kf_setOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:71"]
  S19 -->|calls| T19
  S20["method:UIButton::kf_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:469"]
  T20["method:UIButton::_kf_setProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:77"]
  S20 -->|calls| T20
  S21["method:UIButton::kf_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:469"]
  T21["method:UIButton::_kf_setCompleted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:83"]
  S21 -->|calls| T21
  S22["method:UIButton::kf_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:469"]
  T22["method:UIButton::_kf_setTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:59"]
  S22 -->|calls| T22
  S23["method:UIButton::kf_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:469"]
  T23["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  S23 -->|calls| T23
  S24["method:UIButton::sd_imageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:112"]
  T24["method:UIButton::_sd_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:56"]
  S24 -->|calls| T24
  S25["method:UIButton::sd_imageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:117"]
  T25["method:UIButton::_sd_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:56"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

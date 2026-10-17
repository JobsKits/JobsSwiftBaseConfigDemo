# `calls 符号关系 - 091`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::kf_highlightedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:144"]
  T1["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:27"]
  S1 -->|calls| T1
  S2["method:UIButton::kf_disabledLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:151"]
  T2["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  S2 -->|calls| T2
  S3["method:UIButton::kf_disabledLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:151"]
  T3["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:27"]
  S3 -->|calls| T3
  S4["method:UIButton::kf_selectedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:157"]
  T4["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  S4 -->|calls| T4
  S5["method:UIButton::kf_selectedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:157"]
  T5["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:27"]
  S5 -->|calls| T5
  S6["method:UIButton::kf_focusedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:163"]
  T6["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  S6 -->|calls| T6
  S7["method:UIButton::kf_focusedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:163"]
  T7["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:27"]
  S7 -->|calls| T7
  S8["method:UIButton::kf_applicationLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:170"]
  T8["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  S8 -->|calls| T8
  S9["method:UIButton::kf_applicationLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:170"]
  T9["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:27"]
  S9 -->|calls| T9
  S10["method:UIButton::kf_reservedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:176"]
  T10["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  S10 -->|calls| T10
  S11["method:UIButton::kf_reservedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:176"]
  T11["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:27"]
  S11 -->|calls| T11
  S12["method:UIButton::kf_bgNormalLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:182"]
  T12["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:302"]
  S12 -->|calls| T12
  S13["method:UIButton::kf_bgHighlightedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:188"]
  T13["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:302"]
  S13 -->|calls| T13
  S14["method:UIButton::kf_bgDisabledLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:194"]
  T14["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:302"]
  S14 -->|calls| T14
  S15["method:UIButton::kf_bgSelectedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:200"]
  T15["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:302"]
  S15 -->|calls| T15
  S16["method:UIButton::kf_bgFocusedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:206"]
  T16["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:302"]
  S16 -->|calls| T16
  S17["method:UIButton::kf_bgApplicationLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:213"]
  T17["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:302"]
  S17 -->|calls| T17
  S18["method:UIButton::kf_bgReservedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:219"]
  T18["method:UIButton::_kf_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:302"]
  S18 -->|calls| T18
  S19["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  T19["method:UIButton::_jobs_nextToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:37"]
  S19 -->|calls| T19
  S20["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  T20["method:UIButton::_jobs_guessForegroundTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:123"]
  S20 -->|calls| T20
  S21["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  T21["method:UIButton::_jobs_loadingPlaceholderImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:143"]
  S21 -->|calls| T21
  S22["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  T22["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  S22 -->|calls| T22
  S23["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  T23["method:UIButton::_jobs_isCurrentToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:53"]
  S23 -->|calls| T23
  S24["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  T24["method:UIButton::_jobs_stopForegroundShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:66"]
  S24 -->|calls| T24
  S25["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  T25["method:UIButton::_jobs_forceSetForegroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

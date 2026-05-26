# `calls 符号关系 - 042`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::sd_imageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:117"]
  T1["method:UIButton::_sd_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:56"]
  S1 -->|calls| T1
  S2["method:UIButton::sd_placeholderImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:125"]
  T2["method:UIButton::_sd_setPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:62"]
  S2 -->|calls| T2
  S3["method:UIButton::sd_placeholderBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:130"]
  T3["method:UIButton::_sd_setBgPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:68"]
  S3 -->|calls| T3
  S4["method:UIButton::sd_options<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:135"]
  T4["method:UIButton::_sd_setOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:74"]
  S4 -->|calls| T4
  S5["method:UIButton::sd_context<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:140"]
  T5["method:UIButton::_sd_setContext<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:80"]
  S5 -->|calls| T5
  S6["method:UIButton::sd_progress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:145"]
  T6["method:UIButton::_sd_setProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:85"]
  S6 -->|calls| T6
  S7["method:UIButton::sd_completed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:150"]
  T7["method:UIButton::_sd_setCompleted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:91"]
  S7 -->|calls| T7
  S8["method:UIButton::sd_targetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:155"]
  T8["method:UIButton::_sd_setTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:97"]
  S8 -->|calls| T8
  S9["method:UIButton::sd_bgTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:160"]
  T9["method:UIButton::_sd_setBgTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:103"]
  S9 -->|calls| T9
  S10["method:UIButton::sd_normalLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:165"]
  T10["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  S10 -->|calls| T10
  S11["method:UIButton::sd_highlightedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:171"]
  T11["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  S11 -->|calls| T11
  S12["method:UIButton::sd_disabledLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:177"]
  T12["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  S12 -->|calls| T12
  S13["method:UIButton::sd_selectedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:183"]
  T13["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  S13 -->|calls| T13
  S14["method:UIButton::sd_focusedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:189"]
  T14["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  S14 -->|calls| T14
  S15["method:UIButton::sd_applicationLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:196"]
  T15["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  S15 -->|calls| T15
  S16["method:UIButton::sd_reservedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:202"]
  T16["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  S16 -->|calls| T16
  S17["method:UIButton::sd_bgNormalLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:208"]
  T17["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  S17 -->|calls| T17
  S18["method:UIButton::sd_bgHighlightedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:214"]
  T18["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  S18 -->|calls| T18
  S19["method:UIButton::sd_bgDisabledLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:220"]
  T19["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  S19 -->|calls| T19
  S20["method:UIButton::sd_bgSelectedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:226"]
  T20["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  S20 -->|calls| T20
  S21["method:UIButton::sd_bgFocusedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:232"]
  T21["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  S21 -->|calls| T21
  S22["method:UIButton::sd_bgApplicationLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:239"]
  T22["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  S22 -->|calls| T22
  S23["method:UIButton::sd_bgReservedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:245"]
  T23["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  S23 -->|calls| T23
  S24["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T24["method:UIButton::_jobs_nextToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:37"]
  S24 -->|calls| T24
  S25["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  T25["method:UIButton::_jobs_guessForegroundTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:125"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

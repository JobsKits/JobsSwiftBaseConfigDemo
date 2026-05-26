# `calls 符号关系 - 045`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T1["method:UIButton::_sd_setBgPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:68"]
  S1 -->|calls| T1
  S2["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T2["method:UIButton::_sd_setOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:74"]
  S2 -->|calls| T2
  S3["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T3["method:UIButton::_sd_setContext<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:80"]
  S3 -->|calls| T3
  S4["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T4["method:UIButton::_sd_setProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:85"]
  S4 -->|calls| T4
  S5["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T5["method:UIButton::_sd_setCompleted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:91"]
  S5 -->|calls| T5
  S6["method:UIButton::sd_cloneBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:437"]
  T6["method:UIButton::_sd_loadBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:363"]
  S6 -->|calls| T6
  S7["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T7["method:UIButton::_sd_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:56"]
  S7 -->|calls| T7
  S8["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T8["method:UIButton::_sd_setPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:62"]
  S8 -->|calls| T8
  S9["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T9["method:UIButton::_sd_setOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:74"]
  S9 -->|calls| T9
  S10["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T10["method:UIButton::_sd_setContext<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:80"]
  S10 -->|calls| T10
  S11["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T11["method:UIButton::_sd_setProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:85"]
  S11 -->|calls| T11
  S12["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T12["method:UIButton::_sd_setCompleted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:91"]
  S12 -->|calls| T12
  S13["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T13["method:UIButton::_sd_setTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:97"]
  S13 -->|calls| T13
  S14["method:UIButton::sd_cloneImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:505"]
  T14["method:UIButton::_sd_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:271"]
  S14 -->|calls| T14
  S15["method:UIButton::_setSubPack_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:77"]
  T15["method:UIButton::_ensureSubtitleHandler_noAttrInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:104"]
  S15 -->|calls| T15
  S16["method:UIButton::_setSubPack_attr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:96"]
  T16["method:UIButton::_ensureSubtitleHandler_noAttrInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:104"]
  S16 -->|calls| T16
  S17["method:UIButton::_ensureSubtitleHandler_noAttrInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:104"]
  T17["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S17 -->|calls| T17
  S18["method:UIButton::_ensureSubtitleHandler_noAttrInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:104"]
  T18["method:UIButton::StateProxy::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1055"]
  S18 -->|calls| T18
  S19["method:UIButton::_ensureSubtitleHandler_noAttrInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:104"]
  T19["method:UIButton::StateProxy::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1055"]
  S19 -->|calls| T19
  S20["method:UIButton::_legacy_applySubtitle_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:170"]
  T20["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S20 -->|calls| T20
  S21["method:UIButton::_legacy_applySubtitle_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:170"]
  T21["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S21 -->|calls| T21
  S22["method:UIButton::_legacy_applySubtitle_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:170"]
  T22["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S22 -->|calls| T22
  S23["method:UIButton::_legacy_applySubtitle_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:170"]
  T23["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S23 -->|calls| T23
  S24["method:UIButton::_legacy_applySubtitle_attr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:182"]
  T24["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S24 -->|calls| T24
  S25["method:UIButton::_legacy_applySubtitle_attr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:182"]
  T25["method:UIButton::StateProxy::attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1012"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

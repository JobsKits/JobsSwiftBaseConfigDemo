# `calls 符号关系 - 046`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::_legacy_applySubtitle_attr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:182"]
  T1["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S1 -->|calls| T1
  S2["method:UIButton::_legacy_applySubtitle_attr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:182"]
  T2["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S2 -->|calls| T2
  S3["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  T3["method:UIButton::_subPack_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:66"]
  S3 -->|calls| T3
  S4["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  T4["method:UIButton::_setSubPack_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:77"]
  S4 -->|calls| T4
  S5["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  T5["method:UIButton::_applySubtitleToConfigurationNow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:134"]
  S5 -->|calls| T5
  S6["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  T6["method:UIButton::_legacy_applySubtitle_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:170"]
  S6 -->|calls| T6
  S7["method:UIButton::bySubTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:225"]
  T7["method:UIButton::_subPack_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:66"]
  S7 -->|calls| T7
  S8["method:UIButton::bySubTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:225"]
  T8["method:UIButton::_setSubPack_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:77"]
  S8 -->|calls| T8
  S9["method:UIButton::bySubTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:225"]
  T9["method:UIButton::_applySubtitleToConfigurationNow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:134"]
  S9 -->|calls| T9
  S10["method:UIButton::bySubTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:233"]
  T10["method:UIButton::_subPack_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:66"]
  S10 -->|calls| T10
  S11["method:UIButton::bySubTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:233"]
  T11["method:UIButton::_setSubPack_noAttr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:77"]
  S11 -->|calls| T11
  S12["method:UIButton::bySubTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:233"]
  T12["method:UIButton::_applySubtitleToConfigurationNow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:134"]
  S12 -->|calls| T12
  S13["method:UIButton::byAttributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:241"]
  T13["method:UIButton::_subPack_attr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:85"]
  S13 -->|calls| T13
  S14["method:UIButton::byAttributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:241"]
  T14["method:UIButton::_setSubPack_attr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:96"]
  S14 -->|calls| T14
  S15["method:UIButton::byAttributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:241"]
  T15["method:UIButton::_applySubtitleToConfigurationNow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:134"]
  S15 -->|calls| T15
  S16["method:UIButton::byAttributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:241"]
  T16["method:UIButton::_legacy_applySubtitle_attr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:182"]
  S16 -->|calls| T16
  S17["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:25"]
  T17["method:UIButton::StateProxy::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1006"]
  S17 -->|calls| T17
  S18["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:25"]
  T18["method:UIButton::StateProxy::titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1018"]
  S18 -->|calls| T18
  S19["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:25"]
  T19["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S19 -->|calls| T19
  S20["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:25"]
  T20["method:UIButton::StateProxy::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1055"]
  S20 -->|calls| T20
  S21["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:63"]
  T21["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S21 -->|calls| T21
  S22["method:UIButton::cfgTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:72"]
  T22["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:63"]
  S22 -->|calls| T22
  S23["method:UIButton::cfgTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:75"]
  T23["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:63"]
  S23 -->|calls| T23
  S24["method:UIButton::cfgBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:78"]
  T24["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:63"]
  S24 -->|calls| T24
  S25["method:UIButton::cfgCorner<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:81"]
  T25["method:UIButton::cfg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:63"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

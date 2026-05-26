# `calls 符号关系 - 038`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UIButton::_ensureUnifiedUpdateHandlerInstalled::pickImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:944"]
  T1["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S1 -->|calls| T1
  S2["function:UIButton::_ensureUnifiedUpdateHandlerInstalled::pickImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:944"]
  T2["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S2 -->|calls| T2
  S3["function:UIButton::_ensureUnifiedUpdateHandlerInstalled::pickImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:944"]
  T3["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S3 -->|calls| T3
  S4["function:UIButton::_ensureUnifiedUpdateHandlerInstalled::pickImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:944"]
  T4["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S4 -->|calls| T4
  S5["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  T5["function:UIButton::_ensureUnifiedUpdateHandlerInstalled::pickImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:944"]
  S5 -->|calls| T5
  S6["method:UIButton::_ensureUnifiedUpdateHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:915"]
  T6["variable:p<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:62"]
  S6 -->|calls| T6
  S7["method:UIButton::StateProxy::backgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1043"]
  T7["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S7 -->|calls| T7
  S8["method:UIButton::StateProxy::backgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1043"]
  T8["method:UIButton::byConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:28"]
  S8 -->|calls| T8
  S9["method:UIButton::StateProxy::backgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1043"]
  T9["method:UIButton.Configuration::byBaseBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:124"]
  S9 -->|calls| T9
  S10["method:UIButton::StateProxy::backgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1043"]
  T10["method:UIButton::setBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+背景色兜底.swift:25"]
  S10 -->|calls| T10
  S11["method:UIButton::StateProxy::subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1061"]
  T11["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  S11 -->|calls| T11
  S12["method:UIButton::StateProxy::attributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1066"]
  T12["method:UIButton::byAttributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:241"]
  S12 -->|calls| T12
  S13["method:UIButton::StateProxy::subTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1071"]
  T13["method:UIButton::bySubTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:225"]
  S13 -->|calls| T13
  S14["method:UIButton::StateProxy::subTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1076"]
  T14["method:UIButton::bySubTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:233"]
  S14 -->|calls| T14
  S15["method:UIButton::kf_imageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:92"]
  T15["method:UIButton::_kf_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:47"]
  S15 -->|calls| T15
  S16["method:UIButton::kf_imageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:97"]
  T16["method:UIButton::_kf_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:47"]
  S16 -->|calls| T16
  S17["method:UIButton::kf_imageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:97"]
  T17["method:UIButton::_kf_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:47"]
  S17 -->|calls| T17
  S18["method:UIButton::kf_placeholderImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:105"]
  T18["method:UIButton::_kf_setPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:53"]
  S18 -->|calls| T18
  S19["method:UIButton::kf_targetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:110"]
  T19["method:UIButton::_kf_setTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:59"]
  S19 -->|calls| T19
  S20["method:UIButton::kf_bgTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:115"]
  T20["method:UIButton::_kf_setBgTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:65"]
  S20 -->|calls| T20
  S21["method:UIButton::kf_options<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:120"]
  T21["method:UIButton::_kf_setOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:71"]
  S21 -->|calls| T21
  S22["method:UIButton::kf_progress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:125"]
  T22["method:UIButton::_kf_setProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:77"]
  S22 -->|calls| T22
  S23["method:UIButton::kf_completed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:130"]
  T23["method:UIButton::_kf_setCompleted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:83"]
  S23 -->|calls| T23
  S24["method:UIButton::kf_normalLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:135"]
  T24["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:246"]
  S24 -->|calls| T24
  S25["method:UIButton::kf_normalLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:135"]
  T25["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

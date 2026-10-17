# `calls 符号关系 - 090`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:233"]
  T1["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:189"]
  S1 -->|calls| T1
  S2["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:233"]
  T2["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S2 -->|calls| T2
  S3["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:244"]
  T3["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S3 -->|calls| T3
  S4["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:15"]
  T4["method:ASEditableTextNode::indexOfAccessibilityElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:875"]
  S4 -->|calls| T4
  S5["method:String::boundingHeight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:38"]
  T5["method:JobsSwiftCalendar::boundingRect<br/>JobsByPods/JobsSwiftCalendar@Pods/Core/JobsSwiftCalendar/JobsSwiftCalendar.swift:171"]
  S5 -->|calls| T5
  S6["property:String::rnl<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:67"]
  T6["method:ASTextKitComponents::componentsWithAttributedSeedString:textContainerSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:78"]
  S6 -->|calls| T6
  S7["property:String::verticalized<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:71"]
  T7["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S7 -->|calls| T7
  S8["method:String::makeURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:80"]
  T8["method:String::percentEncodedURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:94"]
  S8 -->|calls| T8
  S9["method:String::makeURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:80"]
  T9["method:String::percentEncodedURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:94"]
  S9 -->|calls| T9
  S10["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:117"]
  T10["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:70"]
  S10 -->|calls| T10
  S11["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:117"]
  T11["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S11 -->|calls| T11
  S12["method:UIBarButtonItem::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:24"]
  T12["method:UIBarButtonItem::_jobs_handleAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:44"]
  S12 -->|calls| T12
  S13["method:UIBarButtonItem::fixed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:87"]
  T13["method:UIBarButtonItem::byWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:105"]
  S13 -->|calls| T13
  S14["method:UIButton::kf_imageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:93"]
  T14["method:UIButton::_kf_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:48"]
  S14 -->|calls| T14
  S15["method:UIButton::kf_imageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:98"]
  T15["method:UIButton::_kf_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:48"]
  S15 -->|calls| T15
  S16["method:UIButton::kf_imageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:98"]
  T16["method:UIButton::_kf_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:48"]
  S16 -->|calls| T16
  S17["method:UIButton::kf_placeholderImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:106"]
  T17["method:UIButton::_kf_setPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:54"]
  S17 -->|calls| T17
  S18["method:UIButton::kf_targetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:111"]
  T18["method:UIButton::_kf_setTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:60"]
  S18 -->|calls| T18
  S19["method:UIButton::kf_bgTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:116"]
  T19["method:UIButton::_kf_setBgTargetSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:66"]
  S19 -->|calls| T19
  S20["method:UIButton::kf_options<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:121"]
  T20["method:UIButton::_kf_setOptions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:72"]
  S20 -->|calls| T20
  S21["method:UIButton::kf_progress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:126"]
  T21["method:UIButton::_kf_setProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:78"]
  S21 -->|calls| T21
  S22["method:UIButton::kf_completed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:131"]
  T22["method:UIButton::_kf_setCompleted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:84"]
  S22 -->|calls| T22
  S23["method:UIButton::kf_normalLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:136"]
  T23["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  S23 -->|calls| T23
  S24["method:UIButton::kf_normalLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:136"]
  T24["method:UIButton::byAdoptConfigurationIfAvailable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+UIButtonConfiguration.swift:27"]
  S24 -->|calls| T24
  S25["method:UIButton::kf_highlightedLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:144"]
  T25["method:UIButton::_kf_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Kingfisher.swift:242"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

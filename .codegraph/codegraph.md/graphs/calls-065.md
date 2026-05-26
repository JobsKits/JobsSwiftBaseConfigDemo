# `calls 符号关系 - 065`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIFont::SFArabic::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:26"]
  T1["method:UIFont::SFArabic::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:30"]
  S1 -->|calls| T1
  S2["method:UIFont::SFProText::Ultralight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:19"]
  T2["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S2 -->|calls| T2
  S3["method:UIFont::SFProText::Thin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:23"]
  T3["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S3 -->|calls| T3
  S4["method:UIFont::SFProText::Light<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:27"]
  T4["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S4 -->|calls| T4
  S5["method:UIFont::SFProText::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:31"]
  T5["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S5 -->|calls| T5
  S6["method:UIFont::SFProText::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:35"]
  T6["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S6 -->|calls| T6
  S7["method:UIFont::SFProText::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:39"]
  T7["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S7 -->|calls| T7
  S8["method:UIFont::SFProText::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:43"]
  T8["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S8 -->|calls| T8
  S9["method:UIFont::SFProDisplay::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:83"]
  T9["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S9 -->|calls| T9
  S10["method:UIFont::SFProDisplay::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:87"]
  T10["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S10 -->|calls| T10
  S11["method:UIFont::SFProDisplay::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:91"]
  T11["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S11 -->|calls| T11
  S12["method:UIFont::SFProDisplay::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:95"]
  T12["method:UIFont::SFProDisplay::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:117"]
  S12 -->|calls| T12
  S13["method:UIFont::SourceSansPro::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:19"]
  T13["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S13 -->|calls| T13
  S14["method:UIFont::SourceSansPro::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:23"]
  T14["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S14 -->|calls| T14
  S15["method:UIFont::SourceSansPro::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:27"]
  T15["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S15 -->|calls| T15
  S16["method:UIFont::SourceSansPro::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:31"]
  T16["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S16 -->|calls| T16
  S17["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:73"]
  T17["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  S17 -->|calls| T17
  S18["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  T18["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  S18 -->|calls| T18
  S19["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:75"]
  T19["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  S19 -->|calls| T19
  S20["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  T20["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S20 -->|calls| T20
  S21["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  T21["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:92"]
  S21 -->|calls| T21
  S22["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  T22["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  S22 -->|calls| T22
  S23["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  T23["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:108"]
  S23 -->|calls| T23
  S24["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  T24["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:116"]
  S24 -->|calls| T24
  S25["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:92"]
  T25["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:73"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

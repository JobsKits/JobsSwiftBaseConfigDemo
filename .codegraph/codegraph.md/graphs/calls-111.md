# `calls 符号关系 - 111`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIFont::Roboto::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:22"]
  T1["method:UIFont::Roboto::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:25"]
  S1 -->|calls| T1
  S2["method:UIFont::SFArabic::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:16"]
  T2["method:UIFont::SFArabic::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:25"]
  S2 -->|calls| T2
  S3["method:UIFont::SFArabic::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:19"]
  T3["method:UIFont::SFArabic::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:25"]
  S3 -->|calls| T3
  S4["method:UIFont::SFArabic::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:22"]
  T4["method:UIFont::SFArabic::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:25"]
  S4 -->|calls| T4
  S5["method:UIFont::SFProText::Ultralight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:17"]
  T5["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:67"]
  S5 -->|calls| T5
  S6["method:UIFont::SFProText::Thin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:20"]
  T6["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:67"]
  S6 -->|calls| T6
  S7["method:UIFont::SFProText::Light<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:23"]
  T7["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:67"]
  S7 -->|calls| T7
  S8["method:UIFont::SFProText::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:26"]
  T8["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:67"]
  S8 -->|calls| T8
  S9["method:UIFont::SFProText::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:29"]
  T9["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:67"]
  S9 -->|calls| T9
  S10["method:UIFont::SFProText::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:32"]
  T10["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:67"]
  S10 -->|calls| T10
  S11["method:UIFont::SFProText::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:35"]
  T11["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:67"]
  S11 -->|calls| T11
  S12["method:UIFont::SFProDisplay::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:79"]
  T12["method:UIFont::SFProDisplay::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:111"]
  S12 -->|calls| T12
  S13["method:UIFont::SFProDisplay::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:82"]
  T13["method:UIFont::SFProDisplay::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:111"]
  S13 -->|calls| T13
  S14["method:UIFont::SFProDisplay::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:85"]
  T14["method:UIFont::SFProDisplay::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:111"]
  S14 -->|calls| T14
  S15["method:UIFont::SFProDisplay::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:88"]
  T15["method:UIFont::SFProDisplay::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:111"]
  S15 -->|calls| T15
  S16["method:UIFont::SourceSansPro::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:16"]
  T16["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:28"]
  S16 -->|calls| T16
  S17["method:UIFont::SourceSansPro::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:19"]
  T17["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:28"]
  S17 -->|calls| T17
  S18["method:UIFont::SourceSansPro::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:22"]
  T18["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:28"]
  S18 -->|calls| T18
  S19["method:UIFont::SourceSansPro::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:25"]
  T19["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:28"]
  S19 -->|calls| T19
  S20["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:70"]
  T20["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S20 -->|calls| T20
  S21["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:71"]
  T21["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S21 -->|calls| T21
  S22["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:72"]
  T22["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S22 -->|calls| T22
  S23["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  T23["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:58"]
  S23 -->|calls| T23
  S24["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  T24["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:90"]
  S24 -->|calls| T24
  S25["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  T25["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

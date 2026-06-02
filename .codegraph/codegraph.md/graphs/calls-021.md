# `calls 符号关系 - 021`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIFont::PingFangSC::Thin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:23"]
  T1["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S1 -->|calls| T1
  S2["method:UIFont::PingFangSC::Light<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:27"]
  T2["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S2 -->|calls| T2
  S3["method:UIFont::PingFangSC::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:31"]
  T3["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S3 -->|calls| T3
  S4["method:UIFont::PingFangSC::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:35"]
  T4["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S4 -->|calls| T4
  S5["method:UIFont::PingFangSC::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:39"]
  T5["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S5 -->|calls| T5
  S6["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:18"]
  T6["method:UIFont::Roboto::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:30"]
  S6 -->|calls| T6
  S7["method:UIFont::Roboto::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:22"]
  T7["method:UIFont::Roboto::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:30"]
  S7 -->|calls| T7
  S8["method:UIFont::Roboto::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:26"]
  T8["method:UIFont::Roboto::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:30"]
  S8 -->|calls| T8
  S9["method:UIFont::SFArabic::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:18"]
  T9["method:UIFont::SFArabic::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:30"]
  S9 -->|calls| T9
  S10["method:UIFont::SFArabic::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:22"]
  T10["method:UIFont::SFArabic::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:30"]
  S10 -->|calls| T10
  S11["method:UIFont::SFArabic::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:26"]
  T11["method:UIFont::SFArabic::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:30"]
  S11 -->|calls| T11
  S12["method:UIFont::SFProText::Ultralight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:19"]
  T12["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S12 -->|calls| T12
  S13["method:UIFont::SFProText::Thin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:23"]
  T13["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S13 -->|calls| T13
  S14["method:UIFont::SFProText::Light<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:27"]
  T14["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S14 -->|calls| T14
  S15["method:UIFont::SFProText::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:31"]
  T15["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S15 -->|calls| T15
  S16["method:UIFont::SFProText::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:35"]
  T16["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S16 -->|calls| T16
  S17["method:UIFont::SFProText::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:39"]
  T17["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S17 -->|calls| T17
  S18["method:UIFont::SFProText::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:43"]
  T18["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S18 -->|calls| T18
  S19["method:UIFont::SFProDisplay::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:83"]
  T19["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S19 -->|calls| T19
  S20["method:UIFont::SFProDisplay::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:87"]
  T20["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S20 -->|calls| T20
  S21["method:UIFont::SFProDisplay::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:91"]
  T21["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S21 -->|calls| T21
  S22["method:UIFont::SFProDisplay::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:95"]
  T22["method:UIFont::SFProDisplay::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:117"]
  S22 -->|calls| T22
  S23["method:UIFont::SourceSansPro::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:19"]
  T23["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S23 -->|calls| T23
  S24["method:UIFont::SourceSansPro::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:23"]
  T24["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S24 -->|calls| T24
  S25["method:UIFont::SourceSansPro::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:27"]
  T25["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

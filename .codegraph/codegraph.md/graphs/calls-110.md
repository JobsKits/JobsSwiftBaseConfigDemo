# `calls 符号关系 - 110`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:16"]
  T1["method:UIFont::SFArabic::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:16"]
  S1 -->|calls| T1
  S2["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:16"]
  T2["method:UIFont::Montserrat::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:80"]
  S2 -->|calls| T2
  S3["method:UIFont::Montserrat::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:32"]
  T3["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:58"]
  S3 -->|calls| T3
  S4["method:UIFont::Montserrat::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:32"]
  T4["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:16"]
  S4 -->|calls| T4
  S5["method:UIFont::Montserrat::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:32"]
  T5["method:UIFont::Mitr::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:16"]
  S5 -->|calls| T5
  S6["method:UIFont::Montserrat::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:32"]
  T6["method:UIFont::SFArabic::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:16"]
  S6 -->|calls| T6
  S7["method:UIFont::Montserrat::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:32"]
  T7["method:UIFont::Montserrat::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:80"]
  S7 -->|calls| T7
  S8["method:UIFont::Montserrat::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:48"]
  T8["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:58"]
  S8 -->|calls| T8
  S9["method:UIFont::Montserrat::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:48"]
  T9["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:16"]
  S9 -->|calls| T9
  S10["method:UIFont::Montserrat::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:48"]
  T10["method:UIFont::Mitr::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:16"]
  S10 -->|calls| T10
  S11["method:UIFont::Montserrat::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:48"]
  T11["method:UIFont::SFArabic::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:16"]
  S11 -->|calls| T11
  S12["method:UIFont::Montserrat::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:48"]
  T12["method:UIFont::Montserrat::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:80"]
  S12 -->|calls| T12
  S13["method:UIFont::Montserrat::SemiboldItalic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:64"]
  T13["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:58"]
  S13 -->|calls| T13
  S14["method:UIFont::Montserrat::SemiboldItalic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:64"]
  T14["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:16"]
  S14 -->|calls| T14
  S15["method:UIFont::Montserrat::SemiboldItalic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:64"]
  T15["method:UIFont::Mitr::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:16"]
  S15 -->|calls| T15
  S16["method:UIFont::Montserrat::SemiboldItalic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:64"]
  T16["method:UIFont::SFArabic::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:16"]
  S16 -->|calls| T16
  S17["method:UIFont::Montserrat::SemiboldItalic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:64"]
  T17["method:UIFont::Montserrat::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:80"]
  S17 -->|calls| T17
  S18["method:UIFont::PingFangSC::Ultralight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:17"]
  T18["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:60"]
  S18 -->|calls| T18
  S19["method:UIFont::PingFangSC::Thin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:20"]
  T19["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:60"]
  S19 -->|calls| T19
  S20["method:UIFont::PingFangSC::Light<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:23"]
  T20["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:60"]
  S20 -->|calls| T20
  S21["method:UIFont::PingFangSC::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:26"]
  T21["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:60"]
  S21 -->|calls| T21
  S22["method:UIFont::PingFangSC::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:29"]
  T22["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:60"]
  S22 -->|calls| T22
  S23["method:UIFont::PingFangSC::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:32"]
  T23["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:60"]
  S23 -->|calls| T23
  S24["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:16"]
  T24["method:UIFont::Roboto::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:25"]
  S24 -->|calls| T24
  S25["method:UIFont::Roboto::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:19"]
  T25["method:UIFont::Roboto::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIFont::Montserrat::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:45"]
  T1["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  S1 -->|calls| T1
  S2["method:UIFont::Montserrat::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:45"]
  T2["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  S2 -->|calls| T2
  S3["method:UIFont::Montserrat::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:45"]
  T3["method:UIFont::Montserrat::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:71"]
  S3 -->|calls| T3
  S4["method:UIFont::Montserrat::SemiboldItalic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:58"]
  T4["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S4 -->|calls| T4
  S5["method:UIFont::Montserrat::SemiboldItalic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:58"]
  T5["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  S5 -->|calls| T5
  S6["method:UIFont::Montserrat::SemiboldItalic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:58"]
  T6["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  S6 -->|calls| T6
  S7["method:UIFont::Montserrat::SemiboldItalic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:58"]
  T7["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  S7 -->|calls| T7
  S8["method:UIFont::Montserrat::SemiboldItalic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:58"]
  T8["method:UIFont::Montserrat::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:71"]
  S8 -->|calls| T8
  S9["method:UIFont::PingFangSC::Ultralight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:19"]
  T9["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S9 -->|calls| T9
  S10["method:UIFont::PingFangSC::Thin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:23"]
  T10["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S10 -->|calls| T10
  S11["method:UIFont::PingFangSC::Light<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:27"]
  T11["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S11 -->|calls| T11
  S12["method:UIFont::PingFangSC::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:31"]
  T12["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S12 -->|calls| T12
  S13["method:UIFont::PingFangSC::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:35"]
  T13["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S13 -->|calls| T13
  S14["method:UIFont::PingFangSC::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:39"]
  T14["method:UIFont::PingFangSC::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:62"]
  S14 -->|calls| T14
  S15["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:18"]
  T15["method:UIFont::Roboto::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:30"]
  S15 -->|calls| T15
  S16["method:UIFont::Roboto::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:22"]
  T16["method:UIFont::Roboto::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:30"]
  S16 -->|calls| T16
  S17["method:UIFont::Roboto::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:26"]
  T17["method:UIFont::Roboto::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:30"]
  S17 -->|calls| T17
  S18["method:UIFont::SFProText::Ultralight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:19"]
  T18["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S18 -->|calls| T18
  S19["method:UIFont::SFProText::Thin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:23"]
  T19["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S19 -->|calls| T19
  S20["method:UIFont::SFProText::Light<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:27"]
  T20["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S20 -->|calls| T20
  S21["method:UIFont::SFProText::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:31"]
  T21["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S21 -->|calls| T21
  S22["method:UIFont::SFProText::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:35"]
  T22["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S22 -->|calls| T22
  S23["method:UIFont::SFProText::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:39"]
  T23["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S23 -->|calls| T23
  S24["method:UIFont::SFProText::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:43"]
  T24["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S24 -->|calls| T24
  S25["method:UIFont::SFProDisplay::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:83"]
  T25["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

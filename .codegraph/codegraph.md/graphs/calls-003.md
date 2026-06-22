# `calls 符号关系 - 003`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:17"]
  T1["method:String::svgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:37"]
  S1 -->|calls| T1
  S2["method:String::svg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:28"]
  T2["method:String::svgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:37"]
  S2 -->|calls| T2
  S3["method:UIFont::DINAlternate::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:18"]
  T3["method:UIFont::DINAlternate::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:22"]
  S3 -->|calls| T3
  S4["method:UIFont::DINPro::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:30"]
  T4["method:UIFont::DINPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:38"]
  S4 -->|calls| T4
  S5["method:UIFont::DINPro::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:34"]
  T5["method:UIFont::DINPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:38"]
  S5 -->|calls| T5
  S6["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T6["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S6 -->|calls| T6
  S7["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T7["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  S7 -->|calls| T7
  S8["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T8["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  S8 -->|calls| T8
  S9["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T9["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  S9 -->|calls| T9
  S10["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T10["method:UIFont::DSDigital::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:32"]
  S10 -->|calls| T10
  S11["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  T11["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S11 -->|calls| T11
  S12["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  T12["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  S12 -->|calls| T12
  S13["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  T13["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  S13 -->|calls| T13
  S14["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  T14["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  S14 -->|calls| T14
  S15["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  T15["method:UIFont::FZZCHJW::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:32"]
  S15 -->|calls| T15
  S16["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  T16["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S16 -->|calls| T16
  S17["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  T17["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  S17 -->|calls| T17
  S18["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  T18["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  S18 -->|calls| T18
  S19["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  T19["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  S19 -->|calls| T19
  S20["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  T20["method:UIFont::HYNuoMiTuanW::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:31"]
  S20 -->|calls| T20
  S21["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  T21["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S21 -->|calls| T21
  S22["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  T22["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  S22 -->|calls| T22
  S23["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  T23["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  S23 -->|calls| T23
  S24["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  T24["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  S24 -->|calls| T24
  S25["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:19"]
  T25["method:UIFont::Montserrat::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

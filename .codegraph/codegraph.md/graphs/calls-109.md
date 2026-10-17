# `calls 符号关系 - 109`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_JobsClosureWrapper::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl.swift:23"]
  T1["field:_JobsClosureWrapper::closure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl.swift:17"]
  S1 -->|calls| T1
  S2["method:UIFont::DINAlternate::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:16"]
  T2["method:UIFont::DINAlternate::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:19"]
  S2 -->|calls| T2
  S3["method:UIFont::DINPro::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:27"]
  T3["method:UIFont::DINPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:33"]
  S3 -->|calls| T3
  S4["method:UIFont::DINPro::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:30"]
  T4["method:UIFont::DINPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:33"]
  S4 -->|calls| T4
  S5["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:16"]
  T5["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:58"]
  S5 -->|calls| T5
  S6["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:16"]
  T6["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:16"]
  S6 -->|calls| T6
  S7["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:16"]
  T7["method:UIFont::Mitr::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:16"]
  S7 -->|calls| T7
  S8["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:16"]
  T8["method:UIFont::SFArabic::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:16"]
  S8 -->|calls| T8
  S9["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:16"]
  T9["method:UIFont::DSDigital::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:32"]
  S9 -->|calls| T9
  S10["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:16"]
  T10["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:58"]
  S10 -->|calls| T10
  S11["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:16"]
  T11["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:16"]
  S11 -->|calls| T11
  S12["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:16"]
  T12["method:UIFont::Mitr::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:16"]
  S12 -->|calls| T12
  S13["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:16"]
  T13["method:UIFont::SFArabic::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:16"]
  S13 -->|calls| T13
  S14["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:16"]
  T14["method:UIFont::FZZCHJW::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:32"]
  S14 -->|calls| T14
  S15["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:16"]
  T15["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:58"]
  S15 -->|calls| T15
  S16["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:16"]
  T16["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:16"]
  S16 -->|calls| T16
  S17["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:16"]
  T17["method:UIFont::Mitr::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:16"]
  S17 -->|calls| T17
  S18["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:16"]
  T18["method:UIFont::SFArabic::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:16"]
  S18 -->|calls| T18
  S19["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:16"]
  T19["method:UIFont::HYNuoMiTuanW::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:32"]
  S19 -->|calls| T19
  S20["method:UIFont::Mitr::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:16"]
  T20["method:UIFont::Mitr::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:25"]
  S20 -->|calls| T20
  S21["method:UIFont::Mitr::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:19"]
  T21["method:UIFont::Mitr::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:25"]
  S21 -->|calls| T21
  S22["method:UIFont::Mitr::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:22"]
  T22["method:UIFont::Mitr::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:25"]
  S22 -->|calls| T22
  S23["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:16"]
  T23["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:58"]
  S23 -->|calls| T23
  S24["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:16"]
  T24["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:16"]
  S24 -->|calls| T24
  S25["method:UIFont::Montserrat::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Montserrat.swift:16"]
  T25["method:UIFont::Mitr::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:16"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 029`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIListContentConfiguration::byTextLineBreakMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:193"]
  T1["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S1 -->|calls| T1
  S2["method:UIListContentConfiguration::byTextLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:198"]
  T2["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S2 -->|calls| T2
  S3["method:UIListContentConfiguration::byTextAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:203"]
  T3["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S3 -->|calls| T3
  S4["method:UIListContentConfiguration::byTextAllowsDefaultTightening<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:211"]
  T4["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S4 -->|calls| T4
  S5["method:UIListContentConfiguration::byTextAdjustsForContentSizeCategory<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:216"]
  T5["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S5 -->|calls| T5
  S6["method:UIListContentConfiguration::byTextTransform<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:221"]
  T6["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S6 -->|calls| T6
  S7["method:UIListContentConfiguration::byTextShowsExpansionWhenTruncated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:227"]
  T7["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S7 -->|calls| T7
  S8["method:UIListContentConfiguration::bySecondaryFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:235"]
  T8["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S8 -->|calls| T8
  S9["method:UIListContentConfiguration::bySecondaryColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:240"]
  T9["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S9 -->|calls| T9
  S10["method:UIListContentConfiguration::bySecondaryColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:245"]
  T10["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S10 -->|calls| T10
  S11["method:UIListContentConfiguration::bySecondaryAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:250"]
  T11["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S11 -->|calls| T11
  S12["method:UIListContentConfiguration::bySecondaryLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:255"]
  T12["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S12 -->|calls| T12
  S13["method:UIListContentConfiguration::bySecondaryTransform<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:260"]
  T13["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S13 -->|calls| T13
  S14["method:UIListContentConfiguration::byPreferredSymbolConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:265"]
  T14["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S14 -->|calls| T14
  S15["method:UIListContentConfiguration::byPreferredSymbol<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:270"]
  T15["method:JobsText::applying<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:108"]
  S15 -->|calls| T15
  S16["method:UIListContentConfiguration::byPreferredSymbol<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:270"]
  T16["method:UIListContentConfiguration::byPreferredSymbolConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:265"]
  S16 -->|calls| T16
  S17["method:UIListContentConfiguration::byTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:285"]
  T17["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S17 -->|calls| T17
  S18["method:UIListContentConfiguration::byTintColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:290"]
  T18["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S18 -->|calls| T18
  S19["method:UIListContentConfiguration::byImageCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:295"]
  T19["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S19 -->|calls| T19
  S20["method:UIListContentConfiguration::byImageMaximumSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:300"]
  T20["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S20 -->|calls| T20
  S21["method:UIListContentConfiguration::byImageReservedLayoutSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:305"]
  T21["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S21 -->|calls| T21
  S22["method:UIListContentConfiguration::byImageIgnoresInvertColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:310"]
  T22["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S22 -->|calls| T22
  S23["method:UIListContentConfiguration::byImageStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:315"]
  T23["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S23 -->|calls| T23
  S24["method:UIListContentConfiguration::byImageStrokeColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:321"]
  T24["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S24 -->|calls| T24
  S25["method:UIListContentConfiguration::byImageStrokeWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:327"]
  T25["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

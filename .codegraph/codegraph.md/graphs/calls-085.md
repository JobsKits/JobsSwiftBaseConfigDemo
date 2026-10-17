# `calls 符号关系 - 085`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:190"]
  T1["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S1 -->|calls| T1
  S2["method:UIListContentConfiguration::byTextLineBreakMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:195"]
  T2["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S2 -->|calls| T2
  S3["method:UIListContentConfiguration::byTextLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:200"]
  T3["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S3 -->|calls| T3
  S4["method:UIListContentConfiguration::byTextAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:205"]
  T4["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S4 -->|calls| T4
  S5["method:UIListContentConfiguration::byTextAllowsDefaultTightening<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:213"]
  T5["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S5 -->|calls| T5
  S6["method:UIListContentConfiguration::byTextAdjustsForContentSizeCategory<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:218"]
  T6["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S6 -->|calls| T6
  S7["method:UIListContentConfiguration::byTextTransform<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:223"]
  T7["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S7 -->|calls| T7
  S8["method:UIListContentConfiguration::byTextShowsExpansionWhenTruncated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:229"]
  T8["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S8 -->|calls| T8
  S9["method:UIListContentConfiguration::bySecondaryFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:237"]
  T9["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S9 -->|calls| T9
  S10["method:UIListContentConfiguration::bySecondaryColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:242"]
  T10["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S10 -->|calls| T10
  S11["method:UIListContentConfiguration::bySecondaryColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:247"]
  T11["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S11 -->|calls| T11
  S12["method:UIListContentConfiguration::bySecondaryAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:252"]
  T12["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S12 -->|calls| T12
  S13["method:UIListContentConfiguration::bySecondaryLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:257"]
  T13["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S13 -->|calls| T13
  S14["method:UIListContentConfiguration::bySecondaryLineBreakMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:262"]
  T14["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S14 -->|calls| T14
  S15["method:UIListContentConfiguration::bySecondaryTransform<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:267"]
  T15["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S15 -->|calls| T15
  S16["method:UIListContentConfiguration::byPreferredSymbolConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:272"]
  T16["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S16 -->|calls| T16
  S17["method:UIListContentConfiguration::byPreferredSymbol<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:277"]
  T17["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S17 -->|calls| T17
  S18["method:UIListContentConfiguration::byPreferredSymbol<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:277"]
  T18["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S18 -->|calls| T18
  S19["method:UIListContentConfiguration::byPreferredSymbol<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:277"]
  T19["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S19 -->|calls| T19
  S20["method:UIListContentConfiguration::byPreferredSymbol<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:277"]
  T20["method:JobsText::applying<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:108"]
  S20 -->|calls| T20
  S21["method:UIListContentConfiguration::byPreferredSymbol<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:277"]
  T21["method:UIListContentConfiguration::byPreferredSymbolConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:272"]
  S21 -->|calls| T21
  S22["method:UIListContentConfiguration::byTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:291"]
  T22["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S22 -->|calls| T22
  S23["method:UIListContentConfiguration::byTintColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:296"]
  T23["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S23 -->|calls| T23
  S24["method:UIListContentConfiguration::byImageCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:301"]
  T24["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S24 -->|calls| T24
  S25["method:UIListContentConfiguration::byImageMaximumSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:306"]
  T25["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

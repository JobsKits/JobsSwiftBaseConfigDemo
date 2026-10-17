# `calls 符号关系 - 084`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIBarItem::byMergeTitleTextAttributes<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarItem.swift:121"]
  T1["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S1 -->|calls| T1
  S2["method:UIBarItem::byCopyTitleTextAttributes<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarItem.swift:131"]
  T2["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S2 -->|calls| T2
  S3["method:AttributeContainer::byTextItemTag<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:183"]
  T3["method:AttributeContainer::byTextItemTag<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:183"]
  S3 -->|calls| T3
  S4["method:AttributeContainer::byTextItemTag<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:183"]
  T4["method:AttributeContainer::byTextItemTag<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:183"]
  S4 -->|calls| T4
  S5["method:AttributeContainer::byAdaptiveImageGlyph<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:207"]
  T5["method:AttributeContainer::byAdaptiveImageGlyph<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:207"]
  S5 -->|calls| T5
  S6["method:AttributeContainer::byAdaptiveImageGlyph<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:207"]
  T6["method:AttributeContainer::byAdaptiveImageGlyph<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:207"]
  S6 -->|calls| T6
  S7["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  T7["function:body<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S7 -->|calls| T7
  S8["method:UIListContentConfiguration::jobsCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:50"]
  T8["method:ASCollectionNode::cellForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:952"]
  S8 -->|calls| T8
  S9["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:99"]
  T9["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S9 -->|calls| T9
  S10["method:UIListContentConfiguration::byAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:104"]
  T10["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S10 -->|calls| T10
  S11["method:UIListContentConfiguration::bySecondaryText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:109"]
  T11["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S11 -->|calls| T11
  S12["method:UIListContentConfiguration::bySecondaryAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:114"]
  T12["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S12 -->|calls| T12
  S13["method:UIListContentConfiguration::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:119"]
  T13["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S13 -->|calls| T13
  S14["method:UIListContentConfiguration::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:124"]
  T14["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S14 -->|calls| T14
  S15["method:UIListContentConfiguration::byAxesPreservingSuperviewLayoutMargins<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:129"]
  T15["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S15 -->|calls| T15
  S16["method:UIListContentConfiguration::byDirectionalLayoutMargins<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:134"]
  T16["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S16 -->|calls| T16
  S17["method:UIListContentConfiguration::byLayoutMargins<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:139"]
  T17["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S17 -->|calls| T17
  S18["method:UIListContentConfiguration::byPrefersSideBySideTextAndSecondaryText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:149"]
  T18["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S18 -->|calls| T18
  S19["method:UIListContentConfiguration::byImageToTextPadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:154"]
  T19["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S19 -->|calls| T19
  S20["method:UIListContentConfiguration::byPrimarySecondaryHorizontalPadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:159"]
  T20["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S20 -->|calls| T20
  S21["method:UIListContentConfiguration::byPrimarySecondaryVerticalPadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:164"]
  T21["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S21 -->|calls| T21
  S22["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  T22["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S22 -->|calls| T22
  S23["method:UIListContentConfiguration::byTextFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:175"]
  T23["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S23 -->|calls| T23
  S24["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  T24["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S24 -->|calls| T24
  S25["method:UIListContentConfiguration::byTextColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:185"]
  T25["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

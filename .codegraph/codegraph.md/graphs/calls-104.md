# `calls 符号关系 - 104`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:71"]
  T1["property:UIButton::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:43"]
  S1 -->|calls| T1
  S2["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:71"]
  T2["method:ASButtonNode::attributedTitleForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:333"]
  S2 -->|calls| T2
  S3["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:71"]
  T3["property:UIButton::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:43"]
  S3 -->|calls| T3
  S4["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:71"]
  T4["method:ASButtonNode::attributedTitleForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:333"]
  S4 -->|calls| T4
  S5["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:71"]
  T5["method:ASEditableTextNode::indexOfAccessibilityElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:875"]
  S5 -->|calls| T5
  S6["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:71"]
  T6["method:ASEditableTextNode::indexOfAccessibilityElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:875"]
  S6 -->|calls| T6
  S7["property:UIButton::foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:97"]
  T7["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:101"]
  S7 -->|calls| T7
  S8["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:101"]
  T8["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S8 -->|calls| T8
  S9["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:101"]
  T9["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S9 -->|calls| T9
  S10["property:UIButton::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:109"]
  T10["method:UIButton::jobs_backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:113"]
  S10 -->|calls| T10
  S11["method:UIButton::jobs_backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:113"]
  T11["property:UIButton::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:109"]
  S11 -->|calls| T11
  S12["method:UIButton::jobs_backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:113"]
  T12["property:UIButton::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:109"]
  S12 -->|calls| T12
  S13["method:UIButton::jobs_titleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:125"]
  T13["method:UIButton::jobs_attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:57"]
  S13 -->|calls| T13
  S14["method:UIButton::jobs_dslTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:137"]
  T14["property:UIButton::_titleFontDict<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:937"]
  S14 -->|calls| T14
  S15["method:UIButton::jobs_dslTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:137"]
  T15["property:UIButton::_titleFontDict<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:937"]
  S15 -->|calls| T15
  S16["method:UIButton::jobs_titleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:142"]
  T16["method:UIButton::jobs_dslTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:137"]
  S16 -->|calls| T16
  S17["method:UIButton::jobs_titleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:142"]
  T17["method:UIButton::jobs_dslTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:137"]
  S17 -->|calls| T17
  S18["method:UIButton::jobs_titleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:142"]
  T18["method:ASButtonNode::attributedTitleForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:333"]
  S18 -->|calls| T18
  S19["method:UIButton::jobs_titleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:142"]
  T19["method:ASButtonNode::attributedTitleForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:333"]
  S19 -->|calls| T19
  S20["method:UIButton::jobs_subTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:166"]
  T20["method:UIButton::jobs_attributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:90"]
  S20 -->|calls| T20
  S21["method:UIButton::jobs_subTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:182"]
  T21["method:UIButton::jobs_attributedSubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:90"]
  S21 -->|calls| T21
  S22["property:UIButton::jobs_contentEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:197"]
  T22["method:UIButton::jobs_uiEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:243"]
  S22 -->|calls| T22
  S23["property:UIButton::jobs_legacyContentEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:212"]
  T23["method:UIButton::jobs_kvcEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:239"]
  S23 -->|calls| T23
  S24["property:UIButton::jobs_legacyImageEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:216"]
  T24["method:UIButton::jobs_kvcEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:239"]
  S24 -->|calls| T24
  S25["method:UIButton::byLockTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:19"]
  T25["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

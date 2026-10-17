# `calls 符号关系 - 051`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobsAppDoorSingleLineTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:77"]
  T1["method:UILabel::byMinimumScaleFactor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:195"]
  S1 -->|calls| T1
  S2["method:UIButton::jobsAppDoorSingleLineTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:77"]
  T2["method:UILabel::byAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:183"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsAppDoorSingleLineTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:77"]
  T3["method:UIButton::byLineBreakMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:78"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsAppDoorSingleLineTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:77"]
  T4["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:26"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsAppDoorSingleLineTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:77"]
  T5["method:UIButton::byConfiguration<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:47"]
  S5 -->|calls| T5
  S6["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:43"]
  T6["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  S6 -->|calls| T6
  S7["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:43"]
  T7["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  S7 -->|calls| T7
  S8["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:43"]
  T8["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  S8 -->|calls| T8
  S9["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:43"]
  T9["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  S9 -->|calls| T9
  S10["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T10["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  S10 -->|calls| T10
  S11["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T11["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  S11 -->|calls| T11
  S12["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T12["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  S12 -->|calls| T12
  S13["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T13["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  S13 -->|calls| T13
  S14["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T14["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  S14 -->|calls| T14
  S15["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T15["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  S15 -->|calls| T15
  S16["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T16["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  S16 -->|calls| T16
  S17["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T17["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  S17 -->|calls| T17
  S18["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T18["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  S18 -->|calls| T18
  S19["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T19["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  S19 -->|calls| T19
  S20["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T20["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  S20 -->|calls| T20
  S21["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:66"]
  T21["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  S21 -->|calls| T21
  S22["method:RibbonConfiguration::parseConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:119"]
  T22["field:RibbonConfiguration::text<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:69"]
  S22 -->|calls| T22
  S23["method:RibbonConfiguration::parseConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:119"]
  T23["field:RibbonConfiguration::text<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:69"]
  S23 -->|calls| T23
  S24["method:RibbonConfiguration::parseConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:119"]
  T24["method:ASEditableTextNode::indexOfAccessibilityElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:875"]
  S24 -->|calls| T24
  S25["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:158"]
  T25["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

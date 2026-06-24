# `calls 符号关系 - 110`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASLayoutElementStyle::initWithDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:195"]
  T1["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  S1 -->|calls| T1
  S2["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  T2["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  S2 -->|calls| T2
  S3["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  T3["function:ASLayoutElementSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:39"]
  S3 -->|calls| T3
  S4["method:ASLayoutElementStyle::setPreferredSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:320"]
  T4["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S4 -->|calls| T4
  S5["method:ASLayoutElementStyle::setPreferredSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:320"]
  T5["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S5 -->|calls| T5
  S6["method:ASLayoutElementStyle::preferredSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:332"]
  T6["function:NSStringFromASDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S6 -->|calls| T6
  S7["method:ASLayoutElementStyle::preferredSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:332"]
  T7["function:NSStringFromASDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S7 -->|calls| T7
  S8["method:ASLayoutElementStyle::setMinSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:348"]
  T8["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S8 -->|calls| T8
  S9["method:ASLayoutElementStyle::setMinSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:348"]
  T9["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S9 -->|calls| T9
  S10["method:ASLayoutElementStyle::setMaxSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:360"]
  T10["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S10 -->|calls| T10
  S11["method:ASLayoutElementStyle::setMaxSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:360"]
  T11["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S11 -->|calls| T11
  S12["method:ASLayoutElementStyle::preferredLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:372"]
  T12["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S12 -->|calls| T12
  S13["method:ASLayoutElementStyle::minLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:390"]
  T13["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S13 -->|calls| T13
  S14["method:ASLayoutElementStyle::maxLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:408"]
  T14["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S14 -->|calls| T14
  S15["method:ASLayoutElementStyle::setFlexBasis:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:476"]
  T15["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S15 -->|calls| T15
  S16["method:ASLayoutElementStyle::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:590"]
  T16["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S16 -->|calls| T16
  S17["method:ASLayoutElementStyle::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:590"]
  T17["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  S17 -->|calls| T17
  S18["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T18["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S18 -->|calls| T18
  S19["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T19["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S19 -->|calls| T19
  S20["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T20["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S20 -->|calls| T20
  S21["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T21["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S21 -->|calls| T21
  S22["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T22["function:NSStringFromASDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S22 -->|calls| T22
  S23["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T23["function:yogaAlignSelf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:86"]
  S23 -->|calls| T23
  S24["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T24["function:yogaFlexDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:97"]
  S24 -->|calls| T24
  S25["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T25["function:yogaJustifyContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:75"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

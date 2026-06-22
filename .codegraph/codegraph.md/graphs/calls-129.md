# `calls 符号关系 - 129`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASLayoutElementStyle::setMaxSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:360"]
  T1["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S1 -->|calls| T1
  S2["method:ASLayoutElementStyle::preferredLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:372"]
  T2["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S2 -->|calls| T2
  S3["method:ASLayoutElementStyle::minLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:390"]
  T3["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S3 -->|calls| T3
  S4["method:ASLayoutElementStyle::maxLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:408"]
  T4["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S4 -->|calls| T4
  S5["method:ASLayoutElementStyle::setFlexBasis:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:476"]
  T5["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S5 -->|calls| T5
  S6["method:ASLayoutElementStyle::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:590"]
  T6["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S6 -->|calls| T6
  S7["method:ASLayoutElementStyle::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:590"]
  T7["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  S7 -->|calls| T7
  S8["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T8["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S8 -->|calls| T8
  S9["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T9["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S9 -->|calls| T9
  S10["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T10["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S10 -->|calls| T10
  S11["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T11["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S11 -->|calls| T11
  S12["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T12["function:NSStringFromASDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S12 -->|calls| T12
  S13["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T13["function:yogaAlignSelf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:86"]
  S13 -->|calls| T13
  S14["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T14["function:yogaFlexDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:97"]
  S14 -->|calls| T14
  S15["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T15["function:yogaJustifyContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:75"]
  S15 -->|calls| T15
  S16["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T16["function:yogaAlignItems<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:61"]
  S16 -->|calls| T16
  S17["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T17["function:dimensionForEdgeWithEdgeInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:140"]
  S17 -->|calls| T17
  S18["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T18["function:dimensionForEdgeWithEdgeInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:140"]
  S18 -->|calls| T18
  S19["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T19["function:dimensionForEdgeWithEdgeInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:140"]
  S19 -->|calls| T19
  S20["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T20["function:dimensionForEdgeWithEdgeInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:140"]
  S20 -->|calls| T20
  S21["method:ASLayoutElementStyle::initialize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:765"]
  T21["method:ASLayoutElementStyle::initialize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:765"]
  S21 -->|calls| T21
  S22["method:ASLayoutElementStyle::initialize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:765"]
  T22["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S22 -->|calls| T22
  S23["method:ASLayoutElementStyle::destroyYogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:786"]
  T23["function:ASLayoutElementYogaUpdateMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:157"]
  S23 -->|calls| T23
  S24["method:ASLayoutElementStyle::dealloc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:796"]
  T24["method:ASLayoutElementStyle::destroyYogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:786"]
  S24 -->|calls| T24
  S25["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  T25["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

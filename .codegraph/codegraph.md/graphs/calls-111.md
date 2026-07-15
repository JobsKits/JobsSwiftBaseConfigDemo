# `calls 符号关系 - 111`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  T1["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S1 -->|calls| T1
  S2["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  T2["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S2 -->|calls| T2
  S3["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  T3["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S3 -->|calls| T3
  S4["method:ASLayoutSpec::childAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:73"]
  T4["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.h:1"]
  T5["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.h:1"]
  T6["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.h:1"]
  T7["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S7 -->|calls| T7
  S8["method:ASLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  T8["method:ASLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S8 -->|calls| T8
  S9["method:ASLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  T9["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S9 -->|calls| T9
  S10["method:ASLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  T10["method:ASLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S10 -->|calls| T10
  S11["method:ASLayoutSpec::style<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:57"]
  T11["method:ASLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S11 -->|calls| T11
  S12["method:ASLayoutSpec::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:172"]
  T12["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S12 -->|calls| T12
  S13["method:ASLayoutSpec::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:172"]
  T13["method:ASLayoutSpec::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:161"]
  S13 -->|calls| T13
  S14["method:ASLayoutSpec::findDuplicatedElementsInSubtree<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:180"]
  T14["method:ASLayoutSpec::_findDuplicatedElementsInSubtreeWithWorkingSet:workingCount:result:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:195"]
  S14 -->|calls| T14
  S15["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  T15["method:ASLayoutSpec::asciiArtName<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:248"]
  S15 -->|calls| T15
  S16["method:ASWrapperLayoutSpec::initWithLayoutElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:270"]
  T16["method:ASLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S16 -->|calls| T16
  S17["method:ASWrapperLayoutSpec::initWithLayoutElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:284"]
  T17["method:ASLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S17 -->|calls| T17
  S18["method:ASLayoutSpec::asciiArtStringForChildren:parentName:direction:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:322"]
  T18["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  S18 -->|calls| T18
  S19["method:ASLayoutSpec::asciiArtStringForChildren:parentName:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:337"]
  T19["method:ASLayoutSpec::asciiArtStringForChildren:parentName:direction:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:322"]
  S19 -->|calls| T19
  S20["method:ASOverlayLayoutSpec::overlayLayoutSpecWithChild:overlay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:21"]
  T20["method:ASOverlayLayoutSpec::initWithChild:overlay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:28"]
  S20 -->|calls| T20
  S21["method:ASOverlayLayoutSpec::initWithChild:overlay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:28"]
  T21["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S21 -->|calls| T21
  S22["method:ASOverlayLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:40"]
  T22["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S22 -->|calls| T22
  S23["method:ASOverlayLayoutSpec::setOverlay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:51"]
  T23["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S23 -->|calls| T23
  S24["method:ASOverlayLayoutSpec::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:67"]
  T24["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S24 -->|calls| T24
  S25["method:ASRatioLayoutSpec::ratioLayoutSpecWithRatio:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:29"]
  T25["method:ASRatioLayoutSpec::initWithRatio:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:34"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

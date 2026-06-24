# `calls 符号关系 - 113`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T1["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S1 -->|calls| T1
  S2["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T2["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S2 -->|calls| T2
  S3["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T3["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S3 -->|calls| T3
  S4["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T4["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S4 -->|calls| T4
  S5["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T5["function:ASRoundPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S5 -->|calls| T5
  S6["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T6["function:ASRoundPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T7["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T8["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T9["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T10["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T11["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T12["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T13["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T14["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["method:ASStackLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:24"]
  T15["method:ASStackLayoutSpec::initWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:58"]
  S15 -->|calls| T15
  S16["method:ASStackLayoutSpec::stackLayoutSpecWithDirection:spacing:justifyContent:alignItems:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:29"]
  T16["method:ASStackLayoutSpec::initWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:58"]
  S16 -->|calls| T16
  S17["method:ASStackLayoutSpec::stackLayoutSpecWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:34"]
  T17["method:ASStackLayoutSpec::initWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:58"]
  S17 -->|calls| T17
  S18["method:ASStackLayoutSpec::stackLayoutSpecWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:39"]
  T18["method:ASStackLayoutSpec::initWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:58"]
  S18 -->|calls| T18
  S19["method:ASStackLayoutSpec::verticalStackLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:44"]
  T19["method:ASStackLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:24"]
  S19 -->|calls| T19
  S20["method:ASStackLayoutSpec::horizontalStackLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:51"]
  T20["method:ASStackLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:24"]
  S20 -->|calls| T20
  S21["method:ASStackLayoutSpec::initWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:58"]
  T21["method:ASStackLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:24"]
  S21 -->|calls| T21
  S22["method:ASStackLayoutSpec::setDirection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:77"]
  T22["method:ASStackLayoutSpec::resolveHorizontalAlignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:163"]
  S22 -->|calls| T22
  S23["method:ASStackLayoutSpec::setDirection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:77"]
  T23["method:ASStackLayoutSpec::resolveVerticalAlignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:172"]
  S23 -->|calls| T23
  S24["method:ASStackLayoutSpec::setHorizontalAlignment:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:87"]
  T24["method:ASStackLayoutSpec::resolveHorizontalAlignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:163"]
  S24 -->|calls| T24
  S25["method:ASStackLayoutSpec::setVerticalAlignment:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:96"]
  T25["method:ASStackLayoutSpec::resolveVerticalAlignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:172"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

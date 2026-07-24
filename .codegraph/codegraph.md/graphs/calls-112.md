# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T1["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S1 -->|calls| T1
  S2["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T2["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S2 -->|calls| T2
  S3["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T3["function:ASFloorPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S3 -->|calls| T3
  S4["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T4["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S4 -->|calls| T4
  S5["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T5["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S5 -->|calls| T5
  S6["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T6["function:ASFloorPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S6 -->|calls| T6
  S7["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T7["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S7 -->|calls| T7
  S8["class:ASRatioLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T8["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S8 -->|calls| T8
  S9["class:ASRatioLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T9["function:ASSizeRangeIntersect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S9 -->|calls| T9
  S10["class:ASRatioLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T10["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S10 -->|calls| T10
  S11["class:ASRatioLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T11["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.h:1"]
  T12["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S12 -->|calls| T12
  S13["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  T13["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S13 -->|calls| T13
  S14["method:ASRelativeLayoutSpec::relativePositionLayoutSpecWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:31"]
  T14["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  S14 -->|calls| T14
  S15["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T15["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S15 -->|calls| T15
  S16["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T16["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S16 -->|calls| T16
  S17["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T17["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S17 -->|calls| T17
  S18["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T18["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S18 -->|calls| T18
  S19["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T19["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S19 -->|calls| T19
  S20["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T20["function:ASRoundPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S20 -->|calls| T20
  S21["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T21["function:ASRoundPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T22["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T23["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T24["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T25["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

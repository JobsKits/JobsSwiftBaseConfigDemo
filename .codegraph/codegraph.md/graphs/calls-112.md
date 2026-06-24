# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASWrapperLayoutSpec::initWithLayoutElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:284"]
  T1["method:ASLayoutSpec::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S1 -->|calls| T1
  S2["method:ASLayoutSpec::asciiArtStringForChildren:parentName:direction:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:322"]
  T2["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  S2 -->|calls| T2
  S3["method:ASLayoutSpec::asciiArtStringForChildren:parentName:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:337"]
  T3["method:ASLayoutSpec::asciiArtStringForChildren:parentName:direction:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:322"]
  S3 -->|calls| T3
  S4["method:ASOverlayLayoutSpec::overlayLayoutSpecWithChild:overlay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:21"]
  T4["method:ASOverlayLayoutSpec::initWithChild:overlay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:28"]
  S4 -->|calls| T4
  S5["method:ASOverlayLayoutSpec::initWithChild:overlay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:28"]
  T5["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S5 -->|calls| T5
  S6["method:ASOverlayLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:40"]
  T6["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S6 -->|calls| T6
  S7["method:ASOverlayLayoutSpec::setOverlay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:51"]
  T7["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S7 -->|calls| T7
  S8["method:ASOverlayLayoutSpec::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:67"]
  T8["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S8 -->|calls| T8
  S9["method:ASRatioLayoutSpec::ratioLayoutSpecWithRatio:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:29"]
  T9["method:ASRatioLayoutSpec::initWithRatio:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:34"]
  S9 -->|calls| T9
  S10["method:ASRatioLayoutSpec::initWithRatio:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:34"]
  T10["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S10 -->|calls| T10
  S11["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T11["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S11 -->|calls| T11
  S12["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T12["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S12 -->|calls| T12
  S13["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T13["function:ASFloorPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S13 -->|calls| T13
  S14["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T14["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S14 -->|calls| T14
  S15["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T15["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S15 -->|calls| T15
  S16["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T16["function:ASFloorPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S16 -->|calls| T16
  S17["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T17["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S17 -->|calls| T17
  S18["class:ASRatioLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T18["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S18 -->|calls| T18
  S19["class:ASRatioLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T19["function:ASSizeRangeIntersect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S19 -->|calls| T19
  S20["class:ASRatioLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T20["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S20 -->|calls| T20
  S21["class:ASRatioLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T21["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.h:1"]
  T22["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  T23["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S23 -->|calls| T23
  S24["method:ASRelativeLayoutSpec::relativePositionLayoutSpecWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:31"]
  T24["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  S24 -->|calls| T24
  S25["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T25["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

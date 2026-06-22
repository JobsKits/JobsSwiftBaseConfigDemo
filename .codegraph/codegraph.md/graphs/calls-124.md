# `calls 符号关系 - 124`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T1["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S1 -->|calls| T1
  S2["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T2["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S2 -->|calls| T2
  S3["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T3["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  S3 -->|calls| T3
  S4["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T4["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S4 -->|calls| T4
  S5["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T5["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S5 -->|calls| T5
  S6["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T6["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  S6 -->|calls| T6
  S7["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  T7["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S7 -->|calls| T7
  S8["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  T8["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S8 -->|calls| T8
  S9["method:ASBackgroundLayoutSpec::backgroundLayoutSpecWithChild:background:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:23"]
  T9["method:ASBackgroundLayoutSpec::initWithChild:background:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:30"]
  S9 -->|calls| T9
  S10["method:ASBackgroundLayoutSpec::initWithChild:background:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:30"]
  T10["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S10 -->|calls| T10
  S11["method:ASBackgroundLayoutSpec::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:45"]
  T11["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S11 -->|calls| T11
  S12["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  T12["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S12 -->|calls| T12
  S13["method:ASBackgroundLayoutSpec::setBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:80"]
  T13["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S13 -->|calls| T13
  S14["method:ASCenterLayoutSpec::initWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:18"]
  T14["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  S14 -->|calls| T14
  S15["method:ASCenterLayoutSpec::centerLayoutSpecWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:33"]
  T15["method:ASCenterLayoutSpec::initWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:18"]
  S15 -->|calls| T15
  S16["method:ASCornerLayoutSpec::initWithChild:corner:location:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:52"]
  T16["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S16 -->|calls| T16
  S17["method:ASCornerLayoutSpec::cornerLayoutSpecWithChild:corner:location:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:63"]
  T17["method:ASCornerLayoutSpec::initWithChild:corner:location:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:52"]
  S17 -->|calls| T17
  S18["method:ASCornerLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:70"]
  T18["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S18 -->|calls| T18
  S19["method:ASCornerLayoutSpec::setCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:81"]
  T19["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S19 -->|calls| T19
  S20["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T20["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S20 -->|calls| T20
  S21["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T21["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S21 -->|calls| T21
  S22["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T22["function:as_calculatedCornerOriginIn<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:13"]
  S22 -->|calls| T22
  S23["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T23["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S23 -->|calls| T23
  S24["method:ASCornerLayoutSpec::_validateElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:151"]
  T24["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S24 -->|calls| T24
  S25["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  T25["function:ASPointsValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

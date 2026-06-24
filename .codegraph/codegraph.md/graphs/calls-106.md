# `calls 符号关系 - 106`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCornerLayoutSpec::initWithChild:corner:location:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:52"]
  T1["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S1 -->|calls| T1
  S2["method:ASCornerLayoutSpec::cornerLayoutSpecWithChild:corner:location:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:63"]
  T2["method:ASCornerLayoutSpec::initWithChild:corner:location:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:52"]
  S2 -->|calls| T2
  S3["method:ASCornerLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:70"]
  T3["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S3 -->|calls| T3
  S4["method:ASCornerLayoutSpec::setCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:81"]
  T4["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S4 -->|calls| T4
  S5["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T5["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S5 -->|calls| T5
  S6["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T6["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S6 -->|calls| T6
  S7["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T7["function:as_calculatedCornerOriginIn<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:13"]
  S7 -->|calls| T7
  S8["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T8["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S8 -->|calls| T8
  S9["method:ASCornerLayoutSpec::_validateElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:151"]
  T9["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S9 -->|calls| T9
  S10["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  T10["function:ASPointsValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S10 -->|calls| T10
  S11["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  T11["function:ASPointsValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S11 -->|calls| T11
  S12["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  T12["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S12 -->|calls| T12
  S13["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  T13["function:ASPointsValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S13 -->|calls| T13
  S14["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  T14["function:ASIsCGPositionPointsValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:41"]
  S14 -->|calls| T14
  S15["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  T15["function:ASIsCGPositionPointsValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:41"]
  S15 -->|calls| T15
  S16["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  T16["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S16 -->|calls| T16
  S17["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  T17["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S17 -->|calls| T17
  S18["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  T18["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:1"]
  T19["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S19 -->|calls| T19
  S20["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  T20["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S20 -->|calls| T20
  S21["function:ASDimensionMakeWithFraction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:140"]
  T21["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S21 -->|calls| T21
  S22["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  T22["function:ASDimensionResolve<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:162"]
  S22 -->|calls| T22
  S23["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  T23["function:ASDimensionResolve<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:162"]
  S23 -->|calls| T23
  S24["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  T24["function:NSStringFromASDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S24 -->|calls| T24
  S25["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  T25["function:NSStringFromASDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

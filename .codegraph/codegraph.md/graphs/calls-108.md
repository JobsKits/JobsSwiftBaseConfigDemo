# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T1["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S1 -->|calls| T1
  S2["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T2["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S2 -->|calls| T2
  S3["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T3["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S3 -->|calls| T3
  S4["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T4["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S4 -->|calls| T4
  S5["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T5["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S5 -->|calls| T5
  S6["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T6["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S6 -->|calls| T6
  S7["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T7["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S7 -->|calls| T7
  S8["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T8["function:ASLayoutElementSizeConstrain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:23"]
  S8 -->|calls| T8
  S9["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T9["function:ASLayoutElementSizeConstrain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:23"]
  S9 -->|calls| T9
  S10["function:finiteOrZero<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:29"]
  T10["function:finite<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:23"]
  S10 -->|calls| T10
  S11["function:centerInset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:35"]
  T11["function:ASRoundPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S11 -->|calls| T11
  S12["function:initWithInsets:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:42"]
  T12["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S12 -->|calls| T12
  S13["function:insetLayoutSpecWithInsets:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:53"]
  T13["function:initWithInsets:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:42"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:1"]
  T14["function:finite<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:23"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:1"]
  T15["function:finite<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:23"]
  S15 -->|calls| T15
  S16["function:descriptionIndents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:34"]
  T16["method:ASMutableAttributedStringBuilder::string<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:234"]
  S16 -->|calls| T16
  S17["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T17["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S17 -->|calls| T17
  S18["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T18["function:ASPointIsNull<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S18 -->|calls| T18
  S19["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T19["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S19 -->|calls| T19
  S20["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T20["function:ASCeilPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S20 -->|calls| T20
  S21["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T21["function:ASCeilPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S21 -->|calls| T21
  S22["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T22["function:ASPointIsNull<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S22 -->|calls| T22
  S23["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T23["function:ASCeilPointValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  S23 -->|calls| T23
  S24["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T24["method:ASLayout::shouldRetainSublayoutLayoutElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:69"]
  S24 -->|calls| T24
  S25["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T25["method:ASLayout::retainSublayoutElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:163"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

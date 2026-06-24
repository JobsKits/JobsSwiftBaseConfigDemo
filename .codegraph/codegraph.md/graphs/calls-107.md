# `calls 符号关系 - 107`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:267"]
  T1["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:267"]
  S1 -->|calls| T1
  S2["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T2["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S2 -->|calls| T2
  S3["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T3["function:ASCGFloatFromString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/CoreGraphics+ASConvenience.h:23"]
  S3 -->|calls| T3
  S4["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T4["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S4 -->|calls| T4
  S5["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T5["function:ASCGFloatFromString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/CoreGraphics+ASConvenience.h:23"]
  S5 -->|calls| T5
  S6["function:ASEdgeInsetsMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T6["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S6 -->|calls| T6
  S7["function:ASEdgeInsetsMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T7["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S7 -->|calls| T7
  S8["function:ASEdgeInsetsMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T8["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S8 -->|calls| T8
  S9["function:ASEdgeInsetsMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T9["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S9 -->|calls| T9
  S10["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T10["function:ASLayoutElementSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:39"]
  S10 -->|calls| T10
  S11["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T11["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S11 -->|calls| T11
  S12["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T12["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S12 -->|calls| T12
  S13["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T13["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S13 -->|calls| T13
  S14["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T14["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S14 -->|calls| T14
  S15["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T15["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S15 -->|calls| T15
  S16["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T16["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S16 -->|calls| T16
  S17["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T17["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S17 -->|calls| T17
  S18["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T18["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S18 -->|calls| T18
  S19["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  T19["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  S19 -->|calls| T19
  S20["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  T20["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S20 -->|calls| T20
  S21["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T21["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S21 -->|calls| T21
  S22["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T22["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S22 -->|calls| T22
  S23["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T23["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S23 -->|calls| T23
  S24["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T24["function:ASLayoutSizeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S24 -->|calls| T24
  S25["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T25["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

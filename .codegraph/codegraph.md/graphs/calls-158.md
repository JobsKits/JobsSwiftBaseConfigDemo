# `calls 符号关系 - 158`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:InsetLayout::padding<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:114"]
  T1["function:combineInsets<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:79"]
  S1 -->|calls| T1
  S2["method:InsetLayout::padding<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:114"]
  T2["function:makeInsets<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:57"]
  S2 -->|calls| T2
  S3["method:InsetLayout::padding<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:120"]
  T3["function:combineInsets<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:79"]
  S3 -->|calls| T3
  S4["method:InsetLayout::padding<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:126"]
  T4["function:combineInsets<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:79"]
  S4 -->|calls| T4
  S5["method:InsetLayout::padding<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:126"]
  T5["function:makeInsets<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:57"]
  S5 -->|calls| T5
  S6["method:SpacingModifier::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:220"]
  T6["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S6 -->|calls| T6
  S7["method:SpacingModifier::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:220"]
  T7["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S7 -->|calls| T7
  S8["method:SizeModifier::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:260"]
  T8["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S8 -->|calls| T8
  S9["method:SizeModifier::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:260"]
  T9["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S9 -->|calls| T9
  S10["method:MinSizeModifier::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:286"]
  T10["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S10 -->|calls| T10
  S11["method:MinSizeModifier::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:286"]
  T11["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S11 -->|calls| T11
  S12["method:MaxSizeModifier::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:312"]
  T12["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S12 -->|calls| T12
  S13["method:MaxSizeModifier::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:312"]
  T13["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S13 -->|calls| T13
  S14["method:_ASLayoutElementType::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:339"]
  T14["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S14 -->|calls| T14
  S15["method:_ASLayoutElementType::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:339"]
  T15["method:_ASLayoutElementType::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:339"]
  S15 -->|calls| T15
  S16["method:_ASLayoutElementType::flexGrow<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:348"]
  T16["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S16 -->|calls| T16
  S17["method:_ASLayoutElementType::flexShrink<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:352"]
  T17["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S17 -->|calls| T17
  S18["method:_ASLayoutElementType::flexBasis<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:356"]
  T18["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S18 -->|calls| T18
  S19["method:_ASLayoutElementType::preferredSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:360"]
  T19["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S19 -->|calls| T19
  S20["method:_ASLayoutElementType::alignSelf<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:364"]
  T20["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S20 -->|calls| T20
  S21["method:_ASLayoutElementType::minWidth<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:368"]
  T21["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S21 -->|calls| T21
  S22["method:_ASLayoutElementType::minHeight<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:372"]
  T22["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S22 -->|calls| T22
  S23["method:_ASLayoutElementType::width<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:377"]
  T23["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S23 -->|calls| T23
  S24["method:_ASLayoutElementType::height<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:382"]
  T24["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S24 -->|calls| T24
  S25["method:_ASLayoutElementType::width<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:386"]
  T25["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

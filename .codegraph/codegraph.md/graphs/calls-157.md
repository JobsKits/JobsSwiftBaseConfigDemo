# `calls 符号关系 - 157`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:AspectRatioLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/AspectRatioLayout.swift:19"]
  T1["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S1 -->|calls| T1
  S2["struct:BackgroundLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/BackgroundLayout.swift:4"]
  T2["method:_ASLayoutElementType::background<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:138"]
  S2 -->|calls| T2
  S3["method:BackgroundLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/BackgroundLayout.swift:14"]
  T3["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S3 -->|calls| T3
  S4["method:BackgroundLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/BackgroundLayout.swift:14"]
  T4["method:BackgroundLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/BackgroundLayout.swift:14"]
  S4 -->|calls| T4
  S5["method:CenterLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/CenterLayout.swift:19"]
  T5["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S5 -->|calls| T5
  S6["method:CenterLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/CenterLayout.swift:19"]
  T6["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S6 -->|calls| T6
  S7["method:CornerLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/CornerLayout.swift:27"]
  T7["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S7 -->|calls| T7
  S8["method:CornerLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/CornerLayout.swift:27"]
  T8["method:CornerLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/CornerLayout.swift:27"]
  S8 -->|calls| T8
  S9["method:InsetLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/InsetLayout.swift:13"]
  T9["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S9 -->|calls| T9
  S10["method:InsetLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/InsetLayout.swift:13"]
  T10["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S10 -->|calls| T10
  S11["struct:ConditionalLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/Internal/ConditionalLayout.swift:24"]
  T11["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S11 -->|calls| T11
  S12["struct:ConditionalLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/Internal/ConditionalLayout.swift:24"]
  T12["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S12 -->|calls| T12
  S13["method:OptionalLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/Internal/OptionalLayout.swift:30"]
  T13["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S13 -->|calls| T13
  S14["struct:OverlayLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/OverlayLayout.swift:3"]
  T14["method:_ASLayoutElementType::overlay<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:146"]
  S14 -->|calls| T14
  S15["method:OverlayLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/OverlayLayout.swift:13"]
  T15["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S15 -->|calls| T15
  S16["method:OverlayLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/OverlayLayout.swift:13"]
  T16["method:OverlayLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/OverlayLayout.swift:13"]
  S16 -->|calls| T16
  S17["method:RelativeLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/RelativeLayout.swift:23"]
  T17["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S17 -->|calls| T17
  S18["method:RelativeLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/RelativeLayout.swift:23"]
  T18["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S18 -->|calls| T18
  S19["method:Switch::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:136"]
  T19["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S19 -->|calls| T19
  S20["struct:Case<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:144"]
  T20["method:Case::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:162"]
  S20 -->|calls| T20
  S21["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  T21["method:LayoutCondition::matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:71"]
  S21 -->|calls| T21
  S22["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  T22["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  S22 -->|calls| T22
  S23["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  T23["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S23 -->|calls| T23
  S24["method:_SwitchLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:259"]
  T24["method:LayoutCondition::matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:71"]
  S24 -->|calls| T24
  S25["method:_SwitchLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:259"]
  T25["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 176`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:InsetLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/InsetLayout.swift:13"]
  T1["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S1 -->|calls| T1
  S2["struct:ConditionalLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/Internal/ConditionalLayout.swift:24"]
  T2["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S2 -->|calls| T2
  S3["struct:ConditionalLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/Internal/ConditionalLayout.swift:24"]
  T3["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S3 -->|calls| T3
  S4["method:OptionalLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/Internal/OptionalLayout.swift:30"]
  T4["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S4 -->|calls| T4
  S5["struct:OverlayLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/OverlayLayout.swift:3"]
  T5["method:_ASLayoutElementType::overlay<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:146"]
  S5 -->|calls| T5
  S6["method:OverlayLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/OverlayLayout.swift:13"]
  T6["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S6 -->|calls| T6
  S7["method:OverlayLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/OverlayLayout.swift:13"]
  T7["method:OverlayLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/OverlayLayout.swift:13"]
  S7 -->|calls| T7
  S8["method:RelativeLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/RelativeLayout.swift:23"]
  T8["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S8 -->|calls| T8
  S9["method:RelativeLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/RelativeLayout.swift:23"]
  T9["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S9 -->|calls| T9
  S10["method:Switch::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:136"]
  T10["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S10 -->|calls| T10
  S11["struct:Case<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:144"]
  T11["method:Case::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:162"]
  S11 -->|calls| T11
  S12["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  T12["method:LayoutCondition::matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:71"]
  S12 -->|calls| T12
  S13["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  T13["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  S13 -->|calls| T13
  S14["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  T14["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S14 -->|calls| T14
  S15["method:_SwitchLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:259"]
  T15["method:LayoutCondition::matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:71"]
  S15 -->|calls| T15
  S16["method:_SwitchLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:259"]
  T16["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  S16 -->|calls| T16
  S17["method:_SwitchLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:259"]
  T17["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  S17 -->|calls| T17
  S18["method:_ConditionalLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:309"]
  T18["method:_CaseLayoutSpec::calculateLayoutThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/SwitchCaseLayout.swift:228"]
  S18 -->|calls| T18
  S19["method:VGridLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/VGridLayout.swift:81"]
  T19["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S19 -->|calls| T19
  S20["method:VGridLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/VGridLayout.swift:81"]
  T20["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S20 -->|calls| T20
  S21["method:VGridLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/VGridLayout.swift:81"]
  T21["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S21 -->|calls| T21
  S22["method:VGridLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/VGridLayout.swift:81"]
  T22["method:Collection::chunked<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/VGridLayout.swift:170"]
  S22 -->|calls| T22
  S23["method:VGridLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/VGridLayout.swift:81"]
  T23["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S23 -->|calls| T23
  S24["method:Collection::chunked<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/VGridLayout.swift:170"]
  T24["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S24 -->|calls| T24
  S25["method:_ASLayoutElementType::padding<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:91"]
  T25["function:makeInsets<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:57"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

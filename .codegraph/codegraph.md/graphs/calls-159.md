# `calls 符号关系 - 159`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASLayoutElementType::width<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:386"]
  T1["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S1 -->|calls| T1
  S2["method:_ASLayoutElementType::height<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:390"]
  T2["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S2 -->|calls| T2
  S3["method:_ASLayoutElementType::minSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:394"]
  T3["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S3 -->|calls| T3
  S4["method:_ASLayoutElementType::maxWidth<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:398"]
  T4["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S4 -->|calls| T4
  S5["method:_ASLayoutElementType::maxHeight<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:402"]
  T5["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S5 -->|calls| T5
  S6["method:_ASLayoutElementType::maxSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:406"]
  T6["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S6 -->|calls| T6
  S7["method:_ASLayoutElementType::spacingAfter<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:410"]
  T7["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S7 -->|calls| T7
  S8["method:_ASLayoutElementType::spacingBefore<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:414"]
  T8["method:_ASLayoutElementType::modifier<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:10"]
  S8 -->|calls| T8
  S9["struct:LayoutCondition<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:37"]
  T9["method:LayoutCondition::matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:71"]
  S9 -->|calls| T9
  S10["struct:LayoutCondition<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:37"]
  T10["method:LayoutCondition::matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:71"]
  S10 -->|calls| T10
  S11["method:LayoutCondition::_matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:141"]
  T11["method:LayoutCondition::_matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:141"]
  S11 -->|calls| T11
  S12["method:LayoutCondition::_matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:141"]
  T12["method:LayoutCondition::_matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:141"]
  S12 -->|calls| T12
  S13["method:LayoutCondition::containerSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:151"]
  T13["method:LayoutCondition::_matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:141"]
  S13 -->|calls| T13
  S14["method:LayoutCondition::minConstraintSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:157"]
  T14["method:LayoutCondition::_matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:141"]
  S14 -->|calls| T14
  S15["method:LayoutCondition::maxConstraintSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:163"]
  T15["method:LayoutCondition::_matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:141"]
  S15 -->|calls| T15
  S16["method:LayoutCondition::parentSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:169"]
  T16["method:LayoutCondition::_matches<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Options/LayoutCondition.swift:141"]
  S16 -->|calls| T16
  S17["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  T17["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S17 -->|calls| T17
  S18["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  T18["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S18 -->|calls| T18
  S19["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  T19["method:Modifier::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:72"]
  S19 -->|calls| T19
  S20["method:Optional::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:150"]
  T20["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S20 -->|calls| T20
  S21["class:LayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:158"]
  T21["method:Optional::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:150"]
  S21 -->|calls| T21
  S22["class:AnyLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:170"]
  T22["method:Optional::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:150"]
  S22 -->|calls| T22
  S23["method:ASListKitTestAdapterDataSource::listAdapter:sectionControllerForObject:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListKitTestAdapterDataSource.m:18"]
  T23["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  S23 -->|calls| T23
  S24["function:setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListKitTests.m:29"]
  T24["function:setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListKitTests.m:29"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListKitTests.m<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListKitTests.m:1"]
  T25["method:ASCollectionModernDataSourceTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:73"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

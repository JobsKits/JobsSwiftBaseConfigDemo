# `calls 符号关系 - 196`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeTests::testSettingPropertiesViaStyllableProtocol<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2412"]
  T1["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeTests::testSettingPropertiesViaStyllableProtocol<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2412"]
  T2["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeTests::_testThatHavingTheSameNodeTwiceInALayoutSpecCausesExceptionOnLayoutCalculation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2448"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeTests::_testThatHavingTheSameNodeTwiceInALayoutSpecCausesExceptionOnLayoutCalculation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2448"]
  T4["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeTests::testThatStackSpecOrdersSubnodesCorrectlyRandomness<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2462"]
  T5["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeTests::testThatStackSpecOrdersSubnodesCorrectlyRandomness<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2462"]
  T6["method:ASStackLayoutSpec::verticalStackLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:44"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeTests::testThatStackSpecOrdersSubnodesCorrectlyRandomness<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2462"]
  T7["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeTests::testThatStackSpecOrdersSubnodesCorrectlyRandomness<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2462"]
  T8["function:orderStringFromSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:57"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeTests::testThatStackSpecOrdersSubnodesCorrectlyRandomness<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2462"]
  T9["function:orderStringFromSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:53"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeTests::testThatStackSpecOrdersSubnodesCorrectlyRandomness<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2462"]
  T10["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeTests::testThatStackSpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2533"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeTests::testThatStackSpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2533"]
  T12["method:ASStackLayoutSpec::verticalStackLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:44"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeTests::testThatStackSpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2533"]
  T13["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeTests::testThatOverlaySpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2594"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeTests::testThatOverlaySpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2594"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeTests::testThatOverlaySpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2594"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeTests::testThatOverlaySpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2594"]
  T17["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeTests::testThatBackgroundLayoutSpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2615"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeTests::testThatBackgroundLayoutSpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2615"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeTests::testThatBackgroundLayoutSpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2615"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeTests::testThatBackgroundLayoutSpecOrdersSubnodesCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2615"]
  T21["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeTests::testThatConvertPointGoesToWindowWhenPassedNil<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2636"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeTests::testThatConvertPointGoesToWindowWhenPassedNil_layerBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2646"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTests::DISABLED_testThatItIsAllowedToRetrieveDebugDescriptionIncludingVCOffMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2659"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeTests::DISABLED_testThatItIsAllowedToRetrieveDebugDescriptionIncludingVCOffMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2659"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

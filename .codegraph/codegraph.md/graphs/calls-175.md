# `calls 符号关系 - 175`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASConfigurationTests::testMappingFlagsFromNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:116"]
  T1["method:ASConfigurationTests::allFeatures<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:62"]
  S1 -->|calls| T1
  S2["method:ASConfigurationTests::testMappingFlagsFromNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:116"]
  T2["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  S2 -->|calls| T2
  S3["method:ASConfigurationTests::testFlagMatchName<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:125"]
  T3["method:ASConfigurationTests::names<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:44"]
  S3 -->|calls| T3
  S4["method:ASConfigurationTests::testFlagMatchName<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:125"]
  T4["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  S4 -->|calls| T4
  S5["method:ASConfigurationTests::testNameMatchFlag<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:133"]
  T5["method:ASConfigurationTests::names<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:44"]
  S5 -->|calls| T5
  S6["method:ASConfigurationTests::testNameMatchFlag<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:133"]
  T6["function:ASExperimentalFeaturesGetNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:13"]
  S6 -->|calls| T6
  S7["method:ASControlNodeTests::testActionWithoutParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:60"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:ASControlNodeTests::testActionWithoutParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:60"]
  T8["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S8 -->|calls| T8
  S9["method:ASControlNodeTests::testActionAndSender<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:69"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASControlNodeTests::testActionAndSender<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:69"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASControlNodeTests::testActionAndSenderAndEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:78"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:ASControlNodeTests::testActionAndSenderAndEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:78"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASControlNodeTests::testActionWithoutTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:87"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASControlNodeTests::testActionWithoutTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:87"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASControlNodeTests::testActionAndSenderWithoutTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:96"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASControlNodeTests::testActionAndSenderWithoutTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:96"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASControlNodeTests::testActionAndSenderAndEventWithoutTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:105"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASControlNodeTests::testActionAndSenderAndEventWithoutTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:105"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASControlNodeTests::testRemoveWithoutTargetRemovesTargetlessAction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:114"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASControlNodeTests::testRemoveWithoutTargetRemovesTargetlessAction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:114"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASControlNodeTests::testRemoveWithTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:124"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASControlNodeTests::testRemoveWithTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:124"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASControlNodeTests::testRemoveWithTargetRemovesAction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:134"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASControlNodeTests::testRemoveWithTargetRemovesAction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:134"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASControlNodeTests::testRemoveWithoutTargetRemovesTargetedAction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:144"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

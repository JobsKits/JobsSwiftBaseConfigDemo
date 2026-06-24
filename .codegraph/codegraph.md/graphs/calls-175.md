# `calls 符号关系 - 175`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewThrashTests::testThrashingWildlyOnSameCollectionView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:119"]
  T1["method:ASCollectionViewThrashTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:29"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewThrashTests::testThrashingWildlyOnSameCollectionView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:119"]
  T2["method:ASCollectionViewThrashTests::applyUpdateUsingBatchUpdates:toDataSource:animated:useXCTestWait:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:176"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewThrashTests::testThrashingWildlyOnSameCollectionView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:119"]
  T3["method:ASCollectionViewThrashTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:37"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewThrashTests::testThrashingWildlyDispatchWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:146"]
  T4["method:ASCollectionViewThrashTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:29"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewThrashTests::testThrashingWildlyDispatchWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:146"]
  T5["method:ASCollectionViewThrashTests::applyUpdateUsingBatchUpdates:toDataSource:animated:useXCTestWait:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:176"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewThrashTests::testThrashingWildlyDispatchWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:146"]
  T6["method:ASCollectionViewThrashTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:37"]
  S6 -->|calls| T6
  S7["method:ASConfigurationTests::testMappingNamesToFlags<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:107"]
  T7["method:ASConfigurationTests::allFeatures<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:62"]
  S7 -->|calls| T7
  S8["method:ASConfigurationTests::testMappingNamesToFlags<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:107"]
  T8["method:ASConfigurationTests::names<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:44"]
  S8 -->|calls| T8
  S9["method:ASConfigurationTests::testMappingNamesToFlags<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:107"]
  T9["function:ASExperimentalFeaturesGetNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:13"]
  S9 -->|calls| T9
  S10["method:ASConfigurationTests::testMappingFlagsFromNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:116"]
  T10["method:ASConfigurationTests::names<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:44"]
  S10 -->|calls| T10
  S11["method:ASConfigurationTests::testMappingFlagsFromNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:116"]
  T11["method:ASConfigurationTests::allFeatures<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:62"]
  S11 -->|calls| T11
  S12["method:ASConfigurationTests::testMappingFlagsFromNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:116"]
  T12["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  S12 -->|calls| T12
  S13["method:ASConfigurationTests::testFlagMatchName<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:125"]
  T13["method:ASConfigurationTests::names<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:44"]
  S13 -->|calls| T13
  S14["method:ASConfigurationTests::testFlagMatchName<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:125"]
  T14["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  S14 -->|calls| T14
  S15["method:ASConfigurationTests::testNameMatchFlag<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:133"]
  T15["method:ASConfigurationTests::names<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:44"]
  S15 -->|calls| T15
  S16["method:ASConfigurationTests::testNameMatchFlag<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:133"]
  T16["function:ASExperimentalFeaturesGetNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:13"]
  S16 -->|calls| T16
  S17["method:ASControlNodeTests::testActionWithoutParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:60"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASControlNodeTests::testActionWithoutParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:60"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASControlNodeTests::testActionAndSender<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:69"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASControlNodeTests::testActionAndSender<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:69"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASControlNodeTests::testActionAndSenderAndEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:78"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASControlNodeTests::testActionAndSenderAndEvent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:78"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASControlNodeTests::testActionWithoutTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:87"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASControlNodeTests::testActionWithoutTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:87"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASControlNodeTests::testActionAndSenderWithoutTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:96"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

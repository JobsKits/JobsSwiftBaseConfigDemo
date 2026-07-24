# `calls 符号关系 - 174`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewTests::testASPrimitiveTraitCollectionToUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1249"]
  T1["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewTests::DISABLED_testThatAutomaticallyManagedSubnodesGetPreloadCallBeforeDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1279"]
  T2["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewTests::DISABLED_testThatAutomaticallyManagedSubnodesGetPreloadCallBeforeDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1279"]
  T3["function:NSStringFromASInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:54"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewTests::DISABLED_testThatAutomaticallyManagedSubnodesGetPreloadCallBeforeDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1279"]
  T4["function:NSStringFromASInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:54"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewTests::testAllPendingStatePropertiesTransferredToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1302"]
  T5["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewTests::testAllPendingStatePropertiesTransferredToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1302"]
  T6["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewTests::testAllPendingStatePropertiesTransferredToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1302"]
  T7["method:ASCollectionViewTestDelegate::initWithNumberOfSections:numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:77"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewTests::testAllPendingStatePropertiesTransferredToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1302"]
  T8["method:ASCollectionViewTestDelegate::initWithNumberOfSections:numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:77"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewThrashTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:29"]
  T9["method:ASCollectionViewThrashTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:29"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewThrashTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:37"]
  T10["method:ASCollectionViewThrashTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:37"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewThrashTests::testRecordedThrashCase<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:79"]
  T11["method:ASCollectionViewThrashTests::applyUpdateUsingBatchUpdates:toDataSource:animated:useXCTestWait:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:176"]
  S11 -->|calls| T11
  S12["method:ASCollectionViewThrashTests::testThrashingWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:97"]
  T12["method:ASCollectionViewThrashTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:29"]
  S12 -->|calls| T12
  S13["method:ASCollectionViewThrashTests::testThrashingWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:97"]
  T13["method:ASCollectionViewThrashTests::applyUpdateUsingBatchUpdates:toDataSource:animated:useXCTestWait:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:176"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewThrashTests::testThrashingWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:97"]
  T14["method:ASThrashDataSource::predicateForDeallocatedHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASThrashUtility.m:270"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewThrashTests::testThrashingWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:97"]
  T15["method:ASCollectionViewThrashTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:37"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewThrashTests::testThrashingWildlyOnSameCollectionView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:119"]
  T16["method:ASCollectionViewThrashTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:29"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewThrashTests::testThrashingWildlyOnSameCollectionView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:119"]
  T17["method:ASCollectionViewThrashTests::applyUpdateUsingBatchUpdates:toDataSource:animated:useXCTestWait:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:176"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewThrashTests::testThrashingWildlyOnSameCollectionView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:119"]
  T18["method:ASCollectionViewThrashTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:37"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewThrashTests::testThrashingWildlyDispatchWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:146"]
  T19["method:ASCollectionViewThrashTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:29"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewThrashTests::testThrashingWildlyDispatchWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:146"]
  T20["method:ASCollectionViewThrashTests::applyUpdateUsingBatchUpdates:toDataSource:animated:useXCTestWait:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:176"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewThrashTests::testThrashingWildlyDispatchWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:146"]
  T21["method:ASCollectionViewThrashTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:37"]
  S21 -->|calls| T21
  S22["method:ASConfigurationTests::testMappingNamesToFlags<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:107"]
  T22["method:ASConfigurationTests::allFeatures<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:62"]
  S22 -->|calls| T22
  S23["method:ASConfigurationTests::testMappingNamesToFlags<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:107"]
  T23["method:ASConfigurationTests::names<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:44"]
  S23 -->|calls| T23
  S24["method:ASConfigurationTests::testMappingNamesToFlags<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:107"]
  T24["function:ASExperimentalFeaturesGetNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:13"]
  S24 -->|calls| T24
  S25["method:ASConfigurationTests::testMappingFlagsFromNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:116"]
  T25["method:ASConfigurationTests::names<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASConfigurationTests.mm:44"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

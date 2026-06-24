# `calls 符号关系 - 174`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewTests::testInitialRangeBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1151"]
  T1["method:ASCollectionViewTests::testInitialRangeBoundsWithCellLayoutMode:shouldWaitUntilAllUpdatesAreProcessed:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1163"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewTests::testInitialRangeBoundsCellLayoutModeAlwaysAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1157"]
  T2["method:ASCollectionViewTests::testInitialRangeBoundsWithCellLayoutMode:shouldWaitUntilAllUpdatesAreProcessed:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1163"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewTests::testInitialRangeBoundsWithCellLayoutMode:shouldWaitUntilAllUpdatesAreProcessed:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1163"]
  T3["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewTests::testInitialRangeBoundsWithCellLayoutMode:shouldWaitUntilAllUpdatesAreProcessed:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1163"]
  T4["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewTests::testTraitCollectionChangesMidUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1217"]
  T5["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewTests::testTraitCollectionChangesMidUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1217"]
  T6["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewTests::testTraitCollectionChangesMidUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1217"]
  T7["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewTests::testASPrimitiveTraitCollectionToUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1249"]
  T8["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewTests::testASPrimitiveTraitCollectionToUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1249"]
  T9["function:ASPrimitiveTraitCollectionToUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:74"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewTests::testASPrimitiveTraitCollectionToUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1249"]
  T10["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewTests::testASPrimitiveTraitCollectionToUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1249"]
  T11["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S11 -->|calls| T11
  S12["method:ASCollectionViewTests::DISABLED_testThatAutomaticallyManagedSubnodesGetPreloadCallBeforeDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1279"]
  T12["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S12 -->|calls| T12
  S13["method:ASCollectionViewTests::DISABLED_testThatAutomaticallyManagedSubnodesGetPreloadCallBeforeDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1279"]
  T13["function:NSStringFromASInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:54"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewTests::DISABLED_testThatAutomaticallyManagedSubnodesGetPreloadCallBeforeDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1279"]
  T14["function:NSStringFromASInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:54"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewTests::testAllPendingStatePropertiesTransferredToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1302"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewTests::testAllPendingStatePropertiesTransferredToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1302"]
  T16["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewTests::testAllPendingStatePropertiesTransferredToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1302"]
  T17["method:ASCollectionViewTestDelegate::initWithNumberOfSections:numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:77"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewTests::testAllPendingStatePropertiesTransferredToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1302"]
  T18["method:ASCollectionViewTestDelegate::initWithNumberOfSections:numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:77"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewThrashTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:29"]
  T19["method:ASCollectionViewThrashTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:29"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewThrashTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:37"]
  T20["method:ASCollectionViewThrashTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:37"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewThrashTests::testRecordedThrashCase<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:79"]
  T21["method:ASCollectionViewThrashTests::applyUpdateUsingBatchUpdates:toDataSource:animated:useXCTestWait:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:176"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewThrashTests::testThrashingWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:97"]
  T22["method:ASCollectionViewThrashTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:29"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewThrashTests::testThrashingWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:97"]
  T23["method:ASCollectionViewThrashTests::applyUpdateUsingBatchUpdates:toDataSource:animated:useXCTestWait:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:176"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewThrashTests::testThrashingWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:97"]
  T24["method:ASThrashDataSource::predicateForDeallocatedHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASThrashUtility.m:270"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewThrashTests::testThrashingWildly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:97"]
  T25["method:ASCollectionViewThrashTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewThrashTests.mm:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

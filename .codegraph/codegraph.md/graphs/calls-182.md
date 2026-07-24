# `calls 符号关系 - 182`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T1["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S1 -->|calls| T1
  S2["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T2["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S2 -->|calls| T2
  S3["function:modifyMethodByAddingPrologueBlockAndReturnCleanupBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:30"]
  T3["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S3 -->|calls| T3
  S4["function:modifyMethodByAddingPrologueBlockAndReturnCleanupBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:30"]
  T4["function:class_replaceMethodWithBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:23"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeAppearanceTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:74"]
  T5["method:ASDisplayNodeAppearanceTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:74"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeAppearanceTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:74"]
  T6["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeAppearanceTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:74"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeAppearanceTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:74"]
  T8["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeAppearanceTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:74"]
  T9["function:modifyMethodByAddingPrologueBlockAndReturnCleanupBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:30"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeAppearanceTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:74"]
  T10["function:modifyMethodByAddingPrologueBlockAndReturnCleanupBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:30"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeAppearanceTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:94"]
  T11["method:ASDisplayNodeAppearanceTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:94"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeAppearanceTests::testAppearanceMethodsNoLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:228"]
  T12["method:ASDisplayNodeAppearanceTests::checkManualAppearanceViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:154"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeAppearanceTests::testAppearanceMethodsNoView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:233"]
  T13["method:ASDisplayNodeAppearanceTests::checkManualAppearanceViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:154"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeAppearanceTests::testAppearanceMethodsLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:238"]
  T14["method:ASDisplayNodeAppearanceTests::checkManualAppearanceViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:154"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeAppearanceTests::testAppearanceMethodsView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:243"]
  T15["method:ASDisplayNodeAppearanceTests::checkManualAppearanceViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:154"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  T16["function:ASDisplayNodeDisableHierarchyNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:329"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  T17["function:ASDisplayNodeEnableHierarchyNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:334"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  T18["function:ASDisplayNodeDisableHierarchyNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:329"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  T19["function:ASDisplayNodeEnableHierarchyNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:334"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeAppearanceTests::testMoveAcrossHierarchyLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:385"]
  T20["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeAppearanceTests::testMoveAcrossHierarchyView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:390"]
  T21["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeAppearanceTests::testMoveAcrossHierarchyManualLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:395"]
  T22["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeAppearanceTests::testMoveAcrossHierarchyManualView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:400"]
  T23["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeAppearanceTests::testDisableWithNodeAPILayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:405"]
  T24["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeAppearanceTests::testDisableWithNodeAPIView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:410"]
  T25["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

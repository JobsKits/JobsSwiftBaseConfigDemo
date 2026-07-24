# `calls 符号关系 - 185`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeLayoutTests::testMeasureOnLayoutIfNotHappenedBefore<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:22"]
  T1["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeLayoutTests::testMeasureOnLayoutIfNotHappenedBefore<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:22"]
  T2["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeLayoutTests::testNotAllowAddingSubnodesInLayoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:49"]
  T3["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeLayoutTests::testNotAllowModifyingSubnodesInLayoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:62"]
  T4["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeLayoutTests::testMeasureOnLayoutIfNotHappenedBeforeNoRemeasureForSameBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:79"]
  T5["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeLayoutTests::testMeasureOnLayoutIfNotHappenedBeforeNoRemeasureForSameBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:79"]
  T6["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeLayoutTests::testThatLayoutWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:106"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeLayoutTests::testThatLayoutWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:106"]
  T8["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeLayoutTests::testThatLayoutWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:106"]
  T9["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeLayoutTests::testThatLayoutCreatedWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:117"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeLayoutTests::testThatLayoutCreatedWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:117"]
  T11["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeLayoutTests::testThatLayoutCreatedWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:117"]
  T12["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeLayoutTests::testThatLayoutCreatedWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:117"]
  T13["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeLayoutTests::testThatLayoutElementCreatedInLayoutSpecThatFitsDoNotGetDeallocated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:125"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeLayoutTests::testThatLayoutElementCreatedInLayoutSpecThatFitsDoNotGetDeallocated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:125"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeLayoutTests::testThatLayoutElementCreatedInLayoutSpecThatFitsDoNotGetDeallocated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:125"]
  T16["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeSnapshotTests::testBasicHierarchySnapshotTesting<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:19"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeSnapshotTests::testBasicHierarchySnapshotTesting<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:19"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeSnapshotTests::testBasicHierarchySnapshotTesting<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:19"]
  T19["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeSnapshotTests::testPrecompositedCornerRounding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:47"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeSnapshotTests::testPrecompositedCornerRounding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:47"]
  T21["function:ASDisplayNodeSnapshotTests::BlueImageMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:37"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeSnapshotTests::testClippingCornerRounding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:62"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeSnapshotTests::testClippingCornerRounding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:62"]
  T23["function:ASDisplayNodeSnapshotTests::BlueImageMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:37"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeSnapshotTests::testUserInterfaceStyleSnapshotTesting<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:86"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeSnapshotTests::testUserInterfaceStyleSnapshotTesting<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:86"]
  T25["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

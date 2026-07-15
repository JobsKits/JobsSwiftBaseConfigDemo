# `calls 符号关系 - 193`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeTests::testInsertSubnodeBelowWithNoView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1681"]
  T1["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeTests::testInsertSubnodeBelowWithNoLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1686"]
  T2["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeTests::testInsertSubnodeBelowWithLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1691"]
  T3["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  T4["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  T5["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  T6["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeTests::testInsertSubnodeAboveWithView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1753"]
  T7["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeTests::testInsertSubnodeAboveWithNoView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1758"]
  T8["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeTests::testInsertSubnodeAboveWithLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1763"]
  T9["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeTests::testInsertSubnodeAboveWithNoLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1768"]
  T10["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  T11["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  T12["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  T13["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeTests::testSubnodeAddedBeforeLoadingExternalView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1882"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeTests::testSubnodeAddedBeforeLoadingExternalView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1882"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeTests::testSubnodeAddedAfterLoadingExternalView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1905"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeTests::testSubnodeAddedAfterLoadingExternalView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1905"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeTests::checkBackgroundColorOpaqueRelationshipWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1922"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeTests::testBackgroundColorOpaqueRelationshipView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1961"]
  T19["method:ASDisplayNodeTests::checkBackgroundColorOpaqueRelationshipWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1922"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeTests::testBackgroundColorOpaqueRelationshipLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1966"]
  T20["method:ASDisplayNodeTests::checkBackgroundColorOpaqueRelationshipWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1922"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeTests::testBackgroundColorOpaqueRelationshipNoView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1971"]
  T21["method:ASDisplayNodeTests::checkBackgroundColorOpaqueRelationshipWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1922"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeTests::testBackgroundColorOpaqueRelationshipNoLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1976"]
  T22["method:ASDisplayNodeTests::checkBackgroundColorOpaqueRelationshipWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1922"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 193`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingViewsAndLayersViewBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1564"]
  T1["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingViewsAndLayersViewBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1564"]
  T2["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingViewsAndLayersViewBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1564"]
  T3["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeTests::testAppleBugInsertSubview<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1603"]
  T4["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeTests::testAppleBugInsertSubview<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1603"]
  T5["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1645"]
  T6["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1645"]
  T7["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1645"]
  T8["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeTests::testInsertSubnodeBelowWithView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1676"]
  T9["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeTests::testInsertSubnodeBelowWithNoView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1681"]
  T10["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeTests::testInsertSubnodeBelowWithNoLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1686"]
  T11["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeTests::testInsertSubnodeBelowWithLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1691"]
  T12["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  T13["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  T14["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  T15["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeTests::testInsertSubnodeAboveWithView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1753"]
  T16["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeTests::testInsertSubnodeAboveWithNoView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1758"]
  T17["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeTests::testInsertSubnodeAboveWithLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1763"]
  T18["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeTests::testInsertSubnodeAboveWithNoLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1768"]
  T19["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  T20["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  T21["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeTests::checkInsertSubnodeAboveLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1774"]
  T22["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeTests::testSubnodeAddedBeforeLoadingExternalView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1882"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTests::testSubnodeAddedBeforeLoadingExternalView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1882"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeTests::testSubnodeAddedAfterLoadingExternalView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1905"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

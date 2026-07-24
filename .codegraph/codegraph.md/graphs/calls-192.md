# `calls 符号关系 - 192`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeTests::testSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1325"]
  T1["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeTests::testSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1325"]
  T2["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeTests::testReplaceSubnodeNoView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1334"]
  T3["method:ASDisplayNodeTests::checkReplaceSubnodeLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1355"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeTests::testReplaceSubnodeNoLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1339"]
  T4["method:ASDisplayNodeTests::checkReplaceSubnodeLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1355"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeTests::testReplaceSubnodeView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1344"]
  T5["method:ASDisplayNodeTests::checkReplaceSubnodeLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1355"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeTests::testReplaceSubnodeLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1349"]
  T6["method:ASDisplayNodeTests::checkReplaceSubnodeLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1355"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeTests::testInsertSubnodeAtIndexView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1432"]
  T7["method:ASDisplayNodeTests::checkInsertSubnodeAtIndexWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1452"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeTests::testInsertSubnodeAtIndexLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1437"]
  T8["method:ASDisplayNodeTests::checkInsertSubnodeAtIndexWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1452"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeTests::testInsertSubnodeAtIndexNoView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1442"]
  T9["method:ASDisplayNodeTests::checkInsertSubnodeAtIndexWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1452"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeTests::testInsertSubnodeAtIndexNoLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1447"]
  T10["method:ASDisplayNodeTests::checkInsertSubnodeAtIndexWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1452"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeTests::checkInsertSubnodeAtIndexWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1452"]
  T11["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeTests::checkInsertSubnodeAtIndexWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1452"]
  T12["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeTests::checkInsertSubnodeAtIndexWithViewLoaded:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1452"]
  T13["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingViewsAndLayersViewBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1564"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingViewsAndLayersViewBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1564"]
  T15["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingViewsAndLayersViewBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1564"]
  T16["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingViewsAndLayersViewBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1564"]
  T17["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingViewsAndLayersViewBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1564"]
  T18["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeTests::testAppleBugInsertSubview<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1603"]
  T19["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeTests::testAppleBugInsertSubview<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1603"]
  T20["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1645"]
  T21["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1645"]
  T22["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeTests::testInsertSubviewAtIndexWithMeddlingView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1645"]
  T23["function:orderStringFromSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:49"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTests::testInsertSubnodeBelowWithView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1676"]
  T24["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeTests::testInsertSubnodeBelowWithNoView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1681"]
  T25["method:ASDisplayNodeTests::checkInsertSubnodeBelowWithView:layerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1697"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

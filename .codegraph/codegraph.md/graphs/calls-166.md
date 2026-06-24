# `calls 符号关系 - 166`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASButtonNodeSnapshotTests::testTintColorWithForegroundColorSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:68"]
  T1["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S1 -->|calls| T1
  S2["method:ASButtonNodeSnapshotTests::testTintColorWithForegroundColorSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:68"]
  T2["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S2 -->|calls| T2
  S3["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T4["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S4 -->|calls| T4
  S5["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T5["method:ASButtonNodeSnapshotTests::testImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:25"]
  S5 -->|calls| T5
  S6["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T6["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S6 -->|calls| T6
  S7["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T7["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S7 -->|calls| T7
  S8["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T8["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S8 -->|calls| T8
  S9["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T10["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S10 -->|calls| T10
  S11["method:ASButtonNodeTests::testAccessibility<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeTests.mm:20"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:ASButtonNodeTests::testAccessibilityWithoutATitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeTests.mm:59"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASButtonNodeTests::testUpdateTitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeTests.mm:69"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASCALayerTests::testDirtySublayerLayoutDoesntDirtySuperlayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCALayerTests.mm:53"]
  T14["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  S14 -->|calls| T14
  S15["method:ASCALayerTests::testDirtySuperlayerLayoutDoesntDirtySublayerLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCALayerTests.mm:69"]
  T15["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S15 -->|calls| T15
  S16["method:ASCALayerTests::testDirtySuperlayerLayoutDoesntDirtySublayerLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCALayerTests.mm:69"]
  T16["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  S16 -->|calls| T16
  S17["method:ASCALayerTests::testDirtyHierarchyIsLaidOutTopDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCALayerTests.mm:85"]
  T17["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  S17 -->|calls| T17
  S18["method:ASCALayerTests::testDirtyHierarchyIsLaidOutTopDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCALayerTests.mm:85"]
  T18["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  S18 -->|calls| T18
  S19["method:ASCellVisibilityTableViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:67"]
  T19["method:ASCellVisibilityTableViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:67"]
  S19 -->|calls| T19
  S20["method:ASCellVisibilityTableViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:67"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASCellVisibilityTableViewTestController::tableNode:nodeBlockForRowAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:85"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASCellVisibilityCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:112"]
  T22["method:ASCellVisibilityCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:112"]
  S22 -->|calls| T22
  S23["method:ASCellVisibilityCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:112"]
  T23["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S23 -->|calls| T23
  S24["method:ASCellVisibilityCollectionViewTestController::collectionNode:nodeBlockForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:131"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASCellVisibilityScrollEventTests::testTableNodeEvents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:147"]
  T25["method:ASCellVisibilityCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:112"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

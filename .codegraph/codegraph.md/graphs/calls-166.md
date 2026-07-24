# `calls 符号关系 - 166`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASButtonNodeTests::testAccessibility<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeTests.mm:20"]
  T1["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S1 -->|calls| T1
  S2["method:ASButtonNodeTests::testAccessibilityWithoutATitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeTests.mm:59"]
  T2["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S2 -->|calls| T2
  S3["method:ASButtonNodeTests::testUpdateTitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeTests.mm:69"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASCALayerTests::testDirtySublayerLayoutDoesntDirtySuperlayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCALayerTests.mm:53"]
  T4["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  S4 -->|calls| T4
  S5["method:ASCALayerTests::testDirtySuperlayerLayoutDoesntDirtySublayerLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCALayerTests.mm:69"]
  T5["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S5 -->|calls| T5
  S6["method:ASCALayerTests::testDirtySuperlayerLayoutDoesntDirtySublayerLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCALayerTests.mm:69"]
  T6["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  S6 -->|calls| T6
  S7["method:ASCALayerTests::testDirtyHierarchyIsLaidOutTopDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCALayerTests.mm:85"]
  T7["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  S7 -->|calls| T7
  S8["method:ASCALayerTests::testDirtyHierarchyIsLaidOutTopDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCALayerTests.mm:85"]
  T8["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  S8 -->|calls| T8
  S9["method:ASCellVisibilityTableViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:67"]
  T9["method:ASCellVisibilityTableViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:67"]
  S9 -->|calls| T9
  S10["method:ASCellVisibilityTableViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:67"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASCellVisibilityTableViewTestController::tableNode:nodeBlockForRowAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:85"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:ASCellVisibilityCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:112"]
  T12["method:ASCellVisibilityCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:112"]
  S12 -->|calls| T12
  S13["method:ASCellVisibilityCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:112"]
  T13["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S13 -->|calls| T13
  S14["method:ASCellVisibilityCollectionViewTestController::collectionNode:nodeBlockForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:131"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASCellVisibilityScrollEventTests::testTableNodeEvents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:147"]
  T15["method:ASCellVisibilityCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:112"]
  S15 -->|calls| T15
  S16["method:ASCellVisibilityScrollEventTests::testTableNodeEvents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:147"]
  T16["method:ASDisplayNode::bounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S16 -->|calls| T16
  S17["method:ASCellVisibilityScrollEventTests::testTableNodeEvents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:147"]
  T17["method:PhotoFeedTableViewController::scrollViewDidScroll<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/PhotoFeedTableViewController.swift:99"]
  S17 -->|calls| T17
  S18["method:ASCellVisibilityScrollEventTests::testCollectionNodeEvents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:183"]
  T18["method:ASCellVisibilityCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:112"]
  S18 -->|calls| T18
  S19["method:ASCellVisibilityScrollEventTests::testCollectionNodeEvents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCellVisibilityScrollEventTests.m:183"]
  T19["method:ASDisplayNode::bounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S19 -->|calls| T19
  S20["method:ASCenterLayoutSpecSnapshotTests::testWithOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:23"]
  T20["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  S20 -->|calls| T20
  S21["method:ASCenterLayoutSpecSnapshotTests::testWithOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:23"]
  T21["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  S21 -->|calls| T21
  S22["method:ASCenterLayoutSpecSnapshotTests::testWithOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:23"]
  T22["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  S22 -->|calls| T22
  S23["method:ASCenterLayoutSpecSnapshotTests::testWithOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:23"]
  T23["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  S23 -->|calls| T23
  S24["method:ASCenterLayoutSpecSnapshotTests::testWithSizingOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:31"]
  T24["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  S24 -->|calls| T24
  S25["method:ASCenterLayoutSpecSnapshotTests::testWithSizingOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:31"]
  T25["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

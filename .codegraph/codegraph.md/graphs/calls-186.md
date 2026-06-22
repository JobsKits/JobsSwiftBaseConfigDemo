# `calls 符号关系 - 186`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCenterLayoutSpecSnapshotTests::testWithSizingOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:31"]
  T1["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  S1 -->|calls| T1
  S2["method:ASCenterLayoutSpecSnapshotTests::testWithSizingOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:31"]
  T2["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  S2 -->|calls| T2
  S3["method:ASCenterLayoutSpecSnapshotTests::testWithSizingOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:31"]
  T3["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  S3 -->|calls| T3
  S4["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  T4["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S4 -->|calls| T4
  S5["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  T5["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S5 -->|calls| T5
  S6["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  T6["method:ASLayoutSpecSnapshotTestCase::testLayoutSpec:sizeRange:subnodes:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.mm:29"]
  S6 -->|calls| T6
  S7["method:ASCenterLayoutSpecSnapshotTests::testWithCenteringOptions:sizingOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:43"]
  T7["function:ASCenterLayoutSpecSnapshotTests::suffixForCenteringOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:64"]
  S7 -->|calls| T7
  S8["function:ASCenterLayoutSpecSnapshotTests::suffixForCenteringOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:64"]
  T8["method:ASMutableAttributedStringBuilder::string<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:234"]
  S8 -->|calls| T8
  S9["method:ASCenterLayoutSpecSnapshotTests::testMinimumSizeRangeIsGivenToChildWhenNotCentering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:88"]
  T9["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S9 -->|calls| T9
  S10["method:ASCenterLayoutSpecSnapshotTests::testMinimumSizeRangeIsGivenToChildWhenNotCentering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:88"]
  T10["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S10 -->|calls| T10
  S11["method:ASCenterLayoutSpecSnapshotTests::testMinimumSizeRangeIsGivenToChildWhenNotCentering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCenterLayoutSpecSnapshotTests.mm:88"]
  T11["method:ASLayoutSpecSnapshotTestCase::testLayoutSpec:sizeRange:subnodes:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.mm:29"]
  S11 -->|calls| T11
  S12["method:ASCollectionModernDataSourceTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:35"]
  T12["method:ASCollectionModernDataSourceTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:35"]
  S12 -->|calls| T12
  S13["method:ASCollectionModernDataSourceTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:35"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASCollectionModernDataSourceTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:73"]
  T14["method:ASCollectionNode::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1031"]
  S14 -->|calls| T14
  S15["method:ASCollectionModernDataSourceTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:73"]
  T15["method:ASCollectionModernDataSourceTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:73"]
  S15 -->|calls| T15
  S16["method:ASCollectionModernDataSourceTests::testInitialDataLoading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:81"]
  T16["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  S16 -->|calls| T16
  S17["method:ASCollectionModernDataSourceTests::testReloadingAnItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:86"]
  T17["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  S17 -->|calls| T17
  S18["method:ASCollectionModernDataSourceTests::testReloadingAnItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:86"]
  T18["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  S18 -->|calls| T18
  S19["method:ASCollectionModernDataSourceTests::testInsertingAnItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:101"]
  T19["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  S19 -->|calls| T19
  S20["method:ASCollectionModernDataSourceTests::testInsertingAnItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:101"]
  T20["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  S20 -->|calls| T20
  S21["method:ASCollectionModernDataSourceTests::testReloadingAnItemWithACompatibleNodeModel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:116"]
  T21["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  S21 -->|calls| T21
  S22["method:ASCollectionModernDataSourceTests::testReloadingAnItemWithACompatibleNodeModel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:116"]
  T22["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  S22 -->|calls| T22
  S23["method:ASCollectionModernDataSourceTests::testReloadingASection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:139"]
  T23["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  S23 -->|calls| T23
  S24["method:ASCollectionModernDataSourceTests::testReloadingASection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:139"]
  T24["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  S24 -->|calls| T24
  S25["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  T25["method:ASCollectionModernDataSourceTests::expectDataSourceCountMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:195"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

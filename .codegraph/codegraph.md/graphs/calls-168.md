# `calls 符号关系 - 168`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionModernDataSourceTests::testReloadingAnItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:86"]
  T1["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  S1 -->|calls| T1
  S2["method:ASCollectionModernDataSourceTests::testReloadingAnItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:86"]
  T2["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  S2 -->|calls| T2
  S3["method:ASCollectionModernDataSourceTests::testInsertingAnItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:101"]
  T3["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  S3 -->|calls| T3
  S4["method:ASCollectionModernDataSourceTests::testInsertingAnItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:101"]
  T4["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  S4 -->|calls| T4
  S5["method:ASCollectionModernDataSourceTests::testReloadingAnItemWithACompatibleNodeModel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:116"]
  T5["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  S5 -->|calls| T5
  S6["method:ASCollectionModernDataSourceTests::testReloadingAnItemWithACompatibleNodeModel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:116"]
  T6["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  S6 -->|calls| T6
  S7["method:ASCollectionModernDataSourceTests::testReloadingASection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:139"]
  T7["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  S7 -->|calls| T7
  S8["method:ASCollectionModernDataSourceTests::testReloadingASection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:139"]
  T8["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  S8 -->|calls| T8
  S9["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  T9["method:ASCollectionModernDataSourceTests::expectDataSourceCountMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:195"]
  S9 -->|calls| T9
  S10["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  T10["method:ASCollectionModernDataSourceTests::expectNodeModelMethodForItemAtIndexPath:nodeModel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:209"]
  S10 -->|calls| T10
  S11["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  T11["method:ASCollectionModernDataSourceTests::assertCollectionNodeContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:237"]
  S11 -->|calls| T11
  S12["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  T12["method:ASCollectionModernDataSourceTests::expectDataSourceCountMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:195"]
  S12 -->|calls| T12
  S13["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  T13["method:ASCollectionModernDataSourceTests::expectNodeModelMethodForItemAtIndexPath:nodeModel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:209"]
  S13 -->|calls| T13
  S14["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  T14["method:ASCollectionModernDataSourceTests::assertCollectionNodeContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:237"]
  S14 -->|calls| T14
  S15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:InspectorTestDataSource::collectionNode:nodeForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:35"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:InspectorTestDataSource::collectionNode:nodeBlockForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:40"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:InspectorTestDataSourceDelegateWithoutNodeConstrainedSize::collectionNode:nodeBlockForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:66"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewFlowLayoutInspectorTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:116"]
  T19["method:ASCollectionViewFlowLayoutInspectorTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:116"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewFlowLayoutInspectorTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:121"]
  T20["method:ASCollectionViewFlowLayoutInspectorTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:121"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:132"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:132"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:132"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:132"]
  T24["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheFooterDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:155"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

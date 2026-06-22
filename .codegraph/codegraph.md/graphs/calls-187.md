# `calls 符号关系 - 187`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  T1["method:ASCollectionModernDataSourceTests::expectNodeModelMethodForItemAtIndexPath:nodeModel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:209"]
  S1 -->|calls| T1
  S2["method:ASCollectionModernDataSourceTests::loadInitialData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:153"]
  T2["method:ASCollectionModernDataSourceTests::assertCollectionNodeContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:237"]
  S2 -->|calls| T2
  S3["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  T3["method:ASCollectionModernDataSourceTests::expectDataSourceCountMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:195"]
  S3 -->|calls| T3
  S4["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  T4["method:ASCollectionModernDataSourceTests::expectNodeModelMethodForItemAtIndexPath:nodeModel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:209"]
  S4 -->|calls| T4
  S5["method:ASCollectionModernDataSourceTests::performUpdateReloadingSections:reloadingItems:reloadMappings:insertingItems:deletingItems:skippedReloadIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:269"]
  T5["method:ASCollectionModernDataSourceTests::assertCollectionNodeContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:237"]
  S5 -->|calls| T5
  S6["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  T6["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S6 -->|calls| T6
  S7["method:InspectorTestDataSource::collectionNode:nodeForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:35"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:InspectorTestDataSource::collectionNode:nodeBlockForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:40"]
  T8["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S8 -->|calls| T8
  S9["method:InspectorTestDataSourceDelegateWithoutNodeConstrainedSize::collectionNode:nodeBlockForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:66"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewFlowLayoutInspectorTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:116"]
  T10["method:ASCollectionViewFlowLayoutInspectorTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:116"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewFlowLayoutInspectorTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:121"]
  T11["method:ASCollectionViewFlowLayoutInspectorTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:121"]
  S11 -->|calls| T11
  S12["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:132"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:132"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:132"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:132"]
  T15["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheFooterDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:155"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheFooterDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:155"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheFooterDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:155"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheFooterDelegateImplementation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:155"]
  T19["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderProperty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:179"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderProperty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:179"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheHeaderProperty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:179"]
  T22["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheFooterProperty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:200"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheFooterProperty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:200"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsAVerticalConstrainedSizeFromTheFooterProperty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:200"]
  T25["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

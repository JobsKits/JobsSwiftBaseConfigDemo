# `calls 符号关系 - 170`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsOneWhenAValidSizeIsImplementedOnTheLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:346"]
  T1["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsNoneWhenNoReferenceSizeIsImplemented<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:363"]
  T2["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsNoneWhenNoReferenceSizeIsImplemented<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:363"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsNoneWhenNoReferenceSizeIsImplemented<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:363"]
  T4["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewFlowLayoutInspectorTests::testThatItReturnsNoneWhenNoReferenceSizeIsImplemented<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:363"]
  T5["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewFlowLayoutInspectorTests::testThatItThrowsIfNodeConstrainedSizeIsImplementedOnDataSourceButNotOnDelegateLayoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:379"]
  T6["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewFlowLayoutInspectorTests::testThatItThrowsIfNodeConstrainedSizeIsImplementedOnDataSourceButNotOnDelegateLayoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:379"]
  T7["method:ASPagerNode::collectionNode:constrainedSizeForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:170"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewFlowLayoutInspectorTests::testThatItThrowsIfNodeConstrainedSizeIsImplementedOnDataSourceButNotOnDelegateLayoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:379"]
  T8["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewFlowLayoutInspectorTests::testThatItThrowsIfNodeConstrainedSizeIsImplementedOnDataSourceButNotOnDelegateLayoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:379"]
  T9["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewFlowLayoutInspectorTests::testThatItThrowsIfNodeConstrainedSizeIsImplementedOnDataSourceButNotOnDelegateFlowLayoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:404"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewFlowLayoutInspectorTests::testThatItThrowsIfNodeConstrainedSizeIsImplementedOnDataSourceButNotOnDelegateFlowLayoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:404"]
  T11["method:ASPagerNode::collectionNode:constrainedSizeForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerNode.mm:170"]
  S11 -->|calls| T11
  S12["method:ASCollectionViewFlowLayoutInspectorTests::testThatItThrowsIfNodeConstrainedSizeIsImplementedOnDataSourceButNotOnDelegateFlowLayoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewFlowLayoutInspectorTests.mm:404"]
  T12["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S12 -->|calls| T12
  S13["method:ASTextCellNodeWithSetSelectedCounter::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:44"]
  T13["method:ASTextCellNodeWithSetSelectedCounter::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:44"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewTestDelegate::initWithNumberOfSections:numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:77"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewTestDelegate::collectionNode:contextForSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:112"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewTestDelegate::collectionNode:nodeForSupplementaryElementOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:125"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewTestDelegate::collectionNode:willBeginBatchFetchWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:130"]
  T17["method:ASBatchContext::cancelBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:56"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  T18["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  T19["method:ASCollectionViewTestDelegate::initWithNumberOfSections:numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:77"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  T20["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:183"]
  T21["method:ASCollectionViewTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:183"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewTests::testDataSourceImplementsNecessaryMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:192"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewTests::testDataSourceImplementsNecessaryMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:192"]
  T23["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewTests::testDataSourceImplementsNecessaryMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:192"]
  T24["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewTests::testThatItSetsALayoutInspectorForFlowLayouts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:204"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

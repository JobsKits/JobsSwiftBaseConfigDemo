# `calls 符号关系 - 172`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewTests::testThatSubmittingAValidReloadDoesNotThrowAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:447"]
  T1["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewTests::testThatSubmittingAnInvalidInsertThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:455"]
  T2["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewTests::testThatSubmittingAnInvalidInsertThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:455"]
  T3["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewTests::testThatSubmittingAnInvalidDeleteThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:463"]
  T4["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewTests::testThatSubmittingAnInvalidDeleteThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:463"]
  T5["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewTests::testThatInsertingAnInvalidSectionThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:505"]
  T6["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewTests::testThatInsertingAnInvalidSectionThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:505"]
  T7["function:ASCollectionViewTests::testThatHavingAnIncorrectItemCountWithNoUpdatesThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:498"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewTests::testThatDeletingAndReloadingASectionThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:516"]
  T8["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewTests::testThatDeletingAndReloadingASectionThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:516"]
  T9["function:ASCollectionViewTests::testThatHavingAnIncorrectItemCountWithNoUpdatesThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:498"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewTests::testItemsInsertedIntoThePreloadRangeGetPreloaded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:529"]
  T10["method:ASCollectionNode::indexPathsForVisibleItems<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:927"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewTests::testItemsInsertedIntoThePreloadRangeGetPreloaded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:529"]
  T11["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S11 -->|calls| T11
  S12["method:ASCollectionViewTests::testCellNodeIndexPathConsistency<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:653"]
  T12["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S12 -->|calls| T12
  S13["method:ASCollectionViewTests::testThatDisappearingSupplementariesWithLayerBackedNodesDontFailAssert<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:697"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewTests::testThatDisappearingSupplementariesWithLayerBackedNodesDontFailAssert<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:697"]
  T14["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewTests::testThatDisappearingSupplementariesWithLayerBackedNodesDontFailAssert<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:697"]
  T15["method:ASCollectionViewTestDelegate::collectionNode:nodeForSupplementaryElementOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:125"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewTests::testThatDisappearingSupplementariesWithLayerBackedNodesDontFailAssert<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:697"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewTests::testThatDisappearingSupplementariesWithLayerBackedNodesDontFailAssert<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:697"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewTests::testThatDisappearingSupplementariesWithLayerBackedNodesDontFailAssert<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:697"]
  T18["method:ASCollectionViewTestDelegate::collectionView:layout:referenceSizeForHeaderInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:120"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewTests::testThatNodeCalculatedSizesAreUpdatedBeforeFirstPrepareLayoutAfterRotation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:743"]
  T19["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewTests::testThatNodeCalculatedSizesAreUpdatedBeforeFirstPrepareLayoutAfterRotation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:743"]
  T20["method:ASDisplayNode::bounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewTests::testThatNestedBatchCompletionsAreCalledInOrder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:784"]
  T21["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewTests::testThatSectionContextsAreCorrectAfterTheInitialLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:820"]
  T22["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewTests::testThatSectionContextsAreCorrectAfterSectionMove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:832"]
  T23["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewTests::testThatSectionContextsAreCorrectAfterReloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:861"]
  T24["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewTests::testThatSectionContextsAreCorrectAfterReloadASection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:878"]
  T25["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

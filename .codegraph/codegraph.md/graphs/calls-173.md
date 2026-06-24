# `calls 符号关系 - 173`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewTests::testThatDisappearingSupplementariesWithLayerBackedNodesDontFailAssert<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:697"]
  T1["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewTests::testThatDisappearingSupplementariesWithLayerBackedNodesDontFailAssert<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:697"]
  T2["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewTests::testThatDisappearingSupplementariesWithLayerBackedNodesDontFailAssert<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:697"]
  T3["method:ASCollectionViewTestDelegate::collectionView:layout:referenceSizeForHeaderInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:120"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewTests::testThatNodeCalculatedSizesAreUpdatedBeforeFirstPrepareLayoutAfterRotation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:743"]
  T4["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewTests::testThatNodeCalculatedSizesAreUpdatedBeforeFirstPrepareLayoutAfterRotation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:743"]
  T5["method:ASDisplayNode::bounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewTests::testThatNestedBatchCompletionsAreCalledInOrder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:784"]
  T6["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewTests::testThatSectionContextsAreCorrectAfterTheInitialLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:820"]
  T7["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewTests::testThatSectionContextsAreCorrectAfterSectionMove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:832"]
  T8["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewTests::testThatSectionContextsAreCorrectAfterReloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:861"]
  T9["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewTests::testThatSectionContextsAreCorrectAfterReloadASection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:878"]
  T10["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewTests::testThatIssuingAnUpdateBeforeInitialReloadIsAcceptable<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:897"]
  T11["method:ASCollectionViewTestDelegate::initWithNumberOfSections:numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:77"]
  S11 -->|calls| T11
  S12["method:ASCollectionViewTests::testThatNodeAtIndexPathIsCorrectImmediatelyAfterSubmittingUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:912"]
  T12["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S12 -->|calls| T12
  S13["method:ASCollectionViewTests::testThatNodeAtIndexPathIsCorrectImmediatelyAfterSubmittingUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:912"]
  T13["method:ASTextDebugOption::clear<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:103"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewTests::testThatNilBatchUpdatesCanBeSubmitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:947"]
  T14["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewTests::testThatDeletedItemsAreMarkedInvisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:957"]
  T15["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewTests::testThatDeletedItemsAreMarkedInvisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:957"]
  T16["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewTests::disabled_testThatMultipleBatchFetchesDontHappenUnnecessarily<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:980"]
  T17["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewTests::testThatBatchFetchHappensForEmptyCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1028"]
  T18["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewTests::testThatWeBatchFetchUntilContentRequirementIsMet_Animated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1055"]
  T19["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewTests::testThatWeBatchFetchUntilContentRequirementIsMet_Nonanimated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1060"]
  T20["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewTests::testThatWeBatchFetchUntilContentRequirementIsMet_Invisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1065"]
  T21["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewTests::testThatWhenWeBecomeVisibleWeWillFetchAdditionalContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1070"]
  T22["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewTests::testThatWhenWeBecomeVisibleWeWillFetchAdditionalContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1070"]
  T23["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewTests::testThatWhenWeBecomeVisibleWeWillFetchAdditionalContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1070"]
  T24["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  T25["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 192`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewTests::testThatSectionContextsAreCorrectAfterReloadASection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:878"]
  T1["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewTests::testThatIssuingAnUpdateBeforeInitialReloadIsAcceptable<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:897"]
  T2["method:ASCollectionViewTestDelegate::initWithNumberOfSections:numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:77"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewTests::testThatNodeAtIndexPathIsCorrectImmediatelyAfterSubmittingUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:912"]
  T3["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewTests::testThatNodeAtIndexPathIsCorrectImmediatelyAfterSubmittingUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:912"]
  T4["method:ASTextDebugOption::clear<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:103"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewTests::testThatNilBatchUpdatesCanBeSubmitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:947"]
  T5["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewTests::testThatDeletedItemsAreMarkedInvisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:957"]
  T6["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewTests::testThatDeletedItemsAreMarkedInvisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:957"]
  T7["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewTests::disabled_testThatMultipleBatchFetchesDontHappenUnnecessarily<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:980"]
  T8["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewTests::testThatBatchFetchHappensForEmptyCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1028"]
  T9["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewTests::testThatWeBatchFetchUntilContentRequirementIsMet_Animated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1055"]
  T10["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewTests::testThatWeBatchFetchUntilContentRequirementIsMet_Nonanimated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1060"]
  T11["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  S11 -->|calls| T11
  S12["method:ASCollectionViewTests::testThatWeBatchFetchUntilContentRequirementIsMet_Invisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1065"]
  T12["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  S12 -->|calls| T12
  S13["method:ASCollectionViewTests::testThatWhenWeBecomeVisibleWeWillFetchAdditionalContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1070"]
  T13["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewTests::testThatWhenWeBecomeVisibleWeWillFetchAdditionalContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1070"]
  T14["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewTests::testThatWhenWeBecomeVisibleWeWillFetchAdditionalContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1070"]
  T15["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewTests::_primitiveBatchFetchingFillTestAnimated:visible:controller:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1080"]
  T16["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewTests::testInitialRangeBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1151"]
  T17["method:ASCollectionViewTests::testInitialRangeBoundsWithCellLayoutMode:shouldWaitUntilAllUpdatesAreProcessed:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1163"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewTests::testInitialRangeBoundsCellLayoutModeAlwaysAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1157"]
  T18["method:ASCollectionViewTests::testInitialRangeBoundsWithCellLayoutMode:shouldWaitUntilAllUpdatesAreProcessed:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1163"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewTests::testInitialRangeBoundsWithCellLayoutMode:shouldWaitUntilAllUpdatesAreProcessed:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1163"]
  T19["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewTests::testInitialRangeBoundsWithCellLayoutMode:shouldWaitUntilAllUpdatesAreProcessed:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1163"]
  T20["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewTests::testTraitCollectionChangesMidUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1217"]
  T21["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewTests::testTraitCollectionChangesMidUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1217"]
  T22["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewTests::testTraitCollectionChangesMidUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1217"]
  T23["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewTests::testASPrimitiveTraitCollectionToUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1249"]
  T24["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewTests::testASPrimitiveTraitCollectionToUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:1249"]
  T25["function:ASPrimitiveTraitCollectionToUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:74"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

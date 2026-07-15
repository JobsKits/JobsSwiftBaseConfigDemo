# `calls 符号关系 - 197`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeTests::testThatSubnodeSafeAreaInsetsAreCalculatedCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2676"]
  T1["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeTests::testThatSubnodeSafeAreaInsetsAreCalculatedCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2676"]
  T2["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeTests::testThatSubnodeSafeAreaInsetsAreCalculatedCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2676"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeTests::testThatSubnodeSafeAreaInsetsAreCalculatedCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2676"]
  T4["function:ASConcatInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:90"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeTests::testThatSubnodeSafeAreaInsetsAreCalculatedCorrectly<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2676"]
  T5["function:ASConcatInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:90"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeTests::testScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2722"]
  T6["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeTests::testThatIfViewClassIsOverwrittenItsSynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2727"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeTests::testThatIfViewClassIsOverwrittenItsSynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2727"]
  T8["method:ASLayoutTransition::isSynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:81"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeTests::testThatIfLayerClassIsOverwrittenItsSynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2733"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeTests::testThatIfLayerClassIsOverwrittenItsSynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2733"]
  T10["method:ASLayoutTransition::isSynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:81"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeTests::testCornerRoundingTypeClippingRoundedCornersIsUsingASDisplayNodeCornerLayerDelegate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2739"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeTests::testLayerActionForKeyIsCalled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2751"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeTests::testLayerActionForKeyIsCalled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2751"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeTests::testPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2765"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeTests::testInsertExistingSubnode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2786"]
  T15["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S15 -->|calls| T15
  S16["function:ASDisplayNodeRunRunLoopUntilBlockIsTrue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:25"]
  T16["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S16 -->|calls| T16
  S17["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  T17["function:ASCATransactionQueueGet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  S17 -->|calls| T17
  S18["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsAccessors<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:36"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsAccessors<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:36"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASDisplayViewAccessibilityTests::testThatSubnodeAccessibilityLabelAggregationWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:60"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASDisplayViewAccessibilityTests::testThatSubnodeAccessibilityLabelAggregationWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:60"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASDisplayViewAccessibilityTests::testThatSubnodeAccessibilityLabelAggregationWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:60"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASDisplayViewAccessibilityTests::testThatContainerAccessibilityLabelOverrideStopsAggregation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:88"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASDisplayViewAccessibilityTests::testThatContainerAccessibilityLabelOverrideStopsAggregation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:88"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASDisplayViewAccessibilityTests::testAccessibilityLayerBackedContainerWithinAccessibilityContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:113"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

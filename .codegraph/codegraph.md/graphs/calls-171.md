# `calls 符号关系 - 171`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewTests::testThatADefaultLayoutInspectorIsProvidedForCustomLayouts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:212"]
  T1["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewTests::testThatADefaultLayoutInspectorIsProvidedForCustomLayouts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:212"]
  T2["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewTests::testThatRegisteringASupplementaryNodeStoresItForIntrospection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:220"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewTests::testThatRegisteringASupplementaryNodeStoresItForIntrospection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:220"]
  T4["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewTests::testReloadIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:228"]
  T5["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewTests::testReloadIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:228"]
  T6["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewTests::testReloadIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:228"]
  T7["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewTests::testSelection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:254"]
  T8["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewTests::testSelection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:254"]
  T9["method:ASDisplayNode::bounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewTests::testTuningParametersWithExplicitRangeMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:337"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewTests::testTuningParametersWithExplicitRangeMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:337"]
  T11["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S11 -->|calls| T11
  S12["method:ASCollectionViewTests::testTuningParametersWithExplicitRangeMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:337"]
  T12["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S12 -->|calls| T12
  S13["method:ASCollectionViewTests::testTuningParametersWithExplicitRangeMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:337"]
  T13["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewTests::testTuningParametersWithExplicitRangeMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:337"]
  T14["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewTests::testTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:362"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewTests::testTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:362"]
  T16["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewTests::testTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:362"]
  T17["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewTests::testTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:362"]
  T18["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewTests::testThatCollectionNodeCanHandleNilRangeController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:378"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewTests::testThatCollectionNodeCanHandleNilRangeController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:378"]
  T20["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewTests::testThatCollectionNodeConformsToExpectedProtocols<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:392"]
  T21["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewTests::testThatCollectionNodeConformsToExpectedProtocols<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:392"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewTests::testInvertedCollectionViewHitTest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:401"]
  T23["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewTests::testInvertedCollectionViewHitTest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:401"]
  T24["method:ASDisplayNode::bounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewTests::testThatSubmittingAValidInsertDoesNotThrowAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:438"]
  T25["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

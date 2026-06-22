# `calls 符号关系 - 190`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewTests::testThatItSetsALayoutInspectorForFlowLayouts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:204"]
  T1["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewTests::testThatADefaultLayoutInspectorIsProvidedForCustomLayouts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:212"]
  T2["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewTests::testThatADefaultLayoutInspectorIsProvidedForCustomLayouts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:212"]
  T3["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewTests::testThatRegisteringASupplementaryNodeStoresItForIntrospection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:220"]
  T4["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewTests::testThatRegisteringASupplementaryNodeStoresItForIntrospection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:220"]
  T5["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewTests::testReloadIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:228"]
  T6["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewTests::testReloadIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:228"]
  T7["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewTests::testReloadIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:228"]
  T8["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewTests::testSelection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:254"]
  T9["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewTests::testSelection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:254"]
  T10["method:ASDisplayNode::bounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewTests::testTuningParametersWithExplicitRangeMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:337"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
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
  S15["method:ASCollectionViewTests::testTuningParametersWithExplicitRangeMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:337"]
  T15["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewTests::testTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:362"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewTests::testTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:362"]
  T17["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewTests::testTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:362"]
  T18["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewTests::testTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:362"]
  T19["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewTests::testThatCollectionNodeCanHandleNilRangeController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:378"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewTests::testThatCollectionNodeCanHandleNilRangeController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:378"]
  T21["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewTests::testThatCollectionNodeConformsToExpectedProtocols<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:392"]
  T22["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewTests::testThatCollectionNodeConformsToExpectedProtocols<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:392"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewTests::testInvertedCollectionViewHitTest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:401"]
  T24["method:ASCollectionViewTestController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:151"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewTests::testInvertedCollectionViewHitTest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:401"]
  T25["method:ASDisplayNode::bounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

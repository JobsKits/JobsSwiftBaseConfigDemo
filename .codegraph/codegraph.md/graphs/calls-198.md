# `calls 符号关系 - 198`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  T1["function:ASCATransactionQueueGet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  S1 -->|calls| T1
  S2["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsAccessors<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:36"]
  T2["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S2 -->|calls| T2
  S3["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsAccessors<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:36"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASDisplayViewAccessibilityTests::testThatSubnodeAccessibilityLabelAggregationWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:60"]
  T4["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S4 -->|calls| T4
  S5["method:ASDisplayViewAccessibilityTests::testThatSubnodeAccessibilityLabelAggregationWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:60"]
  T5["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S5 -->|calls| T5
  S6["method:ASDisplayViewAccessibilityTests::testThatSubnodeAccessibilityLabelAggregationWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:60"]
  T6["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S6 -->|calls| T6
  S7["method:ASDisplayViewAccessibilityTests::testThatContainerAccessibilityLabelOverrideStopsAggregation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:88"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:ASDisplayViewAccessibilityTests::testThatContainerAccessibilityLabelOverrideStopsAggregation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:88"]
  T8["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S8 -->|calls| T8
  S9["method:ASDisplayViewAccessibilityTests::testAccessibilityLayerBackedContainerWithinAccessibilityContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:113"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASDisplayViewAccessibilityTests::testAccessibilityLayerBackedContainerWithinAccessibilityContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:113"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASDisplayViewAccessibilityTests::testAccessibilityLayerBackedContainerWithinAccessibilityContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:113"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:ASDisplayViewAccessibilityTests::testAccessibilityLayerBackedContainerWithinAccessibilityContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:113"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASDisplayViewAccessibilityTests::testAccessibilityNonLayerbackedNodesOperationInNonContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:147"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASDisplayViewAccessibilityTests::testAccessibilityNonLayerbackedNodesOperationInNonContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:147"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASDisplayViewAccessibilityTests::testAccessibilityNonLayerbackedNodesOperationInNonContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:147"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASDisplayViewAccessibilityTests::testAccessibilityNonLayerbackedNodesOperationInNonContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:147"]
  T16["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S16 -->|calls| T16
  S17["method:ASDisplayViewAccessibilityTests::testAccessibilityNonLayerbackedNodesOperationInNonContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:147"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASDisplayViewAccessibilityTests::testAccessibilityNonLayerbackedNodesOperationInNonContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:147"]
  T18["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S18 -->|calls| T18
  S19["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsAreNilForWrappedWKWebView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:191"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASDisplayViewAccessibilityTests::testActionForwarding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:222"]
  T20["method:_ASDisplayView::accessibilityActivate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:365"]
  S20 -->|calls| T20
  S21["method:ASDisplayViewAccessibilityTests::testActionForwarding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:222"]
  T21["method:_ASDisplayView::accessibilityActivate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:365"]
  S21 -->|calls| T21
  S22["method:ASDisplayViewAccessibilityTests::testActionForwarding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:222"]
  T22["method:_ASDisplayView::accessibilityIncrement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:369"]
  S22 -->|calls| T22
  S23["method:ASDisplayViewAccessibilityTests::testActionForwarding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:222"]
  T23["method:_ASDisplayView::accessibilityIncrement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:369"]
  S23 -->|calls| T23
  S24["method:ASDisplayViewAccessibilityTests::testActionForwarding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:222"]
  T24["method:_ASDisplayView::accessibilityDecrement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:373"]
  S24 -->|calls| T24
  S25["method:ASDisplayViewAccessibilityTests::testActionForwarding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:222"]
  T25["method:_ASDisplayView::accessibilityDecrement<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:373"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

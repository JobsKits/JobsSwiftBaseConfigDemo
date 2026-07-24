# `calls 符号关系 - 163`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBatchFetchingTests::testVerticalScrollingSmallContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:189"]
  T1["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S1 -->|calls| T1
  S2["method:ASBatchFetchingTests::testVerticalScrollingSmallContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:189"]
  T2["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S2 -->|calls| T2
  S3["method:ASBatchFetchingTests::testVerticalScrollingSmallContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:189"]
  T3["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S3 -->|calls| T3
  S4["method:ASBatchFetchingTests::testHorizontalScrollingSmallContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:205"]
  T4["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S4 -->|calls| T4
  S5["method:ASBatchFetchingTests::testHorizontalScrollingSmallContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:205"]
  T5["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S5 -->|calls| T5
  S6["method:ASBatchFetchingTests::testHorizontalScrollingSmallContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:205"]
  T6["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S6 -->|calls| T6
  S7["method:ASBatchFetchingTests::testHorizontalScrollingSmallContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:205"]
  T7["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S7 -->|calls| T7
  S8["method:ASBridgedPropertiesTestView::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:29"]
  T8["method:ASBridgedPropertiesTestView::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:29"]
  S8 -->|calls| T8
  S9["method:ASBridgedPropertiesTestView::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:35"]
  T9["method:ASBridgedPropertiesTestView::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:35"]
  S9 -->|calls| T9
  S10["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  T10["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S10 -->|calls| T10
  S11["method:ASBridgedPropertiesTests::testTheresASharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:75"]
  T11["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S11 -->|calls| T11
  S12["method:ASBridgedPropertiesTests::DISABLED_testThatDirtyNodesAreNotRetained<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:84"]
  T12["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S12 -->|calls| T12
  S13["method:ASBridgedPropertiesTests::DISABLED_testThatDirtyNodesAreNotRetained<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:84"]
  T13["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S13 -->|calls| T13
  S14["method:ASBridgedPropertiesTests::DISABLED_testThatDirtyNodesAreNotRetained<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:84"]
  T14["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S14 -->|calls| T14
  S15["method:ASBridgedPropertiesTests::testThatSettingABridgedViewPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:104"]
  T15["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S15 -->|calls| T15
  S16["method:ASBridgedPropertiesTests::testThatSettingABridgedViewPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:104"]
  T16["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S16 -->|calls| T16
  S17["method:ASBridgedPropertiesTests::testThatSettingABridgedViewPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:104"]
  T17["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S17 -->|calls| T17
  S18["method:ASBridgedPropertiesTests::testThatSettingABridgedLayerPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:117"]
  T18["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S18 -->|calls| T18
  S19["method:ASBridgedPropertiesTests::testThatSettingABridgedLayerPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:117"]
  T19["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S19 -->|calls| T19
  S20["method:ASBridgedPropertiesTests::testThatSettingABridgedLayerPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:117"]
  T20["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S20 -->|calls| T20
  S21["method:ASBridgedPropertiesTests::testThatReadingABridgedViewPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:130"]
  T21["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S21 -->|calls| T21
  S22["method:ASBridgedPropertiesTests::testThatReadingABridgedViewPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:130"]
  T22["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S22 -->|calls| T22
  S23["method:ASBridgedPropertiesTests::testThatReadingABridgedViewPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:130"]
  T23["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S23 -->|calls| T23
  S24["method:ASBridgedPropertiesTests::testThatReadingABridgedLayerPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:139"]
  T24["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S24 -->|calls| T24
  S25["method:ASBridgedPropertiesTests::testThatReadingABridgedLayerPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:139"]
  T25["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

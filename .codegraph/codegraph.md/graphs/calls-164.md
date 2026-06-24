# `calls 符号关系 - 164`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBridgedPropertiesTests::testThatSettingABridgedViewPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:104"]
  T1["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S1 -->|calls| T1
  S2["method:ASBridgedPropertiesTests::testThatSettingABridgedViewPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:104"]
  T2["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S2 -->|calls| T2
  S3["method:ASBridgedPropertiesTests::testThatSettingABridgedLayerPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:117"]
  T3["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S3 -->|calls| T3
  S4["method:ASBridgedPropertiesTests::testThatSettingABridgedLayerPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:117"]
  T4["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S4 -->|calls| T4
  S5["method:ASBridgedPropertiesTests::testThatSettingABridgedLayerPropertyInBackgroundGetsFlushedOnNextRunLoop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:117"]
  T5["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S5 -->|calls| T5
  S6["method:ASBridgedPropertiesTests::testThatReadingABridgedViewPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:130"]
  T6["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S6 -->|calls| T6
  S7["method:ASBridgedPropertiesTests::testThatReadingABridgedViewPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:130"]
  T7["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S7 -->|calls| T7
  S8["method:ASBridgedPropertiesTests::testThatReadingABridgedViewPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:130"]
  T8["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S8 -->|calls| T8
  S9["method:ASBridgedPropertiesTests::testThatReadingABridgedLayerPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:139"]
  T9["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S9 -->|calls| T9
  S10["method:ASBridgedPropertiesTests::testThatReadingABridgedLayerPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:139"]
  T10["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S10 -->|calls| T10
  S11["method:ASBridgedPropertiesTests::testThatReadingABridgedLayerPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:139"]
  T11["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S11 -->|calls| T11
  S12["method:ASBridgedPropertiesTests::testThatSettingTintColorSetNeedsDisplayOnView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:148"]
  T12["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S12 -->|calls| T12
  S13["method:ASBridgedPropertiesTests::testThatSettingTintColorSetNeedsDisplayOnView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:148"]
  T13["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S13 -->|calls| T13
  S14["method:ASBridgedPropertiesTests::testThatSettingTintColorSetNeedsDisplayOnView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:148"]
  T14["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  S14 -->|calls| T14
  S15["method:ASBridgedPropertiesTests::testThatManuallyFlushingTheSyncControllerImmediatelyAppliesChanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:168"]
  T15["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S15 -->|calls| T15
  S16["method:ASBridgedPropertiesTests::testThatManuallyFlushingTheSyncControllerImmediatelyAppliesChanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:168"]
  T16["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S16 -->|calls| T16
  S17["method:ASBridgedPropertiesTests::testThatManuallyFlushingTheSyncControllerImmediatelyAppliesChanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:168"]
  T17["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S17 -->|calls| T17
  S18["method:ASBridgedPropertiesTests::testThatManuallyFlushingTheSyncControllerImmediatelyAppliesChanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:168"]
  T18["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  S18 -->|calls| T18
  S19["method:ASBridgedPropertiesTests::testThatFlushingTheControllerInBackgroundThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:183"]
  T19["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S19 -->|calls| T19
  S20["method:ASBridgedPropertiesTests::testThatFlushingTheControllerInBackgroundThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:183"]
  T20["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S20 -->|calls| T20
  S21["method:ASBridgedPropertiesTests::testThatFlushingTheControllerInBackgroundThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:183"]
  T21["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S21 -->|calls| T21
  S22["method:ASBridgedPropertiesTests::testThatFlushingTheControllerInBackgroundThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:183"]
  T22["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S22 -->|calls| T22
  S23["method:ASBridgedPropertiesTests::testThatFlushingTheControllerInBackgroundThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:183"]
  T23["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  S23 -->|calls| T23
  S24["method:ASBridgedPropertiesTests::testThatSettingABridgedPropertyOnMainThreadPassesDirectlyToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:195"]
  T24["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S24 -->|calls| T24
  S25["method:ASBridgedPropertiesTests::testThatSettingABridgedPropertyOnMainThreadPassesDirectlyToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:195"]
  T25["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

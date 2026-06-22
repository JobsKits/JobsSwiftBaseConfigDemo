# `calls 符号关系 - 183`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBridgedPropertiesTests::testThatReadingABridgedLayerPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:139"]
  T1["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S1 -->|calls| T1
  S2["method:ASBridgedPropertiesTests::testThatReadingABridgedLayerPropertyInBackgroundThrowsAnException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:139"]
  T2["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S2 -->|calls| T2
  S3["method:ASBridgedPropertiesTests::testThatSettingTintColorSetNeedsDisplayOnView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:148"]
  T3["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S3 -->|calls| T3
  S4["method:ASBridgedPropertiesTests::testThatSettingTintColorSetNeedsDisplayOnView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:148"]
  T4["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S4 -->|calls| T4
  S5["method:ASBridgedPropertiesTests::testThatSettingTintColorSetNeedsDisplayOnView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:148"]
  T5["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  S5 -->|calls| T5
  S6["method:ASBridgedPropertiesTests::testThatManuallyFlushingTheSyncControllerImmediatelyAppliesChanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:168"]
  T6["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S6 -->|calls| T6
  S7["method:ASBridgedPropertiesTests::testThatManuallyFlushingTheSyncControllerImmediatelyAppliesChanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:168"]
  T7["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S7 -->|calls| T7
  S8["method:ASBridgedPropertiesTests::testThatManuallyFlushingTheSyncControllerImmediatelyAppliesChanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:168"]
  T8["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S8 -->|calls| T8
  S9["method:ASBridgedPropertiesTests::testThatManuallyFlushingTheSyncControllerImmediatelyAppliesChanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:168"]
  T9["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  S9 -->|calls| T9
  S10["method:ASBridgedPropertiesTests::testThatFlushingTheControllerInBackgroundThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:183"]
  T10["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S10 -->|calls| T10
  S11["method:ASBridgedPropertiesTests::testThatFlushingTheControllerInBackgroundThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:183"]
  T11["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S11 -->|calls| T11
  S12["method:ASBridgedPropertiesTests::testThatFlushingTheControllerInBackgroundThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:183"]
  T12["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S12 -->|calls| T12
  S13["method:ASBridgedPropertiesTests::testThatFlushingTheControllerInBackgroundThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:183"]
  T13["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S13 -->|calls| T13
  S14["method:ASBridgedPropertiesTests::testThatFlushingTheControllerInBackgroundThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:183"]
  T14["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  S14 -->|calls| T14
  S15["method:ASBridgedPropertiesTests::testThatSettingABridgedPropertyOnMainThreadPassesDirectlyToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:195"]
  T15["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S15 -->|calls| T15
  S16["method:ASBridgedPropertiesTests::testThatSettingABridgedPropertyOnMainThreadPassesDirectlyToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:195"]
  T16["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S16 -->|calls| T16
  S17["method:ASBridgedPropertiesTests::testThatSettingABridgedPropertyOnMainThreadPassesDirectlyToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:195"]
  T17["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S17 -->|calls| T17
  S18["method:ASBridgedPropertiesTests::testThatSettingABridgedPropertyOnMainThreadPassesDirectlyToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:195"]
  T18["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S18 -->|calls| T18
  S19["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:209"]
  T19["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S19 -->|calls| T19
  S20["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:209"]
  T20["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S20 -->|calls| T20
  S21["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:209"]
  T21["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S21 -->|calls| T21
  S22["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutOnACellNodeFromBackgroundIsSafe<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:222"]
  T22["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S22 -->|calls| T22
  S23["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutOnACellNodeFromBackgroundIsSafe<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:222"]
  T23["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S23 -->|calls| T23
  S24["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutOnACellNodeFromBackgroundIsSafe<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:222"]
  T24["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S24 -->|calls| T24
  S25["method:ASBridgedPropertiesTests::testThatCallingSetNeedsDisplayFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:231"]
  T25["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

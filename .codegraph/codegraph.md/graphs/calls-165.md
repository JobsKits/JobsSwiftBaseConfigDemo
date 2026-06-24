# `calls 符号关系 - 165`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBridgedPropertiesTests::testThatSettingABridgedPropertyOnMainThreadPassesDirectlyToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:195"]
  T1["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S1 -->|calls| T1
  S2["method:ASBridgedPropertiesTests::testThatSettingABridgedPropertyOnMainThreadPassesDirectlyToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:195"]
  T2["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S2 -->|calls| T2
  S3["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:209"]
  T3["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S3 -->|calls| T3
  S4["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:209"]
  T4["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S4 -->|calls| T4
  S5["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:209"]
  T5["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S5 -->|calls| T5
  S6["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutOnACellNodeFromBackgroundIsSafe<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:222"]
  T6["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S6 -->|calls| T6
  S7["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutOnACellNodeFromBackgroundIsSafe<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:222"]
  T7["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S7 -->|calls| T7
  S8["method:ASBridgedPropertiesTests::testThatCallingSetNeedsLayoutOnACellNodeFromBackgroundIsSafe<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:222"]
  T8["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S8 -->|calls| T8
  S9["method:ASBridgedPropertiesTests::testThatCallingSetNeedsDisplayFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:231"]
  T9["function:ASDispatchSyncOnOtherThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:61"]
  S9 -->|calls| T9
  S10["method:ASBridgedPropertiesTests::testThatCallingSetNeedsDisplayFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:231"]
  T10["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  S10 -->|calls| T10
  S11["method:ASBridgedPropertiesTests::testThatCallingSetNeedsDisplayFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:231"]
  T11["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S11 -->|calls| T11
  S12["method:ASButtonNodeSnapshotTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:19"]
  T12["method:ASButtonNodeSnapshotTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:19"]
  S12 -->|calls| T12
  S13["method:ASButtonNodeSnapshotTests::testTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:33"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASButtonNodeSnapshotTests::testTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:33"]
  T14["method:ASButtonNodeSnapshotTests::testImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:25"]
  S14 -->|calls| T14
  S15["method:ASButtonNodeSnapshotTests::testTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:33"]
  T15["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S15 -->|calls| T15
  S16["method:ASButtonNodeSnapshotTests::testTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:33"]
  T16["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S16 -->|calls| T16
  S17["method:ASButtonNodeSnapshotTests::testTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:33"]
  T17["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S17 -->|calls| T17
  S18["method:ASButtonNodeSnapshotTests::testChangingTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:49"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASButtonNodeSnapshotTests::testChangingTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:49"]
  T19["method:ASButtonNodeSnapshotTests::testImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:25"]
  S19 -->|calls| T19
  S20["method:ASButtonNodeSnapshotTests::testChangingTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:49"]
  T20["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S20 -->|calls| T20
  S21["method:ASButtonNodeSnapshotTests::testChangingTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:49"]
  T21["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S21 -->|calls| T21
  S22["method:ASButtonNodeSnapshotTests::testChangingTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:49"]
  T22["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S22 -->|calls| T22
  S23["method:ASButtonNodeSnapshotTests::testTintColorWithForegroundColorSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:68"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASButtonNodeSnapshotTests::testTintColorWithForegroundColorSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:68"]
  T24["method:ASButtonNodeSnapshotTests::testImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:25"]
  S24 -->|calls| T24
  S25["method:ASButtonNodeSnapshotTests::testTintColorWithForegroundColorSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:68"]
  T25["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

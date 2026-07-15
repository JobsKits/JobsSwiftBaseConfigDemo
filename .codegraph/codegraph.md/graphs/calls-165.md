# `calls 符号关系 - 165`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBridgedPropertiesTests::testThatCallingSetNeedsDisplayFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:231"]
  T1["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  S1 -->|calls| T1
  S2["method:ASBridgedPropertiesTests::testThatCallingSetNeedsDisplayFromBackgroundCausesItToHappenLater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:231"]
  T2["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S2 -->|calls| T2
  S3["method:ASButtonNodeSnapshotTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:19"]
  T3["method:ASButtonNodeSnapshotTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:19"]
  S3 -->|calls| T3
  S4["method:ASButtonNodeSnapshotTests::testTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:33"]
  T4["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S4 -->|calls| T4
  S5["method:ASButtonNodeSnapshotTests::testTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:33"]
  T5["method:ASButtonNodeSnapshotTests::testImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:25"]
  S5 -->|calls| T5
  S6["method:ASButtonNodeSnapshotTests::testTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:33"]
  T6["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S6 -->|calls| T6
  S7["method:ASButtonNodeSnapshotTests::testTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:33"]
  T7["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S7 -->|calls| T7
  S8["method:ASButtonNodeSnapshotTests::testTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:33"]
  T8["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S8 -->|calls| T8
  S9["method:ASButtonNodeSnapshotTests::testChangingTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:49"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASButtonNodeSnapshotTests::testChangingTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:49"]
  T10["method:ASButtonNodeSnapshotTests::testImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:25"]
  S10 -->|calls| T10
  S11["method:ASButtonNodeSnapshotTests::testChangingTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:49"]
  T11["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S11 -->|calls| T11
  S12["method:ASButtonNodeSnapshotTests::testChangingTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:49"]
  T12["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S12 -->|calls| T12
  S13["method:ASButtonNodeSnapshotTests::testChangingTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:49"]
  T13["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S13 -->|calls| T13
  S14["method:ASButtonNodeSnapshotTests::testTintColorWithForegroundColorSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:68"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASButtonNodeSnapshotTests::testTintColorWithForegroundColorSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:68"]
  T15["method:ASButtonNodeSnapshotTests::testImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:25"]
  S15 -->|calls| T15
  S16["method:ASButtonNodeSnapshotTests::testTintColorWithForegroundColorSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:68"]
  T16["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S16 -->|calls| T16
  S17["method:ASButtonNodeSnapshotTests::testTintColorWithForegroundColorSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:68"]
  T17["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S17 -->|calls| T17
  S18["method:ASButtonNodeSnapshotTests::testTintColorWithForegroundColorSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:68"]
  T18["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S18 -->|calls| T18
  S19["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T21["method:ASButtonNodeSnapshotTests::testImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:25"]
  S21 -->|calls| T21
  S22["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T22["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S22 -->|calls| T22
  S23["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T23["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S23 -->|calls| T23
  S24["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T24["function:ASDisplayNodeSizeToFitSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:45"]
  S24 -->|calls| T24
  S25["method:ASButtonNodeSnapshotTests::testTintColorWithInheritedTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASButtonNodeSnapshotTests.mm:83"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

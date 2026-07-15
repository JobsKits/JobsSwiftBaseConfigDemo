# `calls 符号关系 - 179`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDimensionTests::testIntersectingSizeRangeWithRangeContainedWithinItReturnsContainedRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:67"]
  T1["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S1 -->|calls| T1
  S2["method:ASDimensionTests::testIntersectingSizeRangeWithRangeContainedWithinItReturnsContainedRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:67"]
  T2["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S2 -->|calls| T2
  S3["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToRightReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:80"]
  T3["function:ASSizeRangeIntersect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S3 -->|calls| T3
  S4["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToRightReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:80"]
  T4["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S4 -->|calls| T4
  S5["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToRightReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:80"]
  T5["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S5 -->|calls| T5
  S6["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToRightReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:80"]
  T6["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S6 -->|calls| T6
  S7["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToLeftReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:93"]
  T7["function:ASSizeRangeIntersect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S7 -->|calls| T7
  S8["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToLeftReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:93"]
  T8["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S8 -->|calls| T8
  S9["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToLeftReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:93"]
  T9["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S9 -->|calls| T9
  S10["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToLeftReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:93"]
  T10["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S10 -->|calls| T10
  S11["method:ASDispatchTests::testDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:19"]
  T11["function:ASDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S11 -->|calls| T11
  S12["method:ASDispatchTests::testDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:19"]
  T12["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S12 -->|calls| T12
  S13["method:ASDispatchTests::testDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:19"]
  T13["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S13 -->|calls| T13
  S14["method:ASDispatchTests::testDispatchAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:39"]
  T14["function:ASDispatchAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDispatch.mm:33"]
  S14 -->|calls| T14
  S15["method:ASDispatchTests::testDispatchAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:39"]
  T15["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S15 -->|calls| T15
  S16["method:ASDispatchTests::testDispatchAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:39"]
  T16["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S16 -->|calls| T16
  S17["method:_ASDisplayLayerTestLayer::display<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:97"]
  T17["method:_ASDisplayLayerTestLayer::display<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:97"]
  S17 -->|calls| T17
  S18["method:_ASDisplayLayerTestLayer::cancelAsyncDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:105"]
  T18["method:_ASDisplayLayerTestLayer::cancelAsyncDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:105"]
  S18 -->|calls| T18
  S19["method:_ASDisplayLayerTestDelegate::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:212"]
  T19["function:bogusImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:20"]
  S19 -->|calls| T19
  S20["method:_ASDisplayLayerTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:240"]
  T20["method:_ASDisplayLayerTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:240"]
  S20 -->|calls| T20
  S21["method:_ASDisplayLayerTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:240"]
  T21["function:bogusImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:20"]
  S21 -->|calls| T21
  S22["method:_ASDisplayLayerTests::waitForDisplayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:259"]
  T22["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S22 -->|calls| T22
  S23["method:_ASDisplayLayerTests::waitForDisplayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:259"]
  T23["function:ASDisplayNodeRunRunLoopUntilBlockIsTrue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:25"]
  S23 -->|calls| T23
  S24["method:_ASDisplayLayerTests::waitForLayer:asyncDisplayCount:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:269"]
  T24["function:ASDisplayNodeRunRunLoopUntilBlockIsTrue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:25"]
  S24 -->|calls| T24
  S25["method:_ASDisplayLayerTests::waitForAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:278"]
  T25["function:ASDisplayNodeRunRunLoopUntilBlockIsTrue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

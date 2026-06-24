# `calls 符号关系 - 179`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDimensionTests::testIntersectingOverlappingSizeRangesReturnsTheirIntersection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:41"]
  T1["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S1 -->|calls| T1
  S2["method:ASDimensionTests::testIntersectingOverlappingSizeRangesReturnsTheirIntersection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:41"]
  T2["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S2 -->|calls| T2
  S3["method:ASDimensionTests::testIntersectingOverlappingSizeRangesReturnsTheirIntersection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:41"]
  T3["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S3 -->|calls| T3
  S4["method:ASDimensionTests::testIntersectingSizeRangeWithRangeThatContainsItReturnsSameRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:54"]
  T4["function:ASSizeRangeIntersect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S4 -->|calls| T4
  S5["method:ASDimensionTests::testIntersectingSizeRangeWithRangeThatContainsItReturnsSameRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:54"]
  T5["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S5 -->|calls| T5
  S6["method:ASDimensionTests::testIntersectingSizeRangeWithRangeThatContainsItReturnsSameRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:54"]
  T6["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S6 -->|calls| T6
  S7["method:ASDimensionTests::testIntersectingSizeRangeWithRangeThatContainsItReturnsSameRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:54"]
  T7["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S7 -->|calls| T7
  S8["method:ASDimensionTests::testIntersectingSizeRangeWithRangeContainedWithinItReturnsContainedRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:67"]
  T8["function:ASSizeRangeIntersect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S8 -->|calls| T8
  S9["method:ASDimensionTests::testIntersectingSizeRangeWithRangeContainedWithinItReturnsContainedRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:67"]
  T9["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S9 -->|calls| T9
  S10["method:ASDimensionTests::testIntersectingSizeRangeWithRangeContainedWithinItReturnsContainedRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:67"]
  T10["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S10 -->|calls| T10
  S11["method:ASDimensionTests::testIntersectingSizeRangeWithRangeContainedWithinItReturnsContainedRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:67"]
  T11["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S11 -->|calls| T11
  S12["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToRightReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:80"]
  T12["function:ASSizeRangeIntersect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S12 -->|calls| T12
  S13["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToRightReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:80"]
  T13["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S13 -->|calls| T13
  S14["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToRightReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:80"]
  T14["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S14 -->|calls| T14
  S15["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToRightReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:80"]
  T15["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S15 -->|calls| T15
  S16["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToLeftReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:93"]
  T16["function:ASSizeRangeIntersect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S16 -->|calls| T16
  S17["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToLeftReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:93"]
  T17["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S17 -->|calls| T17
  S18["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToLeftReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:93"]
  T18["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S18 -->|calls| T18
  S19["method:ASDimensionTests::testIntersectingSizeRangeWithNonOverlappingRangeToLeftReturnsSinglePointNearestOtherRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:93"]
  T19["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S19 -->|calls| T19
  S20["method:ASDispatchTests::testDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:19"]
  T20["function:ASDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S20 -->|calls| T20
  S21["method:ASDispatchTests::testDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:19"]
  T21["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S21 -->|calls| T21
  S22["method:ASDispatchTests::testDispatchApply<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:19"]
  T22["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S22 -->|calls| T22
  S23["method:ASDispatchTests::testDispatchAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:39"]
  T23["function:ASDispatchAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDispatch.mm:33"]
  S23 -->|calls| T23
  S24["method:ASDispatchTests::testDispatchAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:39"]
  T24["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S24 -->|calls| T24
  S25["method:ASDispatchTests::testDispatchAsync<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDispatchTests.mm:39"]
  T25["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

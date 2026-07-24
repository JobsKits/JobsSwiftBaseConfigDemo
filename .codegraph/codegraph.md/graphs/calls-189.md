# `calls 符号关系 - 189`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T1["method:ASDisplayNodeTests::checkConvertPoint:fromNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1208"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T2["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T4["method:ASDisplayNodeTests::checkConvertPoint:toNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1219"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T5["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T6["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T7["method:ASDisplayNodeTests::checkConvertPoint:toNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1219"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T8["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T10["method:ASDisplayNodeTests::checkConvertPoint:fromNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1208"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T11["function:ASDisplayNodeTests::_CGPointEqualToPointWithEpsilon<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1201"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T14["method:ASDisplayNodeTests::checkConvertPoint:fromNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1208"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T15["function:ASDisplayNodeTests::_CGPointEqualToPointWithEpsilon<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1201"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T18["method:ASDisplayNodeTests::checkConvertPoint:toNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1219"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T19["function:ASDisplayNodeTests::_CGPointEqualToPointWithEpsilon<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1201"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T22["method:ASDisplayNodeTests::checkConvertPoint:toNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1219"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1013"]
  T23["function:ASDisplayNodeTests::_CGPointEqualToPointWithEpsilon<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1201"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTests::testDisplayNodePointConversionAgainstSelf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1080"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeTests::testDisplayNodePointConversionAgainstSelf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1080"]
  T25["method:ASDisplayNodeTests::checkConvertPoint:fromNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1208"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

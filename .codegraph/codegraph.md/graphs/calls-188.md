# `calls 符号关系 - 188`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeTests::checkSimpleBridgePropertiesSetPropagate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:647"]
  T1["method:ASDisplayNodeTests::checkValuesMatchSetValues:isLayerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:576"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeTests::testPropertiesSetOffThreadBeforeLoadingExternalView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:750"]
  T2["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeTests::testPropertiesSetOnThreadAfterLoadingExternalView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:769"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeTests::testPropertiesSetOnThreadAfterLoadingExternalView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:769"]
  T4["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeTests::testPropertiesSetOffThreadBeforeLoadingExternalLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:799"]
  T5["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeTests::testPropertiesSetOnThreadAfterLoadingExternalLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:815"]
  T6["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeTests::testDeriveFrameFromBoundsPositionAnchorPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:841"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeTests::testSetFrameSetsBoundsPosition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:861"]
  T8["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T11["method:ASDisplayNodeTests::checkConvertPoint:fromNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1208"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T14["method:ASDisplayNodeTests::checkConvertPoint:fromNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1208"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T17["method:ASDisplayNodeTests::checkConvertPoint:toNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1219"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeTests::testDisplayNodePointConversionWithFrames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:880"]
  T20["method:ASDisplayNodeTests::checkConvertPoint:toNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1219"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T23["method:ASDisplayNodeTests::checkConvertPoint:fromNode:selfNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:1208"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeTests::testDisplayNodePointConversionWithNonZeroBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:941"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 185`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T1["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T2["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T3["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T4["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T5["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeImplicitHierarchyTests::testTransitionLayoutWithAnimationWithLoadedNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:284"]
  T6["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeImplicitHierarchyTests::testTransitionLayoutWithAnimationWithLoadedNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:284"]
  T7["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeImplicitHierarchyTests::testTransitionLayoutWithAnimationWithLoadedNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:284"]
  T8["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeImplicitHierarchyTests::testTransitionLayoutWithAnimationWithLoadedNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:284"]
  T9["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeLayoutTests::testMeasureOnLayoutIfNotHappenedBefore<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:22"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeLayoutTests::testMeasureOnLayoutIfNotHappenedBefore<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:22"]
  T11["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeLayoutTests::testMeasureOnLayoutIfNotHappenedBefore<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:22"]
  T12["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeLayoutTests::testNotAllowAddingSubnodesInLayoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:49"]
  T13["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeLayoutTests::testNotAllowModifyingSubnodesInLayoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:62"]
  T14["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeLayoutTests::testMeasureOnLayoutIfNotHappenedBeforeNoRemeasureForSameBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:79"]
  T15["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeLayoutTests::testMeasureOnLayoutIfNotHappenedBeforeNoRemeasureForSameBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:79"]
  T16["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeLayoutTests::testThatLayoutWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:106"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeLayoutTests::testThatLayoutWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:106"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeLayoutTests::testThatLayoutWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:106"]
  T19["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeLayoutTests::testThatLayoutCreatedWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:117"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeLayoutTests::testThatLayoutCreatedWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:117"]
  T21["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeLayoutTests::testThatLayoutCreatedWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:117"]
  T22["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeLayoutTests::testThatLayoutCreatedWithInvalidSizeCausesException<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:117"]
  T23["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeLayoutTests::testThatLayoutElementCreatedInLayoutSpecThatFitsDoNotGetDeallocated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:125"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeLayoutTests::testThatLayoutElementCreatedInLayoutSpecThatFitsDoNotGetDeallocated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:125"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

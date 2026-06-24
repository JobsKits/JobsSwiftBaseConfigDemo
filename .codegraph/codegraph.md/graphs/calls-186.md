# `calls 符号关系 - 186`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeLayoutTests::testThatLayoutElementCreatedInLayoutSpecThatFitsDoNotGetDeallocated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeLayoutTests.mm:125"]
  T1["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeSnapshotTests::testBasicHierarchySnapshotTesting<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:19"]
  T2["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeSnapshotTests::testBasicHierarchySnapshotTesting<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:19"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeSnapshotTests::testBasicHierarchySnapshotTesting<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:19"]
  T4["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeSnapshotTests::testPrecompositedCornerRounding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:47"]
  T5["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeSnapshotTests::testPrecompositedCornerRounding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:47"]
  T6["function:ASDisplayNodeSnapshotTests::BlueImageMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:37"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeSnapshotTests::testClippingCornerRounding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:62"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeSnapshotTests::testClippingCornerRounding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:62"]
  T8["function:ASDisplayNodeSnapshotTests::BlueImageMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:37"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeSnapshotTests::testUserInterfaceStyleSnapshotTesting<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:86"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeSnapshotTests::testUserInterfaceStyleSnapshotTesting<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:86"]
  T10["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeSnapshotTests::testBackgroundDynamicColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:105"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeSnapshotTests::testBackgroundDynamicColorLayerBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:122"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASTestDisplayNode::setInterfaceState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:125"]
  T13["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S13 -->|calls| T13
  S14["method:ASTestDisplayNode::didEnterDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:136"]
  T14["method:ASTestDisplayNode::didEnterDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:136"]
  S14 -->|calls| T14
  S15["method:ASTestDisplayNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:142"]
  T15["method:ASTestDisplayNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:142"]
  S15 -->|calls| T15
  S16["method:ASTestDisplayNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:148"]
  T16["method:ASTestDisplayNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:148"]
  S16 -->|calls| T16
  S17["method:ASTestDisplayNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:155"]
  T17["method:ASTestDisplayNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:155"]
  S17 -->|calls| T17
  S18["method:ASTestDisplayNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:168"]
  T18["method:ASTestDisplayNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:168"]
  S18 -->|calls| T18
  S19["method:UIResponderNodeTestView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:258"]
  T19["method:UIResponderNodeTestView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:258"]
  S19 -->|calls| T19
  S20["method:UIResponderNodeTestDisplayViewCallingSuper::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:287"]
  T20["method:UIResponderNodeTestDisplayViewCallingSuper::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:287"]
  S20 -->|calls| T20
  S21["method:UIResponderNodeTestViewCallingSuper::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:294"]
  T21["method:UIResponderNodeTestViewCallingSuper::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:294"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeTests::testOverriddenNodeFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:305"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeTests::testOverriddenNodeFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:305"]
  T23["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTests::testOverriddenNodeFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:305"]
  T24["method:ASEditableTextNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:500"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeTests::testOverriddenDisplayViewFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:312"]
  T25["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

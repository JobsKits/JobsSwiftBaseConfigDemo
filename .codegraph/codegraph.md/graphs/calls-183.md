# `calls 符号关系 - 183`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeAppearanceTests::testDisableWithNodeAPIView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:410"]
  T1["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeAppearanceTests::testPreventManualAppearanceMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:415"]
  T2["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeAppearanceTests::testPreventManualAppearanceMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:415"]
  T3["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeAppearanceTests::testPreventManualAppearanceMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:415"]
  T4["method:ASNodeController::didExitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:94"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeExtrasTests::testShallowFindSubnodesOfSubclass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:25"]
  T5["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeExtrasTests::testDeepFindSubnodesOfSubclass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:42"]
  T6["method:ASDisplayNodeExtrasTests::capacityForCount:levels:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:71"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeExtrasTests::testDeepFindSubnodesOfSubclass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:42"]
  T7["method:ASDisplayNodeExtrasTests::addSubnodesToNode:number:remainingLevels:accumulated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:58"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeExtrasTests::testDeepFindSubnodesOfSubclass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:42"]
  T8["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeExtrasTests::addSubnodesToNode:number:remainingLevels:accumulated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:58"]
  T9["method:ASDisplayNodeExtrasTests::addSubnodesToNode:number:remainingLevels:accumulated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:58"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeExtrasTests::capacityForCount:levels:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:71"]
  T10["method:ASDisplayNodeExtrasTests::capacityForCount:levels:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:71"]
  S10 -->|calls| T10
  S11["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  T11["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeImplicitHierarchyTests::testFeatureFlag<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:45"]
  T12["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T13["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T14["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T15["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T16["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T17["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T18["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T19["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T20["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T21["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWhenEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:96"]
  T22["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWhenEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:96"]
  T23["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWhenEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:96"]
  T24["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWhenEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:96"]
  T25["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

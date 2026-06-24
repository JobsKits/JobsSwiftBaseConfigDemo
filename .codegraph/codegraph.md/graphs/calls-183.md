# `calls 符号关系 - 183`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  T1["function:ASDisplayNodeDisableHierarchyNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:329"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  T2["function:ASDisplayNodeEnableHierarchyNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:334"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  T3["function:ASDisplayNodeDisableHierarchyNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:329"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  T4["function:ASDisplayNodeEnableHierarchyNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:334"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeAppearanceTests::testMoveAcrossHierarchyLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:385"]
  T5["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeAppearanceTests::testMoveAcrossHierarchyView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:390"]
  T6["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeAppearanceTests::testMoveAcrossHierarchyManualLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:395"]
  T7["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeAppearanceTests::testMoveAcrossHierarchyManualView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:400"]
  T8["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeAppearanceTests::testDisableWithNodeAPILayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:405"]
  T9["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeAppearanceTests::testDisableWithNodeAPIView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:410"]
  T10["method:ASDisplayNodeAppearanceTests::checkMoveAcrossHierarchyLayerBacked:useManualCalls:useNodeAPI:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:294"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeAppearanceTests::testPreventManualAppearanceMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:415"]
  T11["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeAppearanceTests::testPreventManualAppearanceMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:415"]
  T12["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeAppearanceTests::testPreventManualAppearanceMethods<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeAppearanceTests.mm:415"]
  T13["method:ASNodeController::didExitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:94"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeExtrasTests::testShallowFindSubnodesOfSubclass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:25"]
  T14["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeExtrasTests::testDeepFindSubnodesOfSubclass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:42"]
  T15["method:ASDisplayNodeExtrasTests::capacityForCount:levels:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:71"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeExtrasTests::testDeepFindSubnodesOfSubclass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:42"]
  T16["method:ASDisplayNodeExtrasTests::addSubnodesToNode:number:remainingLevels:accumulated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:58"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeExtrasTests::testDeepFindSubnodesOfSubclass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:42"]
  T17["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeExtrasTests::addSubnodesToNode:number:remainingLevels:accumulated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:58"]
  T18["method:ASDisplayNodeExtrasTests::addSubnodesToNode:number:remainingLevels:accumulated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:58"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeExtrasTests::capacityForCount:levels:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:71"]
  T19["method:ASDisplayNodeExtrasTests::capacityForCount:levels:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeExtrasTests.mm:71"]
  S19 -->|calls| T19
  S20["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  T20["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeImplicitHierarchyTests::testFeatureFlag<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:45"]
  T21["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T22["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T23["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T24["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWithOrdering<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:54"]
  T25["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

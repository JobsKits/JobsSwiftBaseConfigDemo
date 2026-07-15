# `calls 符号关系 - 184`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWhenEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:96"]
  T1["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWhenEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:96"]
  T2["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeImplicitHierarchyTests::testInitialNodeInsertionWhenEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:96"]
  T3["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeImplicitHierarchyTests::testCalculatedLayoutHierarchyTransitions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:139"]
  T4["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeImplicitHierarchyTests::testCalculatedLayoutHierarchyTransitions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:139"]
  T5["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeImplicitHierarchyTests::testCalculatedLayoutHierarchyTransitions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:139"]
  T6["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeImplicitHierarchyTests::testCalculatedLayoutHierarchyTransitions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:139"]
  T7["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeImplicitHierarchyTests::testCalculatedLayoutHierarchyTransitions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:139"]
  T8["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeImplicitHierarchyTests::testCalculatedLayoutHierarchyTransitions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:139"]
  T9["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeImplicitHierarchyTests::testCalculatedLayoutHierarchyTransitions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:139"]
  T10["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeImplicitHierarchyTests::testLayoutTransitionMeasurementCompletionBlockIsCalledOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:199"]
  T11["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeImplicitHierarchyTests::testLayoutTransitionMeasurementCompletionBlockIsCalledOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:199"]
  T12["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeImplicitHierarchyTests::testLayoutTransitionMeasurementCompletionBlockIsCalledOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:199"]
  T13["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T14["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T15["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T16["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T17["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T18["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T19["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T20["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeImplicitHierarchyTests::testMeasurementInBackgroundThreadWithLoadedNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:219"]
  T21["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeImplicitHierarchyTests::testTransitionLayoutWithAnimationWithLoadedNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:284"]
  T22["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeImplicitHierarchyTests::testTransitionLayoutWithAnimationWithLoadedNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:284"]
  T23["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeImplicitHierarchyTests::testTransitionLayoutWithAnimationWithLoadedNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:284"]
  T24["method:ASSpecTestDisplayNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:28"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeImplicitHierarchyTests::testTransitionLayoutWithAnimationWithLoadedNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeImplicitHierarchyTests.mm:284"]
  T25["function:ASDisplayNodeSizeToFitSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

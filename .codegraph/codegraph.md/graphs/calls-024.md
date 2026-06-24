# `calls 符号关系 - 024`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T1["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:121"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T2["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T3["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T4["method:ASDisplayNode::_finishOrCancelTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:592"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T5["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::cancelLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:768"]
  T6["method:ASDisplayNode::_finishOrCancelTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:592"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::cancelLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:768"]
  T7["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T8["method:ASDisplayNode::_layoutSublayouts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:510"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T9["method:_ASTransitionContext::removedSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/_ASTransitionContext.mm:76"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T10["method:_ASTransitionContext::insertedSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/_ASTransitionContext.mm:71"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T11["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T12["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T13["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::didCompleteLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:911"]
  T14["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::didCompleteLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:911"]
  T15["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::_completePendingLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:925"]
  T16["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::_completePendingLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:925"]
  T17["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::_completePendingLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:925"]
  T18["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T19["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T20["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T21["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T22["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T23["method:ASDisplayNode::_assertSubnodeState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:963"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T24["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:409"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T25["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 024`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T1["method:_ASTransitionContext::insertedSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/_ASTransitionContext.mm:71"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T2["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T3["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T4["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::didCompleteLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:911"]
  T5["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::didCompleteLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:911"]
  T6["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::_completePendingLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:925"]
  T7["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::_completePendingLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:925"]
  T8["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::_completePendingLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:925"]
  T9["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T10["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T11["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T12["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T13["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T14["method:ASDisplayNode::_assertSubnodeState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:963"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T15["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:409"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T16["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T17["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T18["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::locked_shouldLayoutFromYogaRoot<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1078"]
  T19["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T20["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T21["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T22["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T23["method:ASLayoutSpec::findDuplicatedElementsInSubtree<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:180"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T24["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T25["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

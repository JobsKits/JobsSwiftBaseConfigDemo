# `calls 符号关系 - 022`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T1["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T2["method:ASDisplayNode::_locked_constrainedSizeForLayoutPass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:481"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T3["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T4["function:ASLayoutElementPopContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:59"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T5["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T6["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T7["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T8["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T9["method:ASLayoutTransition::initWithNode:pendingLayout:previousLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:66"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T10["function:ASHierarchyStateIncludesLayoutPending<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:46"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T11["method:ASDisplayNode::_completePendingLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:925"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::_constrainedSizeForLayoutPass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:475"]
  T12["method:ASDisplayNode::_locked_constrainedSizeForLayoutPass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:481"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::_locked_constrainedSizeForLayoutPass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:481"]
  T13["function:ASCeilSizeValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::_locked_constrainedSizeForLayoutPass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:481"]
  T14["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::_isLayoutTransitionInvalid<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:564"]
  T15["method:ASDisplayNode::_locked_isLayoutTransitionInvalid<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:570"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::_locked_isLayoutTransitionInvalid<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:570"]
  T16["function:ASHierarchyStateIncludesLayoutPending<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:46"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::_locked_isLayoutTransitionInvalid<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:570"]
  T17["function:ASLayoutElementGetCurrentContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:53"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::transitionLayoutWithAnimation:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:600"]
  T18["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::transitionLayoutWithAnimation:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:600"]
  T19["method:ASDisplayNode::_constrainedSizeForLayoutPass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:475"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T20["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T21["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T22["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T23["method:ASDisplayNode::_locked_isLayoutTransitionInvalid<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:570"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T24["function:ASHierarchyStateIncludesLayoutPending<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:46"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T25["variable:invalidateCalculatedLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Subclasses.h:170"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

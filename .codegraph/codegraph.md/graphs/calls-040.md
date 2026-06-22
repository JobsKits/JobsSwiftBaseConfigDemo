# `calls 符号关系 - 040`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T1["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T2["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T3["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T4["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  T5["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  T6["function:ASCeilSizeValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  T7["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  T8["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T9["method:ASDisplayNode::_locked_isLayoutTransitionInvalid<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:570"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T10["function:ASCeilSizeValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T11["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T12["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T13["method:ASDisplayNode::cancelLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:768"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T14["function:ASLayoutElementGetCurrentContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:53"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T15["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T16["function:ASLayoutElementPushContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:45"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T17["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T18["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T19["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T20["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T21["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T22["method:ASDisplayNode::_locked_constrainedSizeForLayoutPass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:481"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T23["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T24["function:ASLayoutElementPopContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:59"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T25["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

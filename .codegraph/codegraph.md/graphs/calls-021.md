# `calls 符号关系 - 021`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::setPrimitiveTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:132"]
  T1["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::asciiArtString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:151"]
  T2["method:ASDisplayNode::asciiArtName<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:156"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::constrainedSizeForCalculatedLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:202"]
  T3["method:ASDisplayNode::_locked_constrainedSizeForCalculatedLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:208"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T4["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T5["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T6["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T7["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T8["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  T9["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  T10["function:ASCeilSizeValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  T11["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  T12["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T13["method:ASDisplayNode::_locked_isLayoutTransitionInvalid<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:570"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T14["function:ASCeilSizeValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T15["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T16["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T17["method:ASDisplayNode::cancelLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:768"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T18["function:ASLayoutElementGetCurrentContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:53"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T20["function:ASLayoutElementPushContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:45"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T21["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T22["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T23["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T24["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T25["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

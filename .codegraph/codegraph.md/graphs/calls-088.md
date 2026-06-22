# `calls 符号关系 - 088`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::setShadowOpacity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1281"]
  T1["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S1 -->|calls| T1
  S2["method:ASTextNode::setShadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1293"]
  T2["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S2 -->|calls| T2
  S3["method:ASTextNode::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1300"]
  T3["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S3 -->|calls| T3
  S4["method:ASTextNode::setTruncationAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1323"]
  T4["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  S4 -->|calls| T4
  S5["method:ASTextNode::setTruncationAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1323"]
  T5["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S5 -->|calls| T5
  S6["method:ASTextNode::setAdditionalTruncationMessage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1331"]
  T6["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  S6 -->|calls| T6
  S7["method:ASTextNode::setAdditionalTruncationMessage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1331"]
  T7["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S7 -->|calls| T7
  S8["method:ASTextNode::setTruncationMode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1344"]
  T8["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S8 -->|calls| T8
  S9["method:ASTextNode::isTruncated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  T9["method:ASTextNode::isTruncated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  S9 -->|calls| T9
  S10["method:ASTextNode::isTruncated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  T10["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S10 -->|calls| T10
  S11["method:ASTextNode::shouldTruncateForConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1361"]
  T11["method:ASTextNode::isTruncated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  S11 -->|calls| T11
  S12["method:ASTextNode::setPointSizeScaleFactors:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1366"]
  T12["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S12 -->|calls| T12
  S13["method:ASTextNode::setMaximumNumberOfLines:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1378"]
  T13["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S13 -->|calls| T13
  S14["method:ASTextNode::lineCount<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  T14["method:ASTextNode::lineCount<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  S14 -->|calls| T14
  S15["method:ASTextNode::lineCount<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  T15["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S15 -->|calls| T15
  S16["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  T16["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S16 -->|calls| T16
  S17["method:ASTextNode::_locked_composedTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1440"]
  T17["function:ASTextNode::DefaultTruncationAttributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1308"]
  S17 -->|calls| T17
  S18["method:ASTextNode::_locked_prepareTruncationStringForDrawing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1466"]
  T18["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  S18 -->|calls| T18
  S19["method:ASTextNode::_registerAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1489"]
  T19["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S19 -->|calls| T19
  S20["method:ASTextNode::_registerAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1489"]
  T20["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S20 -->|calls| T20
  S21["method:ASTextNode::initialize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  T21["method:ASTextNode::initialize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  S21 -->|calls| T21
  S22["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T22["method:Mutex::Mutex<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S22 -->|calls| T22
  S23["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T23["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S23 -->|calls| T23
  S24["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T24["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S24 -->|calls| T24
  S25["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T25["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

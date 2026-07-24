# `calls 符号关系 - 069`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::setShadowColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1247"]
  T1["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S1 -->|calls| T1
  S2["method:ASTextNode::setShadowColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1247"]
  T2["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S2 -->|calls| T2
  S3["method:ASTextNode::setShadowColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1247"]
  T3["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S3 -->|calls| T3
  S4["method:ASTextNode::setShadowOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1269"]
  T4["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S4 -->|calls| T4
  S5["method:ASTextNode::setShadowOpacity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1281"]
  T5["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S5 -->|calls| T5
  S6["method:ASTextNode::setShadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1293"]
  T6["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S6 -->|calls| T6
  S7["method:ASTextNode::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1300"]
  T7["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S7 -->|calls| T7
  S8["method:ASTextNode::setTruncationAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1323"]
  T8["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  S8 -->|calls| T8
  S9["method:ASTextNode::setTruncationAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1323"]
  T9["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S9 -->|calls| T9
  S10["method:ASTextNode::setAdditionalTruncationMessage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1331"]
  T10["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  S10 -->|calls| T10
  S11["method:ASTextNode::setAdditionalTruncationMessage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1331"]
  T11["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S11 -->|calls| T11
  S12["method:ASTextNode::setTruncationMode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1344"]
  T12["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S12 -->|calls| T12
  S13["method:ASTextNode::isTruncated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  T13["method:ASTextNode::isTruncated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  S13 -->|calls| T13
  S14["method:ASTextNode::isTruncated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  T14["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S14 -->|calls| T14
  S15["method:ASTextNode::shouldTruncateForConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1361"]
  T15["method:ASTextNode::isTruncated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  S15 -->|calls| T15
  S16["method:ASTextNode::setPointSizeScaleFactors:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1366"]
  T16["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S16 -->|calls| T16
  S17["method:ASTextNode::setMaximumNumberOfLines:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1378"]
  T17["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S17 -->|calls| T17
  S18["method:ASTextNode::lineCount<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  T18["method:ASTextNode::lineCount<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  S18 -->|calls| T18
  S19["method:ASTextNode::lineCount<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  T19["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S19 -->|calls| T19
  S20["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  T20["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S20 -->|calls| T20
  S21["method:ASTextNode::_locked_composedTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1440"]
  T21["function:ASTextNode::DefaultTruncationAttributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1308"]
  S21 -->|calls| T21
  S22["method:ASTextNode::_locked_prepareTruncationStringForDrawing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1466"]
  T22["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  S22 -->|calls| T22
  S23["method:ASTextNode::_registerAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1489"]
  T23["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S23 -->|calls| T23
  S24["method:ASTextNode::_registerAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1489"]
  T24["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S24 -->|calls| T24
  S25["method:ASTextNode::initialize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  T25["method:ASTextNode::initialize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

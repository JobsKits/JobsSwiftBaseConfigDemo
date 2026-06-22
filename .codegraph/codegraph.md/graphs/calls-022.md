# `calls 符号关系 - 022`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  T1["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S1 -->|calls| T1
  S2["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  T2["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S2 -->|calls| T2
  S3["method:ASButtonNode::updateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  T3["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S3 -->|calls| T3
  S4["method:ASButtonNode::updateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  T4["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S4 -->|calls| T4
  S5["method:ASButtonNode::updateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  T5["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S5 -->|calls| T5
  S6["method:ASButtonNode::updateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  T6["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S6 -->|calls| T6
  S7["method:ASButtonNode::updateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  T7["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S7 -->|calls| T7
  S8["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T8["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S8 -->|calls| T8
  S9["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T9["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S9 -->|calls| T9
  S10["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T10["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S10 -->|calls| T10
  S11["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T11["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S11 -->|calls| T11
  S12["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T12["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S12 -->|calls| T12
  S13["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T13["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S13 -->|calls| T13
  S14["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T14["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S14 -->|calls| T14
  S15["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T15["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S15 -->|calls| T15
  S16["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T16["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S16 -->|calls| T16
  S17["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T17["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S17 -->|calls| T17
  S18["method:ASButtonNode::setContentSpacing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:247"]
  T18["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S18 -->|calls| T18
  S19["method:ASButtonNode::setContentSpacing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:247"]
  T19["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S19 -->|calls| T19
  S20["method:ASButtonNode::setLaysOutHorizontally:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:261"]
  T20["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S20 -->|calls| T20
  S21["method:ASButtonNode::setLaysOutHorizontally:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:261"]
  T21["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S21 -->|calls| T21
  S22["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  T22["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S22 -->|calls| T22
  S23["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  T23["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S23 -->|calls| T23
  S24["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  T24["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  S24 -->|calls| T24
  S25["method:ASButtonNode::setImage:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:414"]
  T25["method:ASButtonNode::updateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

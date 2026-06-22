# `calls 符号关系 - 061`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T1["method:ASDisplayNode::didDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:476"]
  S1 -->|calls| T1
  S2["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T2["method:ASImageNode::imageModificationBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:738"]
  S2 -->|calls| T2
  S3["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T3["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S3 -->|calls| T3
  S4["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T4["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S4 -->|calls| T4
  S5["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T5["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S5 -->|calls| T5
  S6["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T6["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S6 -->|calls| T6
  S7["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T7["method:ASImageNode::debugLabelAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:765"]
  S7 -->|calls| T7
  S8["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:590"]
  T8["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S8 -->|calls| T8
  S9["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:609"]
  T9["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S9 -->|calls| T9
  S10["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:622"]
  T10["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:622"]
  S10 -->|calls| T10
  S11["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:622"]
  T11["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:609"]
  S11 -->|calls| T11
  S12["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:631"]
  T12["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:631"]
  S12 -->|calls| T12
  S13["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:631"]
  T13["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:609"]
  S13 -->|calls| T13
  S14["method:ASImageNode::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:638"]
  T14["method:ASImageNode::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:638"]
  S14 -->|calls| T14
  S15["method:ASImageNode::setCropEnabled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:654"]
  T15["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  S15 -->|calls| T15
  S16["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T16["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S16 -->|calls| T16
  S17["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T17["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S17 -->|calls| T17
  S18["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T18["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S18 -->|calls| T18
  S19["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T19["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S19 -->|calls| T19
  S20["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T20["method:_ASDisplayLayer::displayImmediately<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:158"]
  S20 -->|calls| T20
  S21["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T21["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S21 -->|calls| T21
  S22["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T22["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S22 -->|calls| T22
  S23["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T23["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S23 -->|calls| T23
  S24["method:ASImageNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T24["method:ASImageNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:752"]
  S24 -->|calls| T24
  S25["method:ASImageNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T25["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

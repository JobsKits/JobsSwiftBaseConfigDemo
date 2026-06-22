# `calls 符号关系 - 085`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::_locked_rendererWithBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:390"]
  T1["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:397"]
  S1 -->|calls| T1
  S2["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:397"]
  T2["method:ASTextNode::_locked_composedTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1440"]
  S2 -->|calls| T2
  S3["method:ASTextNode::setTextContainerInset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:429"]
  T3["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S3 -->|calls| T3
  S4["method:ASTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:441"]
  T4["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S4 -->|calls| T4
  S5["method:ASTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:441"]
  T5["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S5 -->|calls| T5
  S6["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T6["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S6 -->|calls| T6
  S7["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T7["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  S7 -->|calls| T7
  S8["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T8["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S8 -->|calls| T8
  S9["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T9["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S9 -->|calls| T9
  S10["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T10["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S10 -->|calls| T10
  S11["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T11["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S11 -->|calls| T11
  S12["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T12["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S12 -->|calls| T12
  S13["method:ASTextNode::setExclusionPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:555"]
  T13["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S13 -->|calls| T13
  S14["method:ASTextNode::setExclusionPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:555"]
  T14["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S14 -->|calls| T14
  S15["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T15["method:ASTextNodeDrawParameter::initWithRendererAttributes:backgroundColor:textContainerInsets:contentScale:opaque:bounds:traitCollection:willDisplayNodeContentWithRenderingContext:didDisplayNodeContentWithRenderingContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:168"]
  S15 -->|calls| T15
  S16["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T16["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:397"]
  S16 -->|calls| T16
  S17["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T17["property:ASDisplayNode::threadSafeBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:116"]
  S17 -->|calls| T17
  S18["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T18["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S18 -->|calls| T18
  S19["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T19["method:ASDisplayNode::willDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:470"]
  S19 -->|calls| T19
  S20["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T20["method:ASDisplayNode::didDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:476"]
  S20 -->|calls| T20
  S21["method:ASTextNode::linkAttributeValueAtPoint:attributeName:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:639"]
  T21["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S21 -->|calls| T21
  S22["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:650"]
  T22["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S22 -->|calls| T22
  S23["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T23["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S23 -->|calls| T23
  S24["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T24["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S24 -->|calls| T24
  S25["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T25["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

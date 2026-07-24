# `calls 符号关系 - 066`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T1["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S1 -->|calls| T1
  S2["method:ASTextNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:334"]
  T2["method:ASTextNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:334"]
  S2 -->|calls| T2
  S3["method:ASTextNode::_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:372"]
  T3["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S3 -->|calls| T3
  S4["method:ASTextNode::_locked_rendererWithBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:390"]
  T4["function:rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:135"]
  S4 -->|calls| T4
  S5["method:ASTextNode::_locked_rendererWithBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:390"]
  T5["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:397"]
  S5 -->|calls| T5
  S6["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:397"]
  T6["method:ASTextNode::_locked_composedTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1440"]
  S6 -->|calls| T6
  S7["method:ASTextNode::setTextContainerInset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:429"]
  T7["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S7 -->|calls| T7
  S8["method:ASTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:441"]
  T8["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S8 -->|calls| T8
  S9["method:ASTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:441"]
  T9["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S9 -->|calls| T9
  S10["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T10["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S10 -->|calls| T10
  S11["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T11["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  S11 -->|calls| T11
  S12["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T12["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S12 -->|calls| T12
  S13["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T13["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S13 -->|calls| T13
  S14["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T14["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S14 -->|calls| T14
  S15["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T15["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S15 -->|calls| T15
  S16["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T16["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S16 -->|calls| T16
  S17["method:ASTextNode::setExclusionPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:555"]
  T17["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S17 -->|calls| T17
  S18["method:ASTextNode::setExclusionPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:555"]
  T18["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S18 -->|calls| T18
  S19["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T19["method:ASTextNodeDrawParameter::initWithRendererAttributes:backgroundColor:textContainerInsets:contentScale:opaque:bounds:traitCollection:willDisplayNodeContentWithRenderingContext:didDisplayNodeContentWithRenderingContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:168"]
  S19 -->|calls| T19
  S20["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T20["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:397"]
  S20 -->|calls| T20
  S21["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T21["property:ASDisplayNode::threadSafeBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:116"]
  S21 -->|calls| T21
  S22["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T22["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S22 -->|calls| T22
  S23["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T23["method:ASDisplayNode::willDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:470"]
  S23 -->|calls| T23
  S24["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T24["method:ASDisplayNode::didDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:476"]
  S24 -->|calls| T24
  S25["method:ASTextNode::linkAttributeValueAtPoint:attributeName:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:639"]
  T25["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

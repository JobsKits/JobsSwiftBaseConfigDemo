# `calls 符号关系 - 067`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T1["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S1 -->|calls| T1
  S2["method:ASTextNode::setExclusionPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:555"]
  T2["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S2 -->|calls| T2
  S3["method:ASTextNode::setExclusionPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:555"]
  T3["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S3 -->|calls| T3
  S4["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T4["method:ASTextNodeDrawParameter::initWithRendererAttributes:backgroundColor:textContainerInsets:contentScale:opaque:bounds:traitCollection:willDisplayNodeContentWithRenderingContext:didDisplayNodeContentWithRenderingContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:168"]
  S4 -->|calls| T4
  S5["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T5["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:397"]
  S5 -->|calls| T5
  S6["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T6["property:ASDisplayNode::threadSafeBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:116"]
  S6 -->|calls| T6
  S7["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T7["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S7 -->|calls| T7
  S8["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T8["method:ASDisplayNode::willDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:470"]
  S8 -->|calls| T8
  S9["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T9["method:ASDisplayNode::didDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:476"]
  S9 -->|calls| T9
  S10["method:ASTextNode::linkAttributeValueAtPoint:attributeName:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:639"]
  T10["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S10 -->|calls| T10
  S11["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:650"]
  T11["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S11 -->|calls| T11
  S12["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T12["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S12 -->|calls| T12
  S13["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T13["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S13 -->|calls| T13
  S14["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T14["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S14 -->|calls| T14
  S15["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T15["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S15 -->|calls| T15
  S16["method:ASTextNode::setHighlightRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:804"]
  T16["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S16 -->|calls| T16
  S17["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:809"]
  T17["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S17 -->|calls| T17
  S18["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T18["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S18 -->|calls| T18
  S19["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T19["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S19 -->|calls| T19
  S20["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T20["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S20 -->|calls| T20
  S21["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T21["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S21 -->|calls| T21
  S22["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T22["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S22 -->|calls| T22
  S23["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T23["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S23 -->|calls| T23
  S24["method:ASTextNode::rectsForTextRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:952"]
  T24["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:962"]
  S24 -->|calls| T24
  S25["method:ASTextNode::highlightRectsForTextRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:957"]
  T25["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:962"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

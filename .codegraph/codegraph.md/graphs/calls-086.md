# `calls 符号关系 - 086`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T1["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S1 -->|calls| T1
  S2["method:ASTextNode::setHighlightRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:804"]
  T2["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S2 -->|calls| T2
  S3["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:809"]
  T3["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S3 -->|calls| T3
  S4["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T4["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S4 -->|calls| T4
  S5["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T5["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S5 -->|calls| T5
  S6["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T6["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S6 -->|calls| T6
  S7["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T7["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S7 -->|calls| T7
  S8["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T8["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S8 -->|calls| T8
  S9["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T9["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S9 -->|calls| T9
  S10["method:ASTextNode::rectsForTextRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:952"]
  T10["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:962"]
  S10 -->|calls| T10
  S11["method:ASTextNode::highlightRectsForTextRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:957"]
  T11["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:962"]
  S11 -->|calls| T11
  S12["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T12["method:ASTextKitRenderer::rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:27"]
  S12 -->|calls| T12
  S13["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T13["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S13 -->|calls| T13
  S14["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T14["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S14 -->|calls| T14
  S15["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T15["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S15 -->|calls| T15
  S16["method:ASTextNode::trailingRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:980"]
  T16["method:ASTextNode::trailingRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:980"]
  S16 -->|calls| T16
  S17["method:ASTextNode::trailingRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:980"]
  T17["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S17 -->|calls| T17
  S18["method:ASTextNode::trailingRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:980"]
  T18["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S18 -->|calls| T18
  S19["method:ASTextNode::frameForTextRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:988"]
  T19["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S19 -->|calls| T19
  S20["method:ASTextNode::frameForTextRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:988"]
  T20["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S20 -->|calls| T20
  S21["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:999"]
  T21["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:999"]
  S21 -->|calls| T21
  S22["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:999"]
  T22["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  S22 -->|calls| T22
  S23["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  T23["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S23 -->|calls| T23
  S24["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  T24["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  S24 -->|calls| T24
  S25["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  T25["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

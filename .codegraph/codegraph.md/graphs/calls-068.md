# `calls 符号关系 - 068`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:999"]
  T1["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:999"]
  S1 -->|calls| T1
  S2["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:999"]
  T2["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  S2 -->|calls| T2
  S3["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  T3["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S3 -->|calls| T3
  S4["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  T4["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  S4 -->|calls| T4
  S5["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  T5["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  S5 -->|calls| T5
  S6["method:ASTextNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1043"]
  T6["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S6 -->|calls| T6
  S7["method:ASTextNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1043"]
  T7["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:962"]
  S7 -->|calls| T7
  S8["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  T8["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  S8 -->|calls| T8
  S9["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  T9["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S9 -->|calls| T9
  S10["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  T10["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  S10 -->|calls| T10
  S11["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  T11["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S11 -->|calls| T11
  S12["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  T12["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S12 -->|calls| T12
  S13["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  T13["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S13 -->|calls| T13
  S14["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  T14["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S14 -->|calls| T14
  S15["method:ASTextNode::touchesCancelled:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1148"]
  T15["method:ASTextNode::touchesCancelled:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1148"]
  S15 -->|calls| T15
  S16["method:ASTextNode::touchesCancelled:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1148"]
  T16["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:925"]
  S16 -->|calls| T16
  S17["method:ASTextNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1156"]
  T17["method:ASTextNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1156"]
  S17 -->|calls| T17
  S18["method:ASTextNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1156"]
  T18["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S18 -->|calls| T18
  S19["method:ASTextNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1156"]
  T19["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S19 -->|calls| T19
  S20["method:ASTextNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1156"]
  T20["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:925"]
  S20 -->|calls| T20
  S21["method:ASTextNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1175"]
  T21["method:ASTextNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1175"]
  S21 -->|calls| T21
  S22["method:ASTextNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1175"]
  T22["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S22 -->|calls| T22
  S23["method:ASTextNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1175"]
  T23["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:925"]
  S23 -->|calls| T23
  S24["method:ASTextNode::_handleLongPress:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1201"]
  T24["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S24 -->|calls| T24
  S25["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  T25["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 090`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T1["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S1 -->|calls| T1
  S2["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T2["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S2 -->|calls| T2
  S3["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T3["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S3 -->|calls| T3
  S4["function:setExclusionPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T4["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S4 -->|calls| T4
  S5["function:setExclusionPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T5["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S5 -->|calls| T5
  S6["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  T6["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S6 -->|calls| T6
  S7["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T7["method:ASTextContainer::makeImmutable<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:200"]
  S7 -->|calls| T7
  S8["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T8["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S8 -->|calls| T8
  S9["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T9["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S9 -->|calls| T9
  S10["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T10["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S10 -->|calls| T10
  S11["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T11["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S11 -->|calls| T11
  S12["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T12["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S12 -->|calls| T12
  S13["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T13["method:ASTextDebugOption::sharedDebugOption<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:125"]
  S13 -->|calls| T13
  S14["function:tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T14["function:tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  S14 -->|calls| T14
  S15["function:tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T15["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S15 -->|calls| T15
  S16["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  T16["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S16 -->|calls| T16
  S17["function:didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  T17["function:didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  S17 -->|calls| T17
  S18["function:didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  T18["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S18 -->|calls| T18
  S19["function:linkAttributeValueAtPoint:attributeName:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:625"]
  T19["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T20["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T21["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T22["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T23["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T24["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S24 -->|calls| T24
  S25["function:animated<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:833"]
  T25["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

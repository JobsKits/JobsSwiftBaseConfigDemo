# `calls 符号关系 - 071`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T1["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S1 -->|calls| T1
  S2["function:calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T2["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S2 -->|calls| T2
  S3["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T3["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S3 -->|calls| T3
  S4["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T4["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S4 -->|calls| T4
  S5["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T5["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S5 -->|calls| T5
  S6["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T6["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S6 -->|calls| T6
  S7["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T7["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S7 -->|calls| T7
  S8["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T8["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S8 -->|calls| T8
  S9["function:setExclusionPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T9["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S9 -->|calls| T9
  S10["function:setExclusionPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T10["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S10 -->|calls| T10
  S11["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  T11["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S11 -->|calls| T11
  S12["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T12["method:ASTextContainer::makeImmutable<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:200"]
  S12 -->|calls| T12
  S13["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T13["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S13 -->|calls| T13
  S14["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T14["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S14 -->|calls| T14
  S15["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T15["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S15 -->|calls| T15
  S16["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T16["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S16 -->|calls| T16
  S17["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T17["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S17 -->|calls| T17
  S18["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T18["method:ASTextDebugOption::sharedDebugOption<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:125"]
  S18 -->|calls| T18
  S19["function:tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T19["function:tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  S19 -->|calls| T19
  S20["function:tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T20["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S20 -->|calls| T20
  S21["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  T21["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S21 -->|calls| T21
  S22["function:didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  T22["function:didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  S22 -->|calls| T22
  S23["function:didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  T23["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S23 -->|calls| T23
  S24["function:linkAttributeValueAtPoint:attributeName:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:625"]
  T24["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T25["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

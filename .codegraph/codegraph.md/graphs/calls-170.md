# `calls 符号关系 - 170`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextKitShadower::outsetSizeWithInsetSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:139"]
  T1["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S1 -->|calls| T1
  S2["method:ASTextKitShadower::outsetRectWithInsetRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:144"]
  T2["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S2 -->|calls| T2
  S3["method:ASTextKitShadower::offsetPointWithInternalPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:157"]
  T3["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S3 -->|calls| T3
  S4["method:ASTextKitShadower::offsetPointWithExternalPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:166"]
  T4["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S4 -->|calls| T4
  S5["method:ASTextKitTailTruncater::initWithContext:truncationAttributedString:avoidTailTruncationSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:24"]
  T5["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S5 -->|calls| T5
  S6["method:ASTextKitTailTruncater::_calculateCharacterIndexBeforeTruncationMessage:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:39"]
  T6["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  S6 -->|calls| T6
  S7["method:ASTextKitTailTruncater::_calculateCharacterIndexBeforeTruncationMessage:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:39"]
  T7["method:ASTextKitTailTruncater::_findTruncationInsertionPointAtOrBeforeCharacterIndex:layoutManager:textStorage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:116"]
  S7 -->|calls| T7
  S8["method:ASTextKitTailTruncater::truncate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:151"]
  T8["method:ASTextKitTailTruncater::_calculateCharacterIndexBeforeTruncationMessage:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:39"]
  S8 -->|calls| T8
  S9["method:ASTextNodeWordKerner::layoutManager:boundingBoxForControlGlyphAtIndex:forTextContainer:proposedLineFragment:glyphPosition:characterIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextNodeWordKerner.mm:77"]
  T9["method:ASTextNodeWordKerner::_wordKernedSpaceWidthForCharacterAtIndex:atGlyphPosition:forTextContainer:layoutManager:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextNodeWordKerner.mm:83"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.h:1"]
  T10["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S10 -->|calls| T10
  S11["function:UIImage::cachedImageNamed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:17"]
  T11["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S11 -->|calls| T11
  S12["function:UIImage::cachedImageNamed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:17"]
  T12["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S12 -->|calls| T12
  S13["method:UIImage::as_imageNamed:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:48"]
  T13["function:UIImage::cachedImageNamed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:17"]
  S13 -->|calls| T13
  S14["method:UIImage::as_imageNamed:compatibleWithTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:53"]
  T14["function:UIImage::cachedImageNamed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:17"]
  S14 -->|calls| T14
  S15["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:64"]
  T15["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:124"]
  S15 -->|calls| T15
  S16["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:77"]
  T16["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:143"]
  S16 -->|calls| T16
  S17["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:92"]
  T17["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:143"]
  S17 -->|calls| T17
  S18["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:109"]
  T18["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:124"]
  S18 -->|calls| T18
  S19["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:124"]
  T19["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:143"]
  S19 -->|calls| T19
  S20["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:124"]
  T20["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S20 -->|calls| T20
  S21["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:143"]
  T21["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S21 -->|calls| T21
  S22["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:143"]
  T22["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S22 -->|calls| T22
  S23["method:UIResponder::asdk_associatedViewController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIResponder+AsyncDisplayKit.mm:17"]
  T23["method:UIResponder::asdk_responderChainEnumerator<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:40"]
  S23 -->|calls| T23
  S24["method:_ASTransitionContext::initWithAnimation:layoutDelegate:completionDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/_ASTransitionContext.mm:27"]
  T24["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S24 -->|calls| T24
  S25["method:_ASTransitionContext::subnodesForKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/_ASTransitionContext.mm:62"]
  T25["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 151`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextKitShadower::initWithShadowOffset:shadowColor:shadowOpacity:shadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:59"]
  T1["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S1 -->|calls| T1
  S2["method:ASTextKitShadower::setShadowInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:83"]
  T2["method:ASTextKitShadower::_shouldDrawShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:78"]
  S2 -->|calls| T2
  S3["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  T3["method:ASTextKitShadower::_shouldDrawShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:78"]
  S3 -->|calls| T3
  S4["method:ASTextKitShadower::insetSizeWithConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:129"]
  T4["function:_insetSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:16"]
  S4 -->|calls| T4
  S5["method:ASTextKitShadower::insetSizeWithConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:129"]
  T5["function:_invertInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:23"]
  S5 -->|calls| T5
  S6["method:ASTextKitShadower::insetSizeWithConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:129"]
  T6["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S6 -->|calls| T6
  S7["method:ASTextKitShadower::insetRectWithConstrainedRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:134"]
  T7["function:_invertInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:23"]
  S7 -->|calls| T7
  S8["method:ASTextKitShadower::insetRectWithConstrainedRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:134"]
  T8["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S8 -->|calls| T8
  S9["method:ASTextKitShadower::outsetSizeWithInsetSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:139"]
  T9["function:_insetSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:16"]
  S9 -->|calls| T9
  S10["method:ASTextKitShadower::outsetSizeWithInsetSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:139"]
  T10["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S10 -->|calls| T10
  S11["method:ASTextKitShadower::outsetRectWithInsetRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:144"]
  T11["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S11 -->|calls| T11
  S12["method:ASTextKitShadower::offsetPointWithInternalPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:157"]
  T12["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S12 -->|calls| T12
  S13["method:ASTextKitShadower::offsetPointWithExternalPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:166"]
  T13["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S13 -->|calls| T13
  S14["method:ASTextKitTailTruncater::initWithContext:truncationAttributedString:avoidTailTruncationSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:24"]
  T14["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S14 -->|calls| T14
  S15["method:ASTextKitTailTruncater::_calculateCharacterIndexBeforeTruncationMessage:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:39"]
  T15["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  S15 -->|calls| T15
  S16["method:ASTextKitTailTruncater::_calculateCharacterIndexBeforeTruncationMessage:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:39"]
  T16["method:ASTextKitTailTruncater::_findTruncationInsertionPointAtOrBeforeCharacterIndex:layoutManager:textStorage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:116"]
  S16 -->|calls| T16
  S17["method:ASTextKitTailTruncater::truncate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:151"]
  T17["method:ASTextKitTailTruncater::_calculateCharacterIndexBeforeTruncationMessage:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:39"]
  S17 -->|calls| T17
  S18["method:ASTextNodeWordKerner::layoutManager:boundingBoxForControlGlyphAtIndex:forTextContainer:proposedLineFragment:glyphPosition:characterIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextNodeWordKerner.mm:77"]
  T18["method:ASTextNodeWordKerner::_wordKernedSpaceWidthForCharacterAtIndex:atGlyphPosition:forTextContainer:layoutManager:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextNodeWordKerner.mm:83"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.h:1"]
  T19["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S19 -->|calls| T19
  S20["function:UIImage::cachedImageNamed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:17"]
  T20["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S20 -->|calls| T20
  S21["function:UIImage::cachedImageNamed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:17"]
  T21["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S21 -->|calls| T21
  S22["method:UIImage::as_imageNamed:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:48"]
  T22["function:UIImage::cachedImageNamed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:17"]
  S22 -->|calls| T22
  S23["method:UIImage::as_imageNamed:compatibleWithTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:53"]
  T23["function:UIImage::cachedImageNamed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:17"]
  S23 -->|calls| T23
  S24["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:64"]
  T24["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:124"]
  S24 -->|calls| T24
  S25["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:77"]
  T25["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:143"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 149`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextKitFontSizeAdjuster::boundingBoxForString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:112"]
  T1["property:ASTextKitFontSizeAdjuster::sizingTextContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:26"]
  S1 -->|calls| T1
  S2["method:ASTextKitFontSizeAdjuster::boundingBoxForString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:112"]
  T2["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S2 -->|calls| T2
  S3["method:ASTextKitFontSizeAdjuster::sizingLayoutManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:127"]
  T3["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S3 -->|calls| T3
  S4["method:ASTextKitFontSizeAdjuster::scaleFactor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:152"]
  T4["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S4 -->|calls| T4
  S5["method:ASTextKitFontSizeAdjuster::scaleFactor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:152"]
  T5["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S5 -->|calls| T5
  S6["method:ASTextKitFontSizeAdjuster::scaleFactor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:152"]
  T6["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S6 -->|calls| T6
  S7["method:ASTextKitFontSizeAdjuster::scaleFactor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:152"]
  T7["method:ASTextKitFontSizeAdjuster::adjustFontSizeForAttributeString:withScaleFactor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:53"]
  S7 -->|calls| T7
  S8["method:ASTextKitRenderer::rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:27"]
  T8["method:ASTextKitRenderer::unlockedRectsForTextRange:measureOptions:layoutManager:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:40"]
  S8 -->|calls| T8
  S9["method:ASTextKitRenderer::unlockedRectsForTextRange:measureOptions:layoutManager:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:40"]
  T9["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S9 -->|calls| T9
  S10["method:ASTextKitRenderer::unlockedRectsForTextRange:measureOptions:layoutManager:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:40"]
  T10["method:ASTextKitRenderer::_internalRectForGlyphAtIndex:measureOption:layoutManager:textContainer:textStorage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:181"]
  S10 -->|calls| T10
  S11["method:ASTextKitRenderer::nearestTextIndexAtPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:159"]
  T11["method:ASTextKitRenderer::enumerateTextIndexesAtPosition:usingBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:270"]
  S11 -->|calls| T11
  S12["method:ASTextKitRenderer::enumerateTextIndexesAtPosition:usingBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:270"]
  T12["method:ASTextKitRenderer::_internalRectForGlyphAtIndex:measureOption:layoutManager:textContainer:textStorage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:181"]
  S12 -->|calls| T12
  S13["method:ASTextKitRenderer::enumerateTextIndexesAtPosition:usingBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:270"]
  T13["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S13 -->|calls| T13
  S14["method:ASTextKitRenderer::trailingRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:343"]
  T14["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S14 -->|calls| T14
  S15["method:ASTextKitRenderer::trailingRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:343"]
  T15["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S15 -->|calls| T15
  S16["method:ASTextKitRenderer::trailingRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:343"]
  T16["method:ASTextKitRenderer::unlockedRectsForTextRange:measureOptions:layoutManager:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:40"]
  S16 -->|calls| T16
  S17["method:ASTextKitRenderer::frameForTextRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:365"]
  T17["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S17 -->|calls| T17
  S18["method:ASTextKitTextCheckingResult::initWithType:entityAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:29"]
  T18["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S18 -->|calls| T18
  S19["method:ASTextKitRenderer::textCheckingResultAtPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:55"]
  T19["method:ASTextKitRenderer::enumerateTextIndexesAtPosition:usingBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:270"]
  S19 -->|calls| T19
  S20["method:ASTextKitRenderer::textCheckingResultAtPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:55"]
  T20["method:ASTextKitTextCheckingResult::initWithType:entityAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:29"]
  S20 -->|calls| T20
  S21["method:ASTextKitRenderer::textCheckingResultAtPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:55"]
  T21["method:ASTextKitTextCheckingResult::initWithType:entityAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:29"]
  S21 -->|calls| T21
  S22["function:_defaultAvoidTruncationCharacterSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:24"]
  T22["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S22 -->|calls| T22
  S23["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T24["property:ASTextKitRenderer::shadower<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.h:53"]
  S24 -->|calls| T24
  S25["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T25["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 149`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextKitRenderer::unlockedRectsForTextRange:measureOptions:layoutManager:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:40"]
  T1["method:ASTextKitRenderer::_internalRectForGlyphAtIndex:measureOption:layoutManager:textContainer:textStorage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:181"]
  S1 -->|calls| T1
  S2["method:ASTextKitRenderer::nearestTextIndexAtPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:159"]
  T2["method:ASTextKitRenderer::enumerateTextIndexesAtPosition:usingBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:270"]
  S2 -->|calls| T2
  S3["method:ASTextKitRenderer::enumerateTextIndexesAtPosition:usingBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:270"]
  T3["method:ASTextKitRenderer::_internalRectForGlyphAtIndex:measureOption:layoutManager:textContainer:textStorage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:181"]
  S3 -->|calls| T3
  S4["method:ASTextKitRenderer::enumerateTextIndexesAtPosition:usingBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:270"]
  T4["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S4 -->|calls| T4
  S5["method:ASTextKitRenderer::trailingRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:343"]
  T5["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S5 -->|calls| T5
  S6["method:ASTextKitRenderer::trailingRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:343"]
  T6["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S6 -->|calls| T6
  S7["method:ASTextKitRenderer::trailingRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:343"]
  T7["method:ASTextKitRenderer::unlockedRectsForTextRange:measureOptions:layoutManager:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:40"]
  S7 -->|calls| T7
  S8["method:ASTextKitRenderer::frameForTextRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:365"]
  T8["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S8 -->|calls| T8
  S9["method:ASTextKitTextCheckingResult::initWithType:entityAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:29"]
  T9["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S9 -->|calls| T9
  S10["method:ASTextKitRenderer::textCheckingResultAtPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:55"]
  T10["method:ASTextKitRenderer::enumerateTextIndexesAtPosition:usingBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:270"]
  S10 -->|calls| T10
  S11["method:ASTextKitRenderer::textCheckingResultAtPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:55"]
  T11["method:ASTextKitTextCheckingResult::initWithType:entityAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:29"]
  S11 -->|calls| T11
  S12["method:ASTextKitRenderer::textCheckingResultAtPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:55"]
  T12["method:ASTextKitTextCheckingResult::initWithType:entityAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+TextChecking.mm:29"]
  S12 -->|calls| T12
  S13["function:_defaultAvoidTruncationCharacterSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:24"]
  T13["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S13 -->|calls| T13
  S14["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T14["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S14 -->|calls| T14
  S15["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T15["property:ASTextKitRenderer::shadower<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.h:53"]
  S15 -->|calls| T15
  S16["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T16["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  S16 -->|calls| T16
  S17["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T17["function:_defaultAvoidTruncationCharacterSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:24"]
  S17 -->|calls| T17
  S18["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T18["method:ASTextKitTailTruncater::initWithContext:truncationAttributedString:avoidTailTruncationSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:24"]
  S18 -->|calls| T18
  S19["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T19["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S19 -->|calls| T19
  S20["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T20["method:ASTextKitFontSizeAdjuster::initWithContext:constrainedSize:textKitAttributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:41"]
  S20 -->|calls| T20
  S21["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T21["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S21 -->|calls| T21
  S22["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T22["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  S22 -->|calls| T22
  S23["method:ASTextKitRenderer::stringDrawingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:85"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T24["method:ASTextKitFontSizeAdjuster::scaleFactor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:152"]
  S24 -->|calls| T24
  S25["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T25["property:ASTextKitRenderer::fontSizeAdjuster<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.h:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

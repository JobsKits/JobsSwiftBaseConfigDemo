# `calls 符号关系 - 167`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  T1["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S1 -->|calls| T1
  S2["method:ASTextKitContext::performBlockWithLockedTextKitComponents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:90"]
  T2["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.h:1"]
  T3["function:NSAttributedStringAttributesForCoreTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:40"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.h:1"]
  T4["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  S4 -->|calls| T4
  S5["function:NSAttributedStringAttributesForCoreTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:40"]
  T5["function:ASAttributeWithNameIsUnsupportedCoreTextAttribute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:18"]
  S5 -->|calls| T5
  S6["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  T6["function:ASAttributeWithNameIsUnsupportedCoreTextAttribute<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:18"]
  S6 -->|calls| T6
  S7["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  T7["function:NSAttributedStringAttributesForCoreTextAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:40"]
  S7 -->|calls| T7
  S8["method:NSParagraphStyle::paragraphStyleWithCTParagraphStyle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:160"]
  T8["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S8 -->|calls| T8
  S9["method:ASTextKitEntityAttribute::initWithEntity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitEntityAttribute.mm:16"]
  T9["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S9 -->|calls| T9
  S10["method:ASTextKitEntityAttribute::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitEntityAttribute.mm:24"]
  T10["method:ASTextKitEntityAttribute::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitEntityAttribute.mm:24"]
  S10 -->|calls| T10
  S11["method:ASTextKitFontSizeAdjuster::initWithContext:constrainedSize:textKitAttributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:41"]
  T11["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S11 -->|calls| T11
  S12["method:ASTextKitFontSizeAdjuster::adjustFontSizeForAttributeString:withScaleFactor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:53"]
  T12["method:ASMutableAttributedStringBuilder::beginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:244"]
  S12 -->|calls| T12
  S13["method:ASTextKitFontSizeAdjuster::adjustFontSizeForAttributeString:withScaleFactor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:53"]
  T13["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S13 -->|calls| T13
  S14["method:ASTextKitFontSizeAdjuster::lineCountForString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:93"]
  T14["method:ASTextKitFontSizeAdjuster::sizingLayoutManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:127"]
  S14 -->|calls| T14
  S15["method:ASTextKitFontSizeAdjuster::lineCountForString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:93"]
  T15["property:ASTextKitFontSizeAdjuster::sizingTextContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:26"]
  S15 -->|calls| T15
  S16["method:ASTextKitFontSizeAdjuster::boundingBoxForString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:112"]
  T16["method:ASTextKitFontSizeAdjuster::sizingLayoutManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:127"]
  S16 -->|calls| T16
  S17["method:ASTextKitFontSizeAdjuster::boundingBoxForString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:112"]
  T17["property:ASTextKitFontSizeAdjuster::sizingTextContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:26"]
  S17 -->|calls| T17
  S18["method:ASTextKitFontSizeAdjuster::boundingBoxForString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:112"]
  T18["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S18 -->|calls| T18
  S19["method:ASTextKitFontSizeAdjuster::sizingLayoutManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:127"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["method:ASTextKitFontSizeAdjuster::scaleFactor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:152"]
  T20["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S20 -->|calls| T20
  S21["method:ASTextKitFontSizeAdjuster::scaleFactor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:152"]
  T21["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S21 -->|calls| T21
  S22["method:ASTextKitFontSizeAdjuster::scaleFactor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:152"]
  T22["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S22 -->|calls| T22
  S23["method:ASTextKitFontSizeAdjuster::scaleFactor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:152"]
  T23["method:ASTextKitFontSizeAdjuster::adjustFontSizeForAttributeString:withScaleFactor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:53"]
  S23 -->|calls| T23
  S24["method:ASTextKitRenderer::rectsForTextRange:measureOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:27"]
  T24["method:ASTextKitRenderer::unlockedRectsForTextRange:measureOptions:layoutManager:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:40"]
  S24 -->|calls| T24
  S25["method:ASTextKitRenderer::unlockedRectsForTextRange:measureOptions:layoutManager:textStorage:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:40"]
  T25["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

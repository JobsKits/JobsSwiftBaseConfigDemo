# `calls 符号关系 - 147`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSMutableAttributedString::as_setTextAttachment:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1120"]
  T1["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S1 -->|calls| T1
  S2["method:NSMutableAttributedString::as_setTextHighlight:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1124"]
  T2["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S2 -->|calls| T2
  S3["method:NSMutableAttributedString::as_setTextBlockBorder:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1128"]
  T3["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S3 -->|calls| T3
  S4["method:NSMutableAttributedString::as_setTextGlyphTransform:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1132"]
  T4["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S4 -->|calls| T4
  S5["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:userInfo:tapAction:longPressAction:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1137"]
  T5["method:NSMutableAttributedString::as_setColor:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:870"]
  S5 -->|calls| T5
  S6["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:userInfo:tapAction:longPressAction:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1137"]
  T6["method:NSMutableAttributedString::as_setTextHighlight:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1124"]
  S6 -->|calls| T6
  S7["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:tapAction:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1151"]
  T7["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:userInfo:tapAction:longPressAction:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1137"]
  S7 -->|calls| T7
  S8["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:userInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1163"]
  T8["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:userInfo:tapAction:longPressAction:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1137"]
  S8 -->|calls| T8
  S9["method:NSMutableAttributedString::as_insertString:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1175"]
  T9["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  S9 -->|calls| T9
  S10["method:NSMutableAttributedString::as_appendString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1180"]
  T10["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  S10 -->|calls| T10
  S11["method:NSMutableAttributedString::as_removeDiscontinuousAttributesInRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1186"]
  T11["method:NSMutableAttributedString::as_allDiscontinuousAttributeKeys<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1193"]
  S11 -->|calls| T11
  S12["method:NSMutableAttributedString::as_removeDiscontinuousAttributesInRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1186"]
  T12["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  S12 -->|calls| T12
  S13["method:ASLayoutManager::showCGGlyphs:positions:count:font:matrix:attributes:inContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASLayoutManager.mm:14"]
  T13["method:ASLayoutManager::showCGGlyphs:positions:count:font:matrix:attributes:inContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASLayoutManager.mm:14"]
  S13 -->|calls| T13
  S14["function:hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitAttributes.mm:19"]
  T14["function:ASHashBytes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S14 -->|calls| T14
  S15["method:ASTextKitComponentsTextView::initWithFrame:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:24"]
  T15["method:ASTextKitComponentsTextView::initWithFrame:textContainer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:24"]
  S15 -->|calls| T15
  S16["method:ASTextKitComponents::componentsWithAttributedSeedString:textContainerSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:78"]
  T16["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S16 -->|calls| T16
  S17["method:ASTextKitComponents::componentsWithAttributedSeedString:textContainerSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:78"]
  T17["method:ASTextKitComponents::componentsWithTextStorage:textContainerSize:layoutManager:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:88"]
  S17 -->|calls| T17
  S18["method:ASTextKitComponents::componentsWithAttributedSeedString:textContainerSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:78"]
  T18["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S18 -->|calls| T18
  S19["method:ASTextKitComponents::componentsWithTextStorage:textContainerSize:layoutManager:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:88"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  T20["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S20 -->|calls| T20
  S21["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  T21["method:Mutex::Mutex<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S21 -->|calls| T21
  S22["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  T22["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S22 -->|calls| T22
  S23["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  T24["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S24 -->|calls| T24
  S25["method:ASTextKitContext::initWithAttributedString:tintColor:lineBreakMode:maximumNumberOfLines:exclusionPaths:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitContext.mm:27"]
  T25["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

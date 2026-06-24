# `calls 符号关系 - 143`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSAttributedString::as_ligatureAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:156"]
  T1["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S1 -->|calls| T1
  S2["method:NSAttributedString::as_textEffectAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:164"]
  T2["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S2 -->|calls| T2
  S3["method:NSAttributedString::as_obliquenessAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:172"]
  T3["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S3 -->|calls| T3
  S4["method:NSAttributedString::as_expansionAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:180"]
  T4["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S4 -->|calls| T4
  S5["method:NSAttributedString::as_baselineOffsetAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:188"]
  T5["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S5 -->|calls| T5
  S6["method:NSAttributedString::as_verticalGlyphFormAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:196"]
  T6["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S6 -->|calls| T6
  S7["method:NSAttributedString::as_languageAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:205"]
  T7["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S7 -->|calls| T7
  S8["method:NSAttributedString::as_writingDirectionAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:213"]
  T8["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S8 -->|calls| T8
  S9["method:NSAttributedString::as_paragraphStyleAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:221"]
  T9["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S9 -->|calls| T9
  S10["method:NSAttributedString::as_textShadowAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:376"]
  T10["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S10 -->|calls| T10
  S11["method:NSAttributedString::as_textInnerShadowAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:384"]
  T11["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S11 -->|calls| T11
  S12["method:NSAttributedString::as_textUnderlineAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:392"]
  T12["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S12 -->|calls| T12
  S13["method:NSAttributedString::as_textStrikethroughAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:400"]
  T13["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S13 -->|calls| T13
  S14["method:NSAttributedString::as_textBorderAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:408"]
  T14["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S14 -->|calls| T14
  S15["method:NSAttributedString::as_textBackgroundBorderAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:416"]
  T15["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S15 -->|calls| T15
  S16["method:NSAttributedString::as_textGlyphTransformAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:424"]
  T16["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S16 -->|calls| T16
  S17["method:NSAttributedString::as_plainTextForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:430"]
  T17["method:ASMutableAttributedStringBuilder::string<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:234"]
  S17 -->|calls| T17
  S18["method:NSAttributedString::as_attachmentStringWithEmojiImage:fontSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:523"]
  T18["function:ASTextEmojiGetAscentWithFontSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:109"]
  S18 -->|calls| T18
  S19["method:NSAttributedString::as_attachmentStringWithEmojiImage:fontSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:523"]
  T19["function:ASTextEmojiGetDescentWithFontSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:126"]
  S19 -->|calls| T19
  S20["method:NSAttributedString::as_attachmentStringWithEmojiImage:fontSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:523"]
  T20["function:ASTextEmojiGetGlyphBoundingRectWithFontSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:143"]
  S20 -->|calls| T20
  S21["method:NSMutableAttributedString::setAs_attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:651"]
  T21["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S21 -->|calls| T21
  S22["method:NSMutableAttributedString::setAs_attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:651"]
  T22["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  S22 -->|calls| T22
  S23["method:NSMutableAttributedString::setAs_attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:651"]
  T23["method:NSMutableAttributedString::as_setAttribute:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:659"]
  S23 -->|calls| T23
  S24["method:NSMutableAttributedString::as_setAttribute:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:659"]
  T24["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S24 -->|calls| T24
  S25["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  T25["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

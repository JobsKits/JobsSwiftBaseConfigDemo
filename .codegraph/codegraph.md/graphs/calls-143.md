# `calls 符号关系 - 143`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSAttributedString::as_textInnerShadowAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:384"]
  T1["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S1 -->|calls| T1
  S2["method:NSAttributedString::as_textUnderlineAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:392"]
  T2["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S2 -->|calls| T2
  S3["method:NSAttributedString::as_textStrikethroughAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:400"]
  T3["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S3 -->|calls| T3
  S4["method:NSAttributedString::as_textBorderAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:408"]
  T4["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S4 -->|calls| T4
  S5["method:NSAttributedString::as_textBackgroundBorderAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:416"]
  T5["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S5 -->|calls| T5
  S6["method:NSAttributedString::as_textGlyphTransformAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:424"]
  T6["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S6 -->|calls| T6
  S7["method:NSAttributedString::as_plainTextForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:430"]
  T7["method:ASMutableAttributedStringBuilder::string<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:234"]
  S7 -->|calls| T7
  S8["method:NSAttributedString::as_attachmentStringWithEmojiImage:fontSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:523"]
  T8["function:ASTextEmojiGetAscentWithFontSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:109"]
  S8 -->|calls| T8
  S9["method:NSAttributedString::as_attachmentStringWithEmojiImage:fontSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:523"]
  T9["function:ASTextEmojiGetDescentWithFontSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:126"]
  S9 -->|calls| T9
  S10["method:NSAttributedString::as_attachmentStringWithEmojiImage:fontSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:523"]
  T10["function:ASTextEmojiGetGlyphBoundingRectWithFontSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:143"]
  S10 -->|calls| T10
  S11["method:NSMutableAttributedString::setAs_attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:651"]
  T11["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S11 -->|calls| T11
  S12["method:NSMutableAttributedString::setAs_attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:651"]
  T12["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  S12 -->|calls| T12
  S13["method:NSMutableAttributedString::setAs_attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:651"]
  T13["method:NSMutableAttributedString::as_setAttribute:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:659"]
  S13 -->|calls| T13
  S14["method:NSMutableAttributedString::as_setAttribute:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:659"]
  T14["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S14 -->|calls| T14
  S15["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  T15["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S15 -->|calls| T15
  S16["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  T16["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  S16 -->|calls| T16
  S17["method:NSMutableAttributedString::as_removeAttributesInRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:669"]
  T17["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  S17 -->|calls| T17
  S18["method:NSMutableAttributedString::setAs_font:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:675"]
  T18["method:NSMutableAttributedString::as_setFont:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:862"]
  S18 -->|calls| T18
  S19["method:NSMutableAttributedString::setAs_kern:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:688"]
  T19["method:NSMutableAttributedString::as_setKern:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:866"]
  S19 -->|calls| T19
  S20["method:NSMutableAttributedString::setAs_color:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:692"]
  T20["method:NSMutableAttributedString::as_setColor:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:870"]
  S20 -->|calls| T20
  S21["method:NSMutableAttributedString::setAs_backgroundColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:696"]
  T21["method:NSMutableAttributedString::as_setBackgroundColor:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:875"]
  S21 -->|calls| T21
  S22["method:NSMutableAttributedString::setAs_strokeWidth:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:700"]
  T22["method:NSMutableAttributedString::as_setStrokeWidth:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:879"]
  S22 -->|calls| T22
  S23["method:NSMutableAttributedString::setAs_strokeColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:704"]
  T23["method:NSMutableAttributedString::as_setStrokeColor:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:883"]
  S23 -->|calls| T23
  S24["method:NSMutableAttributedString::setAs_shadow:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:708"]
  T24["method:NSMutableAttributedString::as_setShadow:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:888"]
  S24 -->|calls| T24
  S25["method:NSMutableAttributedString::setAs_strikethroughStyle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:712"]
  T25["method:NSMutableAttributedString::as_setStrikethroughStyle:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:892"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

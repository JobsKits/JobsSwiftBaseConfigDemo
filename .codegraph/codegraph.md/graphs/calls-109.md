# `calls 符号关系 - 109`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  T1["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S1 -->|calls| T1
  S2["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withAttributedString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:123"]
  T2["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S2 -->|calls| T2
  S3["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withAttributedString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:123"]
  T3["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withAttributedString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:123"]
  S3 -->|calls| T3
  S4["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withAttributedString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:123"]
  T4["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S4 -->|calls| T4
  S5["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  T5["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S5 -->|calls| T5
  S6["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  T6["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S6 -->|calls| T6
  S7["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  T7["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  S7 -->|calls| T7
  S8["method:ASMutableAttributedStringBuilder::addAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:145"]
  T8["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S8 -->|calls| T8
  S9["method:ASMutableAttributedStringBuilder::addAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:145"]
  T9["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S9 -->|calls| T9
  S10["method:ASMutableAttributedStringBuilder::addAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:145"]
  T10["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  S10 -->|calls| T10
  S11["method:ASMutableAttributedStringBuilder::insertAttributedString:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:161"]
  T11["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S11 -->|calls| T11
  S12["method:ASMutableAttributedStringBuilder::insertAttributedString:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:161"]
  T12["method:ASMutableAttributedStringBuilder::insertAttributedString:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:161"]
  S12 -->|calls| T12
  S13["method:ASMutableAttributedStringBuilder::insertAttributedString:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:161"]
  T13["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S13 -->|calls| T13
  S14["method:ASMutableAttributedStringBuilder::appendAttributedString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:167"]
  T14["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S14 -->|calls| T14
  S15["method:ASMutableAttributedStringBuilder::appendAttributedString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:167"]
  T15["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S15 -->|calls| T15
  S16["method:ASMutableAttributedStringBuilder::deleteCharactersInRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:173"]
  T16["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S16 -->|calls| T16
  S17["method:ASMutableAttributedStringBuilder::deleteCharactersInRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:173"]
  T17["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S17 -->|calls| T17
  S18["method:ASMutableAttributedStringBuilder::setAttributedString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:179"]
  T18["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S18 -->|calls| T18
  S19["method:ASMutableAttributedStringBuilder::setAttributedString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:179"]
  T19["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S19 -->|calls| T19
  S20["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  T20["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S20 -->|calls| T20
  S21["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  T21["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S21 -->|calls| T21
  S22["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  T22["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  S22 -->|calls| T22
  S23["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  T23["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S23 -->|calls| T23
  S24["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  T24["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  S24 -->|calls| T24
  S25["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  T25["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

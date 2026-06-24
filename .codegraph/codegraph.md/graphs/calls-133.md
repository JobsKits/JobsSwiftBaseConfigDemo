# `calls 符号关系 - 133`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextLayout::_insideComposedCharacterSequences:position:block:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1159"]
  T1["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S1 -->|calls| T1
  S2["method:ASTextLayout::_insideComposedCharacterSequences:position:block:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1159"]
  T2["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S2 -->|calls| T2
  S3["method:ASTextLayout::_insideComposedCharacterSequences:position:block:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1159"]
  T3["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S3 -->|calls| T3
  S4["method:ASTextLayout::_insideEmoji:position:block:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1196"]
  T4["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S4 -->|calls| T4
  S5["method:ASTextLayout::_insideEmoji:position:block:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1196"]
  T5["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S5 -->|calls| T5
  S6["method:ASTextLayout::textPositionForPoint:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1380"]
  T6["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S6 -->|calls| T6
  S7["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T7["method:ASTextLayout::textPositionForPoint:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1380"]
  S7 -->|calls| T7
  S8["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T8["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S8 -->|calls| T8
  S9["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T9["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S9 -->|calls| T9
  S10["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T10["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S10 -->|calls| T10
  S11["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T11["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S11 -->|calls| T11
  S12["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T12["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S12 -->|calls| T12
  S13["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T13["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S13 -->|calls| T13
  S14["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T14["function:ASTextIsLinebreakString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:58"]
  S14 -->|calls| T14
  S15["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T15["function:ASTextIsLinebreakChar<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:23"]
  S15 -->|calls| T15
  S16["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T16["function:ASTextIsLinebreakChar<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:23"]
  S16 -->|calls| T16
  S17["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T17["method:ASTextLayout::_insideComposedCharacterSequences:position:block:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1159"]
  S17 -->|calls| T17
  S18["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T18["method:ASTextLayout::_insideEmoji:position:block:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1196"]
  S18 -->|calls| T18
  S19["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T19["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S19 -->|calls| T19
  S20["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T20["method:ASTextLayout::_isRightToLeftInLine:atPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1241"]
  S20 -->|calls| T20
  S21["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T21["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S21 -->|calls| T21
  S22["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T22["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S22 -->|calls| T22
  S23["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T23["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S23 -->|calls| T23
  S24["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T24["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S24 -->|calls| T24
  S25["method:ASTextLayout::textRangeAtPoint:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1682"]
  T25["method:ASTextLayout::textPositionForPoint:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1380"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

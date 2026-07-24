# `calls 符号关系 - 134`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  T1["method:ASTextLayout::textPositionForPoint:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1380"]
  S1 -->|calls| T1
  S2["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  T2["method:ASTextLayout::textPositionForPoint:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1380"]
  S2 -->|calls| T2
  S3["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  T3["function:ASTextLinebreakTailLength<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:74"]
  S3 -->|calls| T3
  S4["method:ASTextLayout::linePositionForPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1977"]
  T4["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S4 -->|calls| T4
  S5["method:ASTextLayout::caretRectForPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1990"]
  T5["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S5 -->|calls| T5
  S6["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T6["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S6 -->|calls| T6
  S7["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T7["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S7 -->|calls| T7
  S8["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T8["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S8 -->|calls| T8
  S9["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T9["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S9 -->|calls| T9
  S10["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T10["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S10 -->|calls| T10
  S11["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T11["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S11 -->|calls| T11
  S12["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T12["method:ASTextContainer::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S12 -->|calls| T12
  S13["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T13["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S13 -->|calls| T13
  S14["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T14["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S14 -->|calls| T14
  S15["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T15["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S15 -->|calls| T15
  S16["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T16["method:ASTextLayout::_runForLine:position:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1129"]
  S16 -->|calls| T16
  S17["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T17["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S17 -->|calls| T17
  S18["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T18["method:ASTextLayout::_runForLine:position:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1129"]
  S18 -->|calls| T18
  S19["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T19["function:ASTextGetCGColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:45"]
  S19 -->|calls| T19
  S20["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T20["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S20 -->|calls| T20
  S21["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T21["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S21 -->|calls| T21
  S22["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T22["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S22 -->|calls| T22
  S23["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T23["function:UIEdgeInsetRotateVertical<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:32"]
  S23 -->|calls| T23
  S24["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T24["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S24 -->|calls| T24
  S25["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T25["function:ASTextLayout::ASTextSetLinePatternInContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2461"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

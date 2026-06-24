# `calls 符号关系 - 135`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T1["method:ASTextLayout::_runForLine:position:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1129"]
  S1 -->|calls| T1
  S2["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T2["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S2 -->|calls| T2
  S3["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T3["method:ASTextLayout::_runForLine:position:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1129"]
  S3 -->|calls| T3
  S4["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T4["function:ASTextGetCGColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:45"]
  S4 -->|calls| T4
  S5["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T5["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S5 -->|calls| T5
  S6["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T6["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S6 -->|calls| T6
  S7["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T7["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S7 -->|calls| T7
  S8["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T8["function:UIEdgeInsetRotateVertical<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:32"]
  S8 -->|calls| T8
  S9["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T9["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S9 -->|calls| T9
  S10["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T10["function:ASTextLayout::ASTextSetLinePatternInContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2461"]
  S10 -->|calls| T10
  S11["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T11["function:UIEdgeInsetRotateVertical<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:32"]
  S11 -->|calls| T11
  S12["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T12["function:ASTextLayout::ASTextSetLinePatternInContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2461"]
  S12 -->|calls| T12
  S13["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T13["function:ASRoundPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S13 -->|calls| T13
  S14["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T14["function:ASRoundPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S14 -->|calls| T14
  S15["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T15["function:ASTextCGFloatToPixel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:224"]
  S15 -->|calls| T15
  S16["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T16["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S16 -->|calls| T16
  S17["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T17["function:ASFloorPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S17 -->|calls| T17
  S18["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T18["function:ASTextLayout::ASTextSetLinePatternInContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2461"]
  S18 -->|calls| T18
  S19["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T19["function:ASRoundPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S19 -->|calls| T19
  S20["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T20["function:ASRoundPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S20 -->|calls| T20
  S21["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T21["function:ASTextCGFloatToPixel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:224"]
  S21 -->|calls| T21
  S22["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T22["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S22 -->|calls| T22
  S23["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T23["function:ASFloorPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S23 -->|calls| T23
  S24["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T24["function:ASTextLayout::ASTextSetLinePatternInContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2461"]
  S24 -->|calls| T24
  S25["function:ASTextLayout::ASTextDrawText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2690"]
  T25["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

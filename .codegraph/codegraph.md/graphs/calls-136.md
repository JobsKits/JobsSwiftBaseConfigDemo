# `calls 符号关系 - 136`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T1["function:ASTextGetCGColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:45"]
  S1 -->|calls| T1
  S2["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T2["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S2 -->|calls| T2
  S3["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T3["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S3 -->|calls| T3
  S4["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T4["function:ASTextGetCGColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:45"]
  S4 -->|calls| T4
  S5["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T5["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S5 -->|calls| T5
  S6["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T6["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S6 -->|calls| T6
  S7["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T7["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S7 -->|calls| T7
  S8["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T8["function:UIEdgeInsetRotateVertical<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:32"]
  S8 -->|calls| T8
  S9["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T9["function:ASTextCGRectFitWithContentMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.mm:64"]
  S9 -->|calls| T9
  S10["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T10["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S10 -->|calls| T10
  S11["function:ASTextLayout::ASTextDrawShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3110"]
  T11["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S11 -->|calls| T11
  S12["function:ASTextLayout::ASTextDrawShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3110"]
  T12["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  S12 -->|calls| T12
  S13["function:ASTextLayout::ASTextDrawInnerShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3161"]
  T13["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S13 -->|calls| T13
  S14["function:ASTextLayout::ASTextDrawInnerShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3161"]
  T14["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  S14 -->|calls| T14
  S15["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T15["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S15 -->|calls| T15
  S16["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T16["function:ASTextCGRectPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:276"]
  S16 -->|calls| T16
  S17["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T17["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S17 -->|calls| T17
  S18["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T18["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S18 -->|calls| T18
  S19["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T19["function:ASTextCGRectPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:276"]
  S19 -->|calls| T19
  S20["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T20["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S20 -->|calls| T20
  S21["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T21["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S21 -->|calls| T21
  S22["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T22["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S22 -->|calls| T22
  S23["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T23["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S23 -->|calls| T23
  S24["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T24["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S24 -->|calls| T24
  S25["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T25["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

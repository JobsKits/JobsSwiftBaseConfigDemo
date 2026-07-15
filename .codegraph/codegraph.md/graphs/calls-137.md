# `calls 符号关系 - 137`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T1["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S1 -->|calls| T1
  S2["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T2["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S2 -->|calls| T2
  S3["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T3["function:ASTextCGRectPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:276"]
  S3 -->|calls| T3
  S4["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T4["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S4 -->|calls| T4
  S5["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T5["function:ASTextCGRectPixelHalf<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:276"]
  S5 -->|calls| T5
  S6["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T6["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S6 -->|calls| T6
  S7["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T7["function:ASTextLayout::ASTextDrawBlockBorder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2724"]
  S7 -->|calls| T7
  S8["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T8["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S8 -->|calls| T8
  S9["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T9["function:ASTextLayout::ASTextDrawBorder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2797"]
  S9 -->|calls| T9
  S10["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T10["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S10 -->|calls| T10
  S11["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T11["function:ASTextLayout::ASTextDrawShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3110"]
  S11 -->|calls| T11
  S12["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T12["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S12 -->|calls| T12
  S13["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T13["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  S13 -->|calls| T13
  S14["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T14["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S14 -->|calls| T14
  S15["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T15["function:ASTextLayout::ASTextDrawText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2690"]
  S15 -->|calls| T15
  S16["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T16["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S16 -->|calls| T16
  S17["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T17["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  S17 -->|calls| T17
  S18["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T18["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S18 -->|calls| T18
  S19["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T19["function:ASTextLayout::ASTextDrawInnerShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3161"]
  S19 -->|calls| T19
  S20["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T20["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S20 -->|calls| T20
  S21["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T21["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  S21 -->|calls| T21
  S22["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T22["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S22 -->|calls| T22
  S23["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T23["function:ASTextLayout::ASTextDrawBorder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2797"]
  S23 -->|calls| T23
  S24["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T24["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S24 -->|calls| T24
  S25["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T25["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

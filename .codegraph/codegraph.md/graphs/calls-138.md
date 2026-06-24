# `calls 符号关系 - 138`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T1["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  S1 -->|calls| T1
  S2["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T2["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S2 -->|calls| T2
  S3["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T3["function:ASTextLayout::ASTextDrawInnerShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3161"]
  S3 -->|calls| T3
  S4["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T4["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S4 -->|calls| T4
  S5["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T5["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  S5 -->|calls| T5
  S6["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T6["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S6 -->|calls| T6
  S7["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T7["function:ASTextLayout::ASTextDrawBorder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2797"]
  S7 -->|calls| T7
  S8["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T8["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S8 -->|calls| T8
  S9["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T9["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  S9 -->|calls| T9
  S10["method:ASTextLayout::drawInContext:size:debug:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3477"]
  T10["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  S10 -->|calls| T10
  S11["method:ASTextLine::setCTLine:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:30"]
  T11["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  S11 -->|calls| T11
  S12["method:ASTextLine::setPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:57"]
  T12["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  S12 -->|calls| T12
  S13["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T13["function:ASTextNSRangeFromCFRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:302"]
  S13 -->|calls| T13
  S14["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T14["method:ASTextRange::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S14 -->|calls| T14
  S15["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T15["method:ASTextRange::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S15 -->|calls| T15
  S16["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T16["method:ASTextRange::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.h:1"]
  T17["function:ASTextAttributeGetType<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:31"]
  S17 -->|calls| T17
  S18["method:ASTextBackedString::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:119"]
  T18["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S18 -->|calls| T18
  S19["method:ASTextBinding::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:146"]
  T19["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S19 -->|calls| T19
  S20["method:ASTextShadow::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:203"]
  T20["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S20 -->|calls| T20
  S21["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  T21["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S21 -->|calls| T21
  S22["method:ASTextDecoration::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:251"]
  T22["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S22 -->|calls| T22
  S23["method:ASTextBorder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  T23["method:ASTextBorder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S23 -->|calls| T23
  S24["method:ASTextBorder::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:305"]
  T24["method:ASTextBorder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S24 -->|calls| T24
  S25["method:ASTextAttachment::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:348"]
  T25["method:ASTextBorder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

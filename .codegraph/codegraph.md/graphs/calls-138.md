# `calls 符号关系 - 138`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextLine::setCTLine:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:30"]
  T1["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  S1 -->|calls| T1
  S2["method:ASTextLine::setPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:57"]
  T2["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  S2 -->|calls| T2
  S3["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T3["function:ASTextNSRangeFromCFRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:302"]
  S3 -->|calls| T3
  S4["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T4["method:ASTextRange::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S4 -->|calls| T4
  S5["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T5["method:ASTextRange::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S5 -->|calls| T5
  S6["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T6["method:ASTextRange::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.h:1"]
  T7["function:ASTextAttributeGetType<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:31"]
  S7 -->|calls| T7
  S8["method:ASTextBackedString::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:119"]
  T8["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S8 -->|calls| T8
  S9["method:ASTextBinding::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:146"]
  T9["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S9 -->|calls| T9
  S10["method:ASTextShadow::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:203"]
  T10["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S10 -->|calls| T10
  S11["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  T11["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S11 -->|calls| T11
  S12["method:ASTextDecoration::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:251"]
  T12["method:ASTextDecoration::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S12 -->|calls| T12
  S13["method:ASTextBorder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  T13["method:ASTextBorder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S13 -->|calls| T13
  S14["method:ASTextBorder::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:305"]
  T14["method:ASTextBorder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S14 -->|calls| T14
  S15["method:ASTextAttachment::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:348"]
  T15["method:ASTextBorder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S15 -->|calls| T15
  S16["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T16["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S16 -->|calls| T16
  S17["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T17["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S17 -->|calls| T17
  S18["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T18["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S18 -->|calls| T18
  S19["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T19["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S19 -->|calls| T19
  S20["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T20["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S20 -->|calls| T20
  S21["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T21["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S21 -->|calls| T21
  S22["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T22["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S22 -->|calls| T22
  S23["method:ASTextHighlight::setStrokeWidth:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:432"]
  T23["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S23 -->|calls| T23
  S24["method:ASTextHighlight::setStrokeWidth:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:432"]
  T24["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S24 -->|calls| T24
  S25["method:ASTextHighlight::setStrokeWidth:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:432"]
  T25["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

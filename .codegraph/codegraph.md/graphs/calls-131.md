# `calls 符号关系 - 131`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:_getSharedDebugOption<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:47"]
  T1["function:_initSharedDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:28"]
  S1 -->|calls| T1
  S2["function:_addDebugTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:55"]
  T2["function:_initSharedDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:28"]
  S2 -->|calls| T2
  S3["function:_removeDebugTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:62"]
  T3["function:_initSharedDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:28"]
  S3 -->|calls| T3
  S4["method:ASTextDebugOption::addDebugTarget:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:117"]
  T4["function:_addDebugTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:55"]
  S4 -->|calls| T4
  S5["method:ASTextDebugOption::removeDebugTarget:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:121"]
  T5["function:_removeDebugTarget<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:62"]
  S5 -->|calls| T5
  S6["method:ASTextDebugOption::sharedDebugOption<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:125"]
  T6["function:_getSharedDebugOption<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:47"]
  S6 -->|calls| T6
  S7["method:ASTextDebugOption::setSharedDebugOption:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:129"]
  T7["function:_setSharedDebugOption<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:39"]
  S7 -->|calls| T7
  S8["method:ASTextPosition::positionWithOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:16"]
  T8["method:ASTextPosition::positionWithOffset:affinity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:20"]
  S8 -->|calls| T8
  S9["method:ASTextRange::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  T9["method:ASTextRange::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S9 -->|calls| T9
  S10["method:ASTextRange::rangeWithRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:86"]
  T10["method:ASTextRange::rangeWithRange:affinity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:90"]
  S10 -->|calls| T10
  S11["method:ASTextRange::rangeWithRange:affinity:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:90"]
  T11["method:ASTextRange::rangeWithStart:end:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:96"]
  S11 -->|calls| T11
  S12["method:ASTextContainer::containerWithSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:110"]
  T12["method:ASTextContainer::containerWithSize:insets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:114"]
  S12 -->|calls| T12
  S13["method:ASTextContainer::containerWithSize:insets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:114"]
  T13["function:ASTextClipCGSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:26"]
  S13 -->|calls| T13
  S14["method:ASTextContainer::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  T14["method:ASTextContainer::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S14 -->|calls| T14
  S15["method:ASTextContainer::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:184"]
  T15["method:ASTextContainer::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S15 -->|calls| T15
  S16["method:ASTextContainer::setSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:226"]
  T16["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S16 -->|calls| T16
  S17["method:ASTextContainer::setSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:226"]
  T17["function:ASTextClipCGSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:26"]
  S17 -->|calls| T17
  S18["method:ASTextContainer::setInsets:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:234"]
  T18["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S18 -->|calls| T18
  S19["method:ASTextLayout::_init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:376"]
  T19["method:ASTextContainer::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S19 -->|calls| T19
  S20["method:ASTextLayout::layoutWithContainerSize:text:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:389"]
  T20["method:ASTextLayout::layoutWithContainer:text:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:394"]
  S20 -->|calls| T20
  S21["method:ASTextLayout::layoutWithContainer:text:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:394"]
  T21["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  S21 -->|calls| T21
  S22["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T22["method:ASTextContainer::makeImmutable<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:200"]
  S22 -->|calls| T22
  S23["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T23["method:ASTextLayout::_init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:376"]
  S23 -->|calls| T23
  S24["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T24["method:ASTextContainer::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S24 -->|calls| T24
  S25["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T25["method:ASTextContainer::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

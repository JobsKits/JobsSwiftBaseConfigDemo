# `calls 符号关系 - 044`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASFloorSizeValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:191"]
  T1["function:ASFloorPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S1 -->|calls| T1
  S2["function:ASFloorPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  T2["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S2 -->|calls| T2
  S3["function:ASCeilPointValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  T3["function:ASCeilPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S3 -->|calls| T3
  S4["function:ASCeilPointValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  T4["function:ASCeilPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S4 -->|calls| T4
  S5["function:ASCeilSizeValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  T5["function:ASCeilPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S5 -->|calls| T5
  S6["function:ASCeilSizeValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  T6["function:ASCeilPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S6 -->|calls| T6
  S7["function:ASCeilPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  T7["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S7 -->|calls| T7
  S8["function:ASRoundPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  T8["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S8 -->|calls| T8
  S9["function:ASLockSequence<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASLocking.h:103"]
  T9["method:ASNodeController::tryLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:122"]
  S9 -->|calls| T9
  S10["function:ASLockSequence<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASLocking.h:103"]
  T10["function:body<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S10 -->|calls| T10
  S11["function:ASLockSequence<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASLocking.h:103"]
  T11["function:ASUnlockSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASLocking.h:78"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T12["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T13["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T14["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T15["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T16["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S16 -->|calls| T16
  S17["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T17["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S17 -->|calls| T17
  S18["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T18["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S18 -->|calls| T18
  S19["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T19["function:ASPerformMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:17"]
  S19 -->|calls| T19
  S20["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T20["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S20 -->|calls| T20
  S21["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T21["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T22["method:ASTextKitComponents::needsMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:106"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T23["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T24["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T25["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

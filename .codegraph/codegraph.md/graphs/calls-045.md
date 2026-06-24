# `calls 符号关系 - 045`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T1["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S1 -->|calls| T1
  S2["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T2["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S2 -->|calls| T2
  S3["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T3["function:ASPerformMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:17"]
  S3 -->|calls| T3
  S4["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T4["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S4 -->|calls| T4
  S5["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T5["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T6["method:ASTextKitComponents::needsMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:106"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T7["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T8["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T9["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T10["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T11["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T12["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T13["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T14["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T15["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S15 -->|calls| T15
  S16["method:ASMapNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:40"]
  T16["method:ASMapNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:40"]
  S16 -->|calls| T16
  S17["method:ASMapNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:40"]
  T17["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S17 -->|calls| T17
  S18["method:ASMapNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:56"]
  T18["method:ASMapNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:56"]
  S18 -->|calls| T18
  S19["method:ASMapNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:56"]
  T19["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S19 -->|calls| T19
  S20["method:ASMapNode::dealloc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:64"]
  T20["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S20 -->|calls| T20
  S21["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T21["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:75"]
  S21 -->|calls| T21
  S22["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T22["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S22 -->|calls| T22
  S23["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T23["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S23 -->|calls| T23
  S24["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T24["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S24 -->|calls| T24
  S25["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T25["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:87"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

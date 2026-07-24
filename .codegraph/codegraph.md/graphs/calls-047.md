# `calls 符号关系 - 047`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMultiplexImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:277"]
  T1["method:ASMultiplexImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:277"]
  S1 -->|calls| T1
  S2["method:ASMultiplexImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:277"]
  T2["method:ASMultiplexImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:473"]
  S2 -->|calls| T2
  S3["method:ASMultiplexImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:277"]
  T3["method:ASMultiplexImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:489"]
  S3 -->|calls| T3
  S4["method:ASMultiplexImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:284"]
  T4["method:ASMultiplexImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:284"]
  S4 -->|calls| T4
  S5["method:ASMultiplexImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:284"]
  T5["method:ASMultiplexImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:473"]
  S5 -->|calls| T5
  S6["method:ASMultiplexImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:284"]
  T6["method:ASMultiplexImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:489"]
  S6 -->|calls| T6
  S7["method:ASMultiplexImageNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:291"]
  T7["method:ASMultiplexImageNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:291"]
  S7 -->|calls| T7
  S8["method:ASMultiplexImageNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:291"]
  T8["method:ASMultiplexImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:473"]
  S8 -->|calls| T8
  S9["method:ASMultiplexImageNode::setShouldRenderProgressImages:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:337"]
  T9["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S9 -->|calls| T9
  S10["method:ASMultiplexImageNode::setShouldRenderProgressImages:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:337"]
  T10["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S10 -->|calls| T10
  S11["method:ASMultiplexImageNode::setShouldRenderProgressImages:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:337"]
  T11["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S11 -->|calls| T11
  S12["method:ASMultiplexImageNode::setShouldRenderProgressImages:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:337"]
  T12["method:ASMultiplexImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:489"]
  S12 -->|calls| T12
  S13["method:ASMultiplexImageNode::reloadImageIdentifierSources<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:380"]
  T13["method:ASMultiplexImageNode::_loadImageIdentifiers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:432"]
  S13 -->|calls| T13
  S14["method:ASMultiplexImageNode::_setDisplayedImageIdentifier:withImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:391"]
  T14["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S14 -->|calls| T14
  S15["method:ASMultiplexImageNode::_loadImageIdentifiers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:432"]
  T15["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S15 -->|calls| T15
  S16["method:ASMultiplexImageNode::_loadImageIdentifiers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:432"]
  T16["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  S16 -->|calls| T16
  S17["method:ASMultiplexImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:473"]
  T17["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  S17 -->|calls| T17
  S18["method:ASMultiplexImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:489"]
  T18["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S18 -->|calls| T18
  S19["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  T19["method:ASMultiplexImageNode::_nextImageIdentifierToDownload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:529"]
  S19 -->|calls| T19
  S20["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  T20["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  S20 -->|calls| T20
  S21["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  T21["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S21 -->|calls| T21
  S22["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  T22["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S22 -->|calls| T22
  S23["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  T23["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S23 -->|calls| T23
  S24["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  T24["method:ASMultiplexImageNode::_loadALAssetWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:666"]
  S24 -->|calls| T24
  S25["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  T25["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

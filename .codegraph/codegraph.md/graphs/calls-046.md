# `calls 符号关系 - 046`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T1["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S1 -->|calls| T1
  S2["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T2["method:ASMapNode::removeLiveMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:316"]
  S2 -->|calls| T2
  S3["method:ASMapNode::setLiveMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:105"]
  T3["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S3 -->|calls| T3
  S4["method:ASMapNode::setLiveMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:105"]
  T4["method:ASMapNode::removeLiveMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:316"]
  S4 -->|calls| T4
  S5["method:ASMapNode::options<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:130"]
  T5["method:ASMapNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:40"]
  S5 -->|calls| T5
  S6["method:ASMapNode::setOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T6["method:ASMapNode::applySnapshotOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:285"]
  S6 -->|calls| T6
  S7["method:ASMapNode::setOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T7["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S7 -->|calls| T7
  S8["method:ASMapNode::setOptions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T8["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S8 -->|calls| T8
  S9["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:187"]
  T9["method:ASMapNode::setUpSnapshotter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:274"]
  S9 -->|calls| T9
  S10["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:187"]
  T10["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S10 -->|calls| T10
  S11["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:279"]
  T11["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S11 -->|calls| T11
  S12["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:296"]
  T12["method:ASMapNode::applySnapshotOptions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:285"]
  S12 -->|calls| T12
  S13["method:ASMapNode::setAnnotations:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:328"]
  T13["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S13 -->|calls| T13
  S14["method:ASMapNode::setSnapshotSizeWithReloadIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:386"]
  T14["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S14 -->|calls| T14
  S15["method:ASMapNode::setSnapshotSizeWithReloadIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:386"]
  T15["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S15 -->|calls| T15
  S16["method:ASMapNode::calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:397"]
  T16["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S16 -->|calls| T16
  S17["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:409"]
  T17["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:409"]
  S17 -->|calls| T17
  S18["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:409"]
  T18["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S18 -->|calls| T18
  S19["method:ASMapNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:419"]
  T19["method:ASMapNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMapNode.mm:419"]
  S19 -->|calls| T19
  S20["method:ASMultiplexImageNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:165"]
  T20["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  S20 -->|calls| T20
  S21["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  T21["method:ASMultiplexImageNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:165"]
  S21 -->|calls| T21
  S22["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  T22["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:69"]
  S22 -->|calls| T22
  S23["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  T23["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:63"]
  S23 -->|calls| T23
  S24["method:ASMultiplexImageNode::dealloc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:192"]
  T24["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S24 -->|calls| T24
  S25["method:ASMultiplexImageNode::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:199"]
  T25["method:ASMultiplexImageNode::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:199"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

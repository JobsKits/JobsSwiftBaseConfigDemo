# `calls 符号关系 - 049`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T1["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S1 -->|calls| T1
  S2["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T2["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S2 -->|calls| T2
  S3["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T3["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S3 -->|calls| T3
  S4["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T4["method:ASMultiplexImageNode::_nextImageIdentifierToDownload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:529"]
  S4 -->|calls| T4
  S5["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T5["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h:1"]
  T6["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h:1"]
  T7["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h:1"]
  T8["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h:1"]
  T9["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["method:ASNetworkImageLoadInfo::initWithURL:sourceType:downloadIdentifier:userInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.mm:13"]
  T10["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S10 -->|calls| T10
  S11["method:ASNetworkImageNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:83"]
  T11["method:ASNetworkImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:108"]
  S11 -->|calls| T11
  S12["method:ASNetworkImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:108"]
  T12["method:ASNetworkImageNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:83"]
  S12 -->|calls| T12
  S13["method:ASNetworkImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:108"]
  T13["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:69"]
  S13 -->|calls| T13
  S14["method:ASNetworkImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:108"]
  T14["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:63"]
  S14 -->|calls| T14
  S15["method:ASNetworkImageNode::setURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:179"]
  T15["method:ASNetworkImageNode::setURL:resetToDefault:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:184"]
  S15 -->|calls| T15
  S16["method:ASNetworkImageNode::setShouldRenderProgressImages:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:333"]
  T16["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  S16 -->|calls| T16
  S17["method:ASNetworkImageNode::displayWillStartAsynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:365"]
  T17["method:UIImage::asdk_image<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S17 -->|calls| T17
  S18["method:ASNetworkImageNode::displayWillStartAsynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:365"]
  T18["method:ASNetworkImageLoadInfo::initWithURL:sourceType:downloadIdentifier:userInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.mm:13"]
  S18 -->|calls| T18
  S19["method:ASNetworkImageNode::displayWillStartAsynchronously:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:365"]
  T19["method:ASNetworkImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:489"]
  S19 -->|calls| T19
  S20["method:ASNetworkImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:412"]
  T20["method:ASNetworkImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:412"]
  S20 -->|calls| T20
  S21["method:ASNetworkImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:412"]
  T21["method:ASNetworkImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:489"]
  S21 -->|calls| T21
  S22["method:ASNetworkImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:412"]
  T22["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  S22 -->|calls| T22
  S23["method:ASNetworkImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:419"]
  T23["method:ASNetworkImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:419"]
  S23 -->|calls| T23
  S24["method:ASNetworkImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:419"]
  T24["method:ASNetworkImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:489"]
  S24 -->|calls| T24
  S25["method:ASNetworkImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:419"]
  T25["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

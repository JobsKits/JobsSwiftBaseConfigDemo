# `calls 符号关系 - 049`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMultiplexImageNode::_loadPHAssetWithRequest:identifier:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:692"]
  T1["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S1 -->|calls| T1
  S2["method:ASMultiplexImageNode::_fetchImageWithIdentifierFromCache:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:781"]
  T2["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S2 -->|calls| T2
  S3["method:ASMultiplexImageNode::_fetchImageWithIdentifierFromCache:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:781"]
  T3["method:UIImage::asdk_image<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S3 -->|calls| T3
  S4["method:ASMultiplexImageNode::_fetchImageWithIdentifierFromCache:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:781"]
  T4["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S4 -->|calls| T4
  S5["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T5["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S5 -->|calls| T5
  S6["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T6["method:UIImage::asdk_image<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S6 -->|calls| T6
  S7["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T7["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S7 -->|calls| T7
  S8["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T8["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  S8 -->|calls| T8
  S9["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T9["property:ASMultiplexImageNode::shouldRetryImageDownload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.h:135"]
  S9 -->|calls| T9
  S10["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T10["property:ASMultiplexImageNode::shouldRetryImageDownload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.h:135"]
  S10 -->|calls| T10
  S11["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T11["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S11 -->|calls| T11
  S12["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T12["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S12 -->|calls| T12
  S13["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T13["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S13 -->|calls| T13
  S14["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T14["method:ASMultiplexImageNode::_nextImageIdentifierToDownload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:529"]
  S14 -->|calls| T14
  S15["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T15["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h:1"]
  T16["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h:1"]
  T17["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h:1"]
  T18["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.h:1"]
  T19["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["method:ASNetworkImageLoadInfo::initWithURL:sourceType:downloadIdentifier:userInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.mm:13"]
  T20["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S20 -->|calls| T20
  S21["method:ASNetworkImageNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:83"]
  T21["method:ASNetworkImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:108"]
  S21 -->|calls| T21
  S22["method:ASNetworkImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:108"]
  T22["method:ASNetworkImageNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:83"]
  S22 -->|calls| T22
  S23["method:ASNetworkImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:108"]
  T23["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:69"]
  S23 -->|calls| T23
  S24["method:ASNetworkImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:108"]
  T24["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:63"]
  S24 -->|calls| T24
  S25["method:ASNetworkImageNode::setURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:179"]
  T25["method:ASNetworkImageNode::setURL:resetToDefault:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:184"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 067`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  T1["method:ASMultiplexImageNode::_nextImageIdentifierToDownload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:529"]
  S1 -->|calls| T1
  S2["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  T2["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S2 -->|calls| T2
  S3["method:ASMultiplexImageNode::_loadNextImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:562"]
  T3["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S3 -->|calls| T3
  S4["method:ASMultiplexImageNode::_loadALAssetWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:666"]
  T4["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  S4 -->|calls| T4
  S5["method:ASMultiplexImageNode::_loadALAssetWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:666"]
  T5["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S5 -->|calls| T5
  S6["method:ASMultiplexImageNode::_loadALAssetWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:666"]
  T6["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S6 -->|calls| T6
  S7["method:ASMultiplexImageNode::_loadPHAssetWithRequest:identifier:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:692"]
  T7["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S7 -->|calls| T7
  S8["method:ASMultiplexImageNode::_loadPHAssetWithRequest:identifier:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:692"]
  T8["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S8 -->|calls| T8
  S9["method:ASMultiplexImageNode::_loadPHAssetWithRequest:identifier:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:692"]
  T9["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S9 -->|calls| T9
  S10["method:ASMultiplexImageNode::_loadPHAssetWithRequest:identifier:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:692"]
  T10["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S10 -->|calls| T10
  S11["method:ASMultiplexImageNode::_loadPHAssetWithRequest:identifier:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:692"]
  T11["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S11 -->|calls| T11
  S12["method:ASMultiplexImageNode::_loadPHAssetWithRequest:identifier:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:692"]
  T12["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S12 -->|calls| T12
  S13["method:ASMultiplexImageNode::_fetchImageWithIdentifierFromCache:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:781"]
  T13["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S13 -->|calls| T13
  S14["method:ASMultiplexImageNode::_fetchImageWithIdentifierFromCache:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:781"]
  T14["method:UIImage::asdk_image<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S14 -->|calls| T14
  S15["method:ASMultiplexImageNode::_fetchImageWithIdentifierFromCache:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:781"]
  T15["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S15 -->|calls| T15
  S16["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T16["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S16 -->|calls| T16
  S17["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T17["method:UIImage::asdk_image<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S17 -->|calls| T17
  S18["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T18["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S18 -->|calls| T18
  S19["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T19["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  S19 -->|calls| T19
  S20["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T20["property:ASMultiplexImageNode::shouldRetryImageDownload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.h:135"]
  S20 -->|calls| T20
  S21["method:ASMultiplexImageNode::_downloadImageWithIdentifier:URL:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:798"]
  T21["property:ASMultiplexImageNode::shouldRetryImageDownload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.h:135"]
  S21 -->|calls| T21
  S22["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T22["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S22 -->|calls| T22
  S23["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T23["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S23 -->|calls| T23
  S24["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T24["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S24 -->|calls| T24
  S25["method:ASMultiplexImageNode::_finishedLoadingImage:forIdentifier:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:884"]
  T25["method:ASMultiplexImageNode::_nextImageIdentifierToDownload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASMultiplexImageNode.mm:529"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

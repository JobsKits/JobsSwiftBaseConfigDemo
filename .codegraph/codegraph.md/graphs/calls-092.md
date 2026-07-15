# `calls 符号关系 - 092`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASPINRemoteImageDownloader::PINRemoteImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:156"]
  T1["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  S1 -->|calls| T1
  S2["method:ASPINRemoteImageDownloader::sharedImageManagerSupportsMemoryRemoval<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:196"]
  T2["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S2 -->|calls| T2
  S3["method:ASPINRemoteImageDownloader::synchronouslyFetchedCachedImageWithURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:215"]
  T3["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S3 -->|calls| T3
  S4["method:ASPINRemoteImageDownloader::cachedImageWithURL:callbackQueue:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:228"]
  T4["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S4 -->|calls| T4
  S5["method:ASPINRemoteImageDownloader::cachedImageWithURL:callbackQueue:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:228"]
  T5["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S5 -->|calls| T5
  S6["method:ASPINRemoteImageDownloader::cachedImageWithURL:callbackQueue:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:228"]
  T6["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S6 -->|calls| T6
  S7["method:ASPINRemoteImageDownloader::cachedImageWithURL:callbackQueue:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:228"]
  T7["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S7 -->|calls| T7
  S8["method:ASPINRemoteImageDownloader::clearFetchedImageFromCacheWithURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:248"]
  T8["method:ASPINRemoteImageDownloader::sharedImageManagerSupportsMemoryRemoval<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:196"]
  S8 -->|calls| T8
  S9["method:ASPINRemoteImageDownloader::clearFetchedImageFromCacheWithURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:248"]
  T9["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S9 -->|calls| T9
  S10["method:ASPINRemoteImageDownloader::downloadImageWithURL:shouldRetry:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:257"]
  T10["method:ASPINRemoteImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:271"]
  S10 -->|calls| T10
  S11["method:ASPINRemoteImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:271"]
  T11["function:PINRemoteImageManagerPriorityWithASImageDownloaderPriority<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:37"]
  S11 -->|calls| T11
  S12["method:ASPINRemoteImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:271"]
  T12["method:ASNetworkImageNode::downloadProgress<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:280"]
  S12 -->|calls| T12
  S13["method:ASPINRemoteImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:271"]
  T13["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S13 -->|calls| T13
  S14["method:ASPINRemoteImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:271"]
  T14["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S14 -->|calls| T14
  S15["method:ASPINRemoteImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:271"]
  T15["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S15 -->|calls| T15
  S16["method:ASPINRemoteImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:271"]
  T16["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S16 -->|calls| T16
  S17["method:ASPINRemoteImageDownloader::cancelImageDownloadForIdentifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:320"]
  T17["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S17 -->|calls| T17
  S18["method:ASPINRemoteImageDownloader::cancelImageDownloadWithResumePossibilityForIdentifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:326"]
  T18["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S18 -->|calls| T18
  S19["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T19["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S19 -->|calls| T19
  S20["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T20["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S20 -->|calls| T20
  S21["method:ASPINRemoteImageDownloader::setPriority:withDownloadIdentifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:347"]
  T21["function:PINRemoteImageManagerPriorityWithASImageDownloaderPriority<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:37"]
  S21 -->|calls| T21
  S22["method:ASPINRemoteImageDownloader::setPriority:withDownloadIdentifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:347"]
  T22["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S22 -->|calls| T22
  S23["method:ASPINRemoteImageDownloader::_performWithCallbackQueue:work:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:380"]
  T23["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S23 -->|calls| T23
  S24["function:ASPageCoordinateForPageThatContainsPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:21"]
  T24["function:ASPageCoordinateMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:11"]
  S24 -->|calls| T24
  S25["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  T25["function:ASPageCoordinateGetX<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:26"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

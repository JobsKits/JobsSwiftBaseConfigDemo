# `calls 符号关系 - 082`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  T1["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S1 -->|calls| T1
  S2["method:ASBasicImageDownloaderContext::completeWithImage:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:138"]
  T2["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S2 -->|calls| T2
  S3["method:NSURLRequest::setAsyncdisplaykit_context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:205"]
  T3["function:NSURLRequest::ContextKey<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:201"]
  S3 -->|calls| T3
  S4["method:NSURLRequest::asyncdisplaykit_context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:209"]
  T4["function:NSURLRequest::ContextKey<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:201"]
  S4 -->|calls| T4
  S5["method:ASBasicImageDownloader::sharedImageDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:227"]
  T5["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  S5 -->|calls| T5
  S6["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  T6["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S6 -->|calls| T6
  S7["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  T7["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S7 -->|calls| T7
  S8["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:255"]
  T8["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  S8 -->|calls| T8
  S9["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  T9["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S9 -->|calls| T9
  S10["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  T10["function:NSURLSessionTaskPriorityWithImageDownloaderPriority<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:29"]
  S10 -->|calls| T10
  S11["method:ASBasicImageDownloader::cancelImageDownloadForIdentifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:310"]
  T11["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S11 -->|calls| T11
  S12["method:ASBasicImageDownloader::URLSession:downloadTask:didFinishDownloadingToURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:331"]
  T12["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S12 -->|calls| T12
  S13["method:ASBatchContext::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:25"]
  T13["method:ASBatchContext::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:25"]
  S13 -->|calls| T13
  S14["method:ASBatchContext::completeBatchFetching:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:48"]
  T14["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S14 -->|calls| T14
  S15["method:ASCollectionElement::initWithNodeModel:nodeBlock:supplementaryElementKind:constrainedSize:owningNode:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:26"]
  T15["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S15 -->|calls| T15
  S16["method:ASCollectionElement::node<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:46"]
  T16["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S16 -->|calls| T16
  S17["method:ASCollectionElement::node<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:46"]
  T17["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S17 -->|calls| T17
  S18["method:ASCollectionElement::setTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:70"]
  T18["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S18 -->|calls| T18
  S19["method:ASCollectionElement::setTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:70"]
  T19["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S19 -->|calls| T19
  S20["method:ASCollectionFlowLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:31"]
  T20["method:ASCollectionFlowLayoutDelegate::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:26"]
  S20 -->|calls| T20
  S21["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T21["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  S21 -->|calls| T21
  S22["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T22["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  S22 -->|calls| T22
  S23["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T23["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S23 -->|calls| T23
  S24["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T24["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S24 -->|calls| T24
  S25["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T25["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

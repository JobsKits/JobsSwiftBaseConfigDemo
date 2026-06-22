# `calls 符号关系 - 101`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBasicImageDownloader::sharedImageDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:227"]
  T1["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  S1 -->|calls| T1
  S2["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  T2["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S2 -->|calls| T2
  S3["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  T3["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S3 -->|calls| T3
  S4["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:255"]
  T4["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  S4 -->|calls| T4
  S5["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  T5["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S5 -->|calls| T5
  S6["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  T6["function:NSURLSessionTaskPriorityWithImageDownloaderPriority<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:29"]
  S6 -->|calls| T6
  S7["method:ASBasicImageDownloader::cancelImageDownloadForIdentifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:310"]
  T7["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S7 -->|calls| T7
  S8["method:ASBasicImageDownloader::URLSession:downloadTask:didFinishDownloadingToURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:331"]
  T8["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S8 -->|calls| T8
  S9["method:ASBatchContext::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:25"]
  T9["method:ASBatchContext::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:25"]
  S9 -->|calls| T9
  S10["method:ASBatchContext::completeBatchFetching:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:48"]
  T10["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S10 -->|calls| T10
  S11["method:ASCollectionElement::initWithNodeModel:nodeBlock:supplementaryElementKind:constrainedSize:owningNode:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:26"]
  T11["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S11 -->|calls| T11
  S12["method:ASCollectionElement::node<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:46"]
  T12["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S12 -->|calls| T12
  S13["method:ASCollectionElement::node<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:46"]
  T13["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S13 -->|calls| T13
  S14["method:ASCollectionElement::setTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:70"]
  T14["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S14 -->|calls| T14
  S15["method:ASCollectionElement::setTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:70"]
  T15["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S15 -->|calls| T15
  S16["method:ASCollectionFlowLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:31"]
  T16["method:ASCollectionFlowLayoutDelegate::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:26"]
  S16 -->|calls| T16
  S17["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T17["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  S17 -->|calls| T17
  S18["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T18["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  S18 -->|calls| T18
  S19["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T19["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S19 -->|calls| T19
  S20["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T20["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S20 -->|calls| T20
  S21["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T21["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S21 -->|calls| T21
  S22["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T22["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S22 -->|calls| T22
  S23["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T23["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S23 -->|calls| T23
  S24["method:ASCollectionGalleryLayoutDelegate::additionalInfoForLayoutWithElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:70"]
  T24["method:_ASCollectionGalleryLayoutInfo::initWithItemSize:minimumLineSpacing:minimumInteritemSpacing:sectionInset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:14"]
  S24 -->|calls| T24
  S25["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T25["method:_ASGalleryLayoutItem::initWithItemSize:collectionElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

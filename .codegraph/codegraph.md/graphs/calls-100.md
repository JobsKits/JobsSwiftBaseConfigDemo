# `calls 符号关系 - 100`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASRangeDebugBarView::createRangeNodeWithColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:740"]
  T1["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S1 -->|calls| T1
  S2["method:_ASRangeDebugBarView::createRangeNodeWithColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:740"]
  T2["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  S2 -->|calls| T2
  S3["method:_ASRangeDebugBarView::whiteAttributedStringFromString:withSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:757"]
  T3["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S3 -->|calls| T3
  S4["function:ASDirectionalScreenfulBufferHorizontal<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:21"]
  T4["function:ASScrollDirectionContainsRight<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:23"]
  S4 -->|calls| T4
  S5["function:ASDirectionalScreenfulBufferVertical<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:34"]
  T5["function:ASScrollDirectionContainsDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:35"]
  S5 -->|calls| T5
  S6["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T6["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S6 -->|calls| T6
  S7["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T7["function:ASDirectionalScreenfulBufferHorizontal<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:21"]
  S7 -->|calls| T7
  S8["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T8["function:CGRectExpandHorizontally<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:47"]
  S8 -->|calls| T8
  S9["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T9["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S9 -->|calls| T9
  S10["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T10["function:ASDirectionalScreenfulBufferVertical<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:34"]
  S10 -->|calls| T10
  S11["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T11["function:CGRectExpandVertically<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:56"]
  S11 -->|calls| T11
  S12["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  T12["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S12 -->|calls| T12
  S13["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  T13["method:ASAbstractLayoutController::defaultTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:90"]
  S13 -->|calls| T13
  S14["method:ASAbstractLayoutController::tuningParametersForRangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:150"]
  T14["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S14 -->|calls| T14
  S15["method:ASAbstractLayoutController::setTuningParameters:forRangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:155"]
  T15["method:ASAbstractLayoutController::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:166"]
  S15 -->|calls| T15
  S16["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  T16["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S16 -->|calls| T16
  S17["method:ASAbstractLayoutController::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:166"]
  T17["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.h:1"]
  T18["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["method:ASBasicImageDownloaderContext::currentRequestLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:56"]
  T19["method:Mutex::Mutex<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S19 -->|calls| T19
  S20["method:ASBasicImageDownloaderContext::contextForURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:66"]
  T20["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S20 -->|calls| T20
  S21["method:ASBasicImageDownloaderContext::initWithURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:88"]
  T21["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S21 -->|calls| T21
  S22["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  T22["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S22 -->|calls| T22
  S23["method:ASBasicImageDownloaderContext::completeWithImage:error:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:138"]
  T23["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S23 -->|calls| T23
  S24["method:NSURLRequest::setAsyncdisplaykit_context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:205"]
  T24["function:NSURLRequest::ContextKey<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:201"]
  S24 -->|calls| T24
  S25["method:NSURLRequest::asyncdisplaykit_context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:209"]
  T25["function:NSURLRequest::ContextKey<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:201"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

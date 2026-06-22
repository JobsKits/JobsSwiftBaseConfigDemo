# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.h:1"]
  T1["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:813"]
  S1 -->|calls| T1
  S2["method:ASImageNodeContentsKey::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:110"]
  T2["function:ASHashBytes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S2 -->|calls| T2
  S3["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T3["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S3 -->|calls| T3
  S4["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T4["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S4 -->|calls| T4
  S5["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T5["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S5 -->|calls| T5
  S6["method:ASImageNode::dealloc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:191"]
  T6["method:ASImageNode::invalidateAnimatedImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:386"]
  S6 -->|calls| T6
  S7["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T7["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S7 -->|calls| T7
  S8["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T8["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S8 -->|calls| T8
  S9["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T9["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S9 -->|calls| T9
  S10["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T10["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S10 -->|calls| T10
  S11["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T11["method:ASImageNode::shouldShowImageScalingOverlay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:33"]
  S11 -->|calls| T11
  S12["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T12["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S12 -->|calls| T12
  S13["method:ASImageNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:288"]
  T13["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S13 -->|calls| T13
  S14["method:ASImageNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:288"]
  T14["property:ASDisplayNode::threadSafeBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:116"]
  S14 -->|calls| T14
  S15["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T15["method:ASImageNode::imageModificationBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:738"]
  S15 -->|calls| T15
  S16["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T16["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  S16 -->|calls| T16
  S17["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T17["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S17 -->|calls| T17
  S18["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T18["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S18 -->|calls| T18
  S19["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T19["method:Mutex::Mutex<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S19 -->|calls| T19
  S20["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T20["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S20 -->|calls| T20
  S21["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T21["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:479"]
  S21 -->|calls| T21
  S22["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T22["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S22 -->|calls| T22
  S23["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T23["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S23 -->|calls| T23
  S24["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T24["method:ASDisplayNode::willDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:470"]
  S24 -->|calls| T24
  S25["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T25["function:ASImageAlphaInfoIsOpaque<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:55"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

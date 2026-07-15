# `calls 符号关系 - 041`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  T1["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  S1 -->|calls| T1
  S2["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  T2["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S2 -->|calls| T2
  S3["method:ASImageNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:301"]
  T3["method:ASImageNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:301"]
  S3 -->|calls| T3
  S4["method:ASImageNode::displayLinkFired:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:323"]
  T4["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S4 -->|calls| T4
  S5["method:ASImageNode::displayLinkFired:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:323"]
  T5["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.h:1"]
  T6["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:813"]
  S6 -->|calls| T6
  S7["method:ASImageNodeContentsKey::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:110"]
  T7["function:ASHashBytes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S7 -->|calls| T7
  S8["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T8["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S8 -->|calls| T8
  S9["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T9["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S9 -->|calls| T9
  S10["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T10["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S10 -->|calls| T10
  S11["method:ASImageNode::dealloc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:191"]
  T11["method:ASImageNode::invalidateAnimatedImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:386"]
  S11 -->|calls| T11
  S12["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T12["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S12 -->|calls| T12
  S13["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T13["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S13 -->|calls| T13
  S14["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T14["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S14 -->|calls| T14
  S15["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T15["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S15 -->|calls| T15
  S16["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T16["method:ASImageNode::shouldShowImageScalingOverlay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:33"]
  S16 -->|calls| T16
  S17["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T17["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S17 -->|calls| T17
  S18["method:ASImageNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:288"]
  T18["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S18 -->|calls| T18
  S19["method:ASImageNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:288"]
  T19["property:ASDisplayNode::threadSafeBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:116"]
  S19 -->|calls| T19
  S20["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T20["method:ASImageNode::imageModificationBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:738"]
  S20 -->|calls| T20
  S21["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T21["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  S21 -->|calls| T21
  S22["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T22["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S22 -->|calls| T22
  S23["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T23["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S23 -->|calls| T23
  S24["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T24["method:Mutex::Mutex<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S24 -->|calls| T24
  S25["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T25["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

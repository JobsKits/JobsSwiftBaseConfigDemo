# `calls 符号关系 - 041`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T1["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  S1 -->|calls| T1
  S2["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T2["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  S2 -->|calls| T2
  S3["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T3["method:ASImageNode::startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S3 -->|calls| T3
  S4["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T4["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S4 -->|calls| T4
  S5["method:ASImageNode::startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  T5["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  S5 -->|calls| T5
  S6["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  T6["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S6 -->|calls| T6
  S7["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  T7["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  S7 -->|calls| T7
  S8["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  T8["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  S8 -->|calls| T8
  S9["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  T9["method:ASImageNode::startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S9 -->|calls| T9
  S10["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  T10["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  S10 -->|calls| T10
  S11["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  T11["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S11 -->|calls| T11
  S12["method:ASImageNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:301"]
  T12["method:ASImageNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:301"]
  S12 -->|calls| T12
  S13["method:ASImageNode::displayLinkFired:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:323"]
  T13["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S13 -->|calls| T13
  S14["method:ASImageNode::displayLinkFired:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:323"]
  T14["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.h:1"]
  T15["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:813"]
  S15 -->|calls| T15
  S16["method:ASImageNodeContentsKey::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:110"]
  T16["function:ASHashBytes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S16 -->|calls| T16
  S17["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T17["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S17 -->|calls| T17
  S18["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T18["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S18 -->|calls| T18
  S19["method:ASImageNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T19["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S19 -->|calls| T19
  S20["method:ASImageNode::dealloc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:191"]
  T20["method:ASImageNode::invalidateAnimatedImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:386"]
  S20 -->|calls| T20
  S21["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T21["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S21 -->|calls| T21
  S22["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T22["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S22 -->|calls| T22
  S23["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T23["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S23 -->|calls| T23
  S24["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T24["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S24 -->|calls| T24
  S25["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T25["method:ASImageNode::shouldShowImageScalingOverlay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

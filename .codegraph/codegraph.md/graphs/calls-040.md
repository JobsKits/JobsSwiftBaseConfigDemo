# `calls 符号关系 - 040`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASEditableTextNode::textViewShouldBeginEditing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:688"]
  T1["method:ASEditableTextNode::_delegateShouldBeginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:788"]
  S1 -->|calls| T1
  S2["method:ASEditableTextNode::textViewDidBeginEditing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:694"]
  T2["method:ASEditableTextNode::_delegateDidBeginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:796"]
  S2 -->|calls| T2
  S3["method:ASEditableTextNode::textView:shouldChangeTextInRange:replacementText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:700"]
  T3["method:ASEditableTextNode::_delegateShouldChangeTextInRange:replacementText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:802"]
  S3 -->|calls| T3
  S4["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T4["method:ASEditableTextNode::_updateDisplayingPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:447"]
  S4 -->|calls| T4
  S5["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T5["variable:invalidateCalculatedLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Subclasses.h:170"]
  S5 -->|calls| T5
  S6["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T6["method:ASEditableTextNode::_delegateDidUpdateText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:823"]
  S6 -->|calls| T6
  S7["method:ASEditableTextNode::textViewDidChangeSelection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:724"]
  T7["method:ASEditableTextNode::_delegateDidChangeSelectionFromSelectedRange:toSelectedRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:811"]
  S7 -->|calls| T7
  S8["method:ASEditableTextNode::textViewDidEndEditing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:745"]
  T8["method:ASEditableTextNode::_delegateDidFinishEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:840"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.h:1"]
  T9["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  S9 -->|calls| T9
  S10["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  T10["function:ASExperimentalFeaturesGetNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:13"]
  S10 -->|calls| T10
  S11["method:ASImageNode::_locked_setAnimatedImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:40"]
  T11["method:ASImageNode::animatedImageSet:previousAnimatedImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:87"]
  S11 -->|calls| T11
  S12["method:ASImageNode::setCoverImageCompleted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:116"]
  T12["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S12 -->|calls| T12
  S13["method:ASImageNode::_locked_setCoverImageCompleted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:124"]
  T13["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S13 -->|calls| T13
  S14["method:ASImageNode::_locked_setCoverImageCompleted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:124"]
  T14["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S14 -->|calls| T14
  S15["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T15["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S15 -->|calls| T15
  S16["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T16["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  S16 -->|calls| T16
  S17["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T17["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  S17 -->|calls| T17
  S18["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T18["method:ASImageNode::startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S18 -->|calls| T18
  S19["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T19["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S19 -->|calls| T19
  S20["method:ASImageNode::startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  T20["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  S20 -->|calls| T20
  S21["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  T21["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S21 -->|calls| T21
  S22["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  T22["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  S22 -->|calls| T22
  S23["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  T23["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  S23 -->|calls| T23
  S24["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  T24["method:ASImageNode::startAnimating<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S24 -->|calls| T24
  S25["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  T25["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

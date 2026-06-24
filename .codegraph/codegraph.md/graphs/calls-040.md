# `calls 符号关系 - 040`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASEditableTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:233"]
  T1["method:ASEditableTextNode::isDisplayingPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:367"]
  S1 -->|calls| T1
  S2["method:ASEditableTextNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  T2["method:ASEditableTextNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  S2 -->|calls| T2
  S3["method:ASEditableTextNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  T3["method:ASEditableTextNode::_layoutTextView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:465"]
  S3 -->|calls| T3
  S4["method:ASEditableTextNode::textView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:317"]
  T4["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S4 -->|calls| T4
  S5["method:ASEditableTextNode::setMaximumLinesToDisplay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:325"]
  T5["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S5 -->|calls| T5
  S6["method:ASEditableTextNode::attributedText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:394"]
  T6["method:ASEditableTextNode::isDisplayingPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:367"]
  S6 -->|calls| T6
  S7["method:ASEditableTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:405"]
  T7["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S7 -->|calls| T7
  S8["method:ASEditableTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:405"]
  T8["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S8 -->|calls| T8
  S9["method:ASEditableTextNode::setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:405"]
  T9["method:ASEditableTextNode::_updateDisplayingPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:447"]
  S9 -->|calls| T9
  S10["method:ASEditableTextNode::textInputTraits<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:519"]
  T10["method:_ASTextInputTraitsPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:38"]
  S10 -->|calls| T10
  S11["method:ASEditableTextNode::textViewShouldBeginEditing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:688"]
  T11["method:ASEditableTextNode::_delegateShouldBeginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:788"]
  S11 -->|calls| T11
  S12["method:ASEditableTextNode::textViewDidBeginEditing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:694"]
  T12["method:ASEditableTextNode::_delegateDidBeginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:796"]
  S12 -->|calls| T12
  S13["method:ASEditableTextNode::textView:shouldChangeTextInRange:replacementText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:700"]
  T13["method:ASEditableTextNode::_delegateShouldChangeTextInRange:replacementText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:802"]
  S13 -->|calls| T13
  S14["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T14["method:ASEditableTextNode::_updateDisplayingPlaceholder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:447"]
  S14 -->|calls| T14
  S15["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T15["variable:invalidateCalculatedLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Subclasses.h:170"]
  S15 -->|calls| T15
  S16["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T16["method:ASEditableTextNode::_delegateDidUpdateText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:823"]
  S16 -->|calls| T16
  S17["method:ASEditableTextNode::textViewDidChangeSelection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:724"]
  T17["method:ASEditableTextNode::_delegateDidChangeSelectionFromSelectedRange:toSelectedRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:811"]
  S17 -->|calls| T17
  S18["method:ASEditableTextNode::textViewDidEndEditing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:745"]
  T18["method:ASEditableTextNode::_delegateDidFinishEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:840"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.h:1"]
  T19["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  S19 -->|calls| T19
  S20["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  T20["function:ASExperimentalFeaturesGetNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:13"]
  S20 -->|calls| T20
  S21["method:ASImageNode::_locked_setAnimatedImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:40"]
  T21["method:ASImageNode::animatedImageSet:previousAnimatedImage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:87"]
  S21 -->|calls| T21
  S22["method:ASImageNode::setCoverImageCompleted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:116"]
  T22["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S22 -->|calls| T22
  S23["method:ASImageNode::_locked_setCoverImageCompleted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:124"]
  T23["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S23 -->|calls| T23
  S24["method:ASImageNode::_locked_setCoverImageCompleted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:124"]
  T24["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S24 -->|calls| T24
  S25["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T25["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 103`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASDisplayView::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:397"]
  T1["method:_ASDisplayView::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:397"]
  S1 -->|calls| T1
  S2["method:_ASDisplayView::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:410"]
  T2["method:ASEditableTextNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:500"]
  S2 -->|calls| T2
  S3["method:_ASDisplayView::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:410"]
  T3["method:_ASDisplayView::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:410"]
  S3 -->|calls| T3
  S4["method:_ASDisplayView::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:423"]
  T4["method:ASEditableTextNode::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:506"]
  S4 -->|calls| T4
  S5["method:_ASDisplayView::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:423"]
  T5["method:_ASDisplayView::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:423"]
  S5 -->|calls| T5
  S6["method:_ASDisplayView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:436"]
  T6["method:ASEditableTextNode::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:511"]
  S6 -->|calls| T6
  S7["method:_ASDisplayView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:436"]
  T7["method:_ASDisplayView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:436"]
  S7 -->|calls| T7
  S8["method:_ASDisplayView::isFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:449"]
  T8["method:ASEditableTextNode::isFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:489"]
  S8 -->|calls| T8
  S9["method:_ASDisplayView::isFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:449"]
  T9["method:_ASDisplayView::isFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:449"]
  S9 -->|calls| T9
  S10["method:_ASDisplayView::canPerformAction:withSender:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:462"]
  T10["method:_ASDisplayView::canPerformAction:withSender:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:462"]
  S10 -->|calls| T10
  S11["method:_ASDisplayView::layoutMarginsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:469"]
  T11["method:_ASDisplayView::layoutMarginsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:469"]
  S11 -->|calls| T11
  S12["method:_ASDisplayView::layoutMarginsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:469"]
  T12["method:ASDisplayNode::layoutMarginsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:991"]
  S12 -->|calls| T12
  S13["method:_ASDisplayView::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:477"]
  T13["method:_ASDisplayView::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:477"]
  S13 -->|calls| T13
  S14["method:_ASDisplayView::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:477"]
  T14["method:ASDisplayNode::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1051"]
  S14 -->|calls| T14
  S15["method:_ASDisplayView::canBecomeFocused<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:496"]
  T15["method:ASDisplayNode::canBecomeFocused<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:90"]
  S15 -->|calls| T15
  S16["method:_ASDisplayView::setNeedsFocusUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:508"]
  T16["method:ASDisplayNode::setNeedsFocusUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:95"]
  S16 -->|calls| T16
  S17["method:_ASDisplayView::updateFocusIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:514"]
  T17["method:ASDisplayNode::updateFocusIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:101"]
  S17 -->|calls| T17
  S18["method:_ASDisplayView::preferredFocusedView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:526"]
  T18["method:ASDisplayNode::preferredFocusedView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:117"]
  S18 -->|calls| T18
  S19["function:ASAccessibilityFrameForNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:68"]
  T19["function:ASFindWindowOfLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S19 -->|calls| T19
  S20["method:ASAccessibilityElement::accessibilityFrame<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:99"]
  T20["function:ASAccessibilityFrameForNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:68"]
  S20 -->|calls| T20
  S21["method:ASAccessibilityCustomAction::accessibilityFrame<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:116"]
  T21["function:ASAccessibilityFrameForNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:68"]
  S21 -->|calls| T21
  S22["function:CollectUIAccessibilityElementsForNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:124"]
  T22["function:ASDisplayNodePerformBlockOnEveryNodeBFS<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:113"]
  S22 -->|calls| T22
  S23["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T23["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S23 -->|calls| T23
  S24["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T24["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S24 -->|calls| T24
  S25["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T25["function:ASInteractiveAccessibilityTraitsMask<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:312"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

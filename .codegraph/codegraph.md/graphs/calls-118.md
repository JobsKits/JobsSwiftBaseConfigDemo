# `calls 符号关系 - 118`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T1["function:ASHierarchyStateIncludesTransitioningSupernodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:61"]
  S1 -->|calls| T1
  S2["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  T2["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S2 -->|calls| T2
  S3["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  T3["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S3 -->|calls| T3
  S4["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  T4["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::setNeedsFocusUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:95"]
  T5["method:_ASDisplayView::setNeedsFocusUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:508"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::updateFocusIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:101"]
  T6["method:_ASDisplayView::updateFocusIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:514"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:128"]
  T7["method:_ASDisplayView::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:397"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:137"]
  T8["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:137"]
  T9["method:ASDisplayNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:128"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:137"]
  T10["method:_ASDisplayView::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:410"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:150"]
  T11["method:_ASDisplayView::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:423"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:161"]
  T12["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:161"]
  T13["method:ASDisplayNode::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:150"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:161"]
  T14["method:_ASDisplayView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:436"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::isFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:174"]
  T15["method:_ASDisplayView::isFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:449"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T16["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T17["function:ASDisplayNodeNeedsSpecialPropertiesHandling<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:76"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T18["function:ASBoundsAndPositionForFrame<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:83"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T19["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T20["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T21["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T22["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T23["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T24["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  T25["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

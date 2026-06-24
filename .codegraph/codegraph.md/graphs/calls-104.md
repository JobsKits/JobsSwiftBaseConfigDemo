# `calls 符号关系 - 104`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASDisplayView::updateFocusIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:514"]
  T1["method:ASDisplayNode::updateFocusIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:101"]
  S1 -->|calls| T1
  S2["method:_ASDisplayView::preferredFocusedView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:526"]
  T2["method:ASDisplayNode::preferredFocusedView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:117"]
  S2 -->|calls| T2
  S3["function:ASAccessibilityFrameForNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:68"]
  T3["function:ASFindWindowOfLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S3 -->|calls| T3
  S4["method:ASAccessibilityElement::accessibilityFrame<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:99"]
  T4["function:ASAccessibilityFrameForNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:68"]
  S4 -->|calls| T4
  S5["method:ASAccessibilityCustomAction::accessibilityFrame<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:116"]
  T5["function:ASAccessibilityFrameForNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:68"]
  S5 -->|calls| T5
  S6["function:CollectUIAccessibilityElementsForNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:124"]
  T6["function:ASDisplayNodePerformBlockOnEveryNodeBFS<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:113"]
  S6 -->|calls| T6
  S7["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T7["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S7 -->|calls| T7
  S8["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T8["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S8 -->|calls| T8
  S9["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T9["function:ASInteractiveAccessibilityTraitsMask<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:312"]
  S9 -->|calls| T9
  S10["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T10["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  S10 -->|calls| T10
  S11["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T11["function:ASInteractiveAccessibilityTraitsMask<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:312"]
  S11 -->|calls| T11
  S12["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T12["function:SortAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:33"]
  S12 -->|calls| T12
  S13["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T13["function:SortAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:33"]
  S13 -->|calls| T13
  S14["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  T14["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  S14 -->|calls| T14
  S15["function:CollectAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T15["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S15 -->|calls| T15
  S16["function:CollectAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T16["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  S16 -->|calls| T16
  S17["function:CollectAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T17["function:CollectUIAccessibilityElementsForNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:124"]
  S17 -->|calls| T17
  S18["function:CollectAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T18["function:nodeIsHiddenFromAcessibility<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:219"]
  S18 -->|calls| T18
  S19["function:CollectAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T19["function:nodeIsHiddenFromAcessibility<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:219"]
  S19 -->|calls| T19
  S20["function:CollectAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T20["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  S20 -->|calls| T20
  S21["function:CollectAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T21["function:CollectUIAccessibilityElementsForNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:124"]
  S21 -->|calls| T21
  S22["method:_ASDisplayView::accessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:318"]
  T22["method:ASCollectionView::accessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:2531"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T23["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T24["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T25["function:CollectAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

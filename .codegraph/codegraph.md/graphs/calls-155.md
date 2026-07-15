# `calls 符号关系 - 155`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:StackScrollNode::removeAll<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:77"]
  T1["method:ASCollectionNode::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1063"]
  S1 -->|calls| T1
  S2["method:StackScrollNode::removeAll<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:77"]
  T2["method:ASCollectionNode::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1031"]
  S2 -->|calls| T2
  S3["method:StackScrollNode::replaceAll<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:86"]
  T3["method:ASCollectionNode::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1063"]
  S3 -->|calls| T3
  S4["method:StackScrollNode::replaceAll<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:86"]
  T4["method:ASCollectionNode::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1031"]
  S4 -->|calls| T4
  S5["method:StackScrollNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:96"]
  T5["method:StackScrollNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:96"]
  S5 -->|calls| T5
  S6["method:GradientDrawingNode::setDescriptor<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientDrawingNode.swift:29"]
  T6["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S6 -->|calls| T6
  S7["method:GradientDrawingNode::setDescriptor<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientDrawingNode.swift:29"]
  T7["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:590"]
  S7 -->|calls| T7
  S8["method:GradientDrawingNode::drawParameters<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientDrawingNode.swift:35"]
  T8["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S8 -->|calls| T8
  S9["method:GradientDrawingNode::draw<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientDrawingNode.swift:40"]
  T9["method:ASHighlightOverlayLayer::drawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:70"]
  S9 -->|calls| T9
  S10["method:GradientLayerNode::setDescriptor<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientLayerNode.swift:54"]
  T10["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S10 -->|calls| T10
  S11["method:GradientLayerNode::setDescriptor<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientLayerNode.swift:54"]
  T11["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  S11 -->|calls| T11
  S12["class:HostingCellNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:5"]
  T12["method:HostingCellNode::ContentNode::setContent<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:102"]
  S12 -->|calls| T12
  S13["method:HostingCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:42"]
  T13["method:HostingCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:42"]
  S13 -->|calls| T13
  S14["method:HostingCellNode::setContent<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:52"]
  T14["method:HostingCellNode::ContentNode::setContent<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:102"]
  S14 -->|calls| T14
  S15["class:HostingNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:25"]
  T15["method:HostingNode::setContent<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:63"]
  S15 -->|calls| T15
  S16["method:HostingNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:75"]
  T16["method:HostingNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:75"]
  S16 -->|calls| T16
  S17["method:HostingNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:75"]
  T17["method:UIResponder::findNearestViewController<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/UIResponder+.swift:4"]
  S17 -->|calls| T17
  S18["method:HostingNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:75"]
  T18["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  S18 -->|calls| T18
  S19["method:HostingNode::didExitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:90"]
  T19["method:HostingNode::didExitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:90"]
  S19 -->|calls| T19
  S20["method:HostingNode::didExitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:90"]
  T20["method:ASCollectionView::willMoveToWindow:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:2414"]
  S20 -->|calls| T20
  S21["method:HostingController::viewDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:106"]
  T21["method:HostingController::viewDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:106"]
  S21 -->|calls| T21
  S22["method:HostingController::viewWillLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:110"]
  T22["method:HostingController::viewWillLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:110"]
  S22 -->|calls| T22
  S23["method:HostingController::viewDidLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:121"]
  T23["method:HostingController::viewDidLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:121"]
  S23 -->|calls| T23
  S24["class:DisplayNodeViewController<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:30"]
  T24["method:DisplayNodeViewController::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:58"]
  S24 -->|calls| T24
  S25["class:PlainDisplayNodeViewController<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:63"]
  T25["method:DisplayNodeViewController::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:58"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

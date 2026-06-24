# `calls 符号关系 - 155`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:StyledEdgeNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:195"]
  T1["method:StyledEdgeNode::updateBorder<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:205"]
  S1 -->|calls| T1
  S2["method:StyledEdgeNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:195"]
  T2["method:StyledEdgeNode::updateStrategy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:227"]
  S2 -->|calls| T2
  S3["method:StyledEdgeNode::updateBorder<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:205"]
  T3["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S3 -->|calls| T3
  S4["method:StyledEdgeNode::updateStrategy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:227"]
  T4["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S4 -->|calls| T4
  S5["method:StyledEdgeNode::layoutDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:255"]
  T5["method:StyledEdgeNode::layoutDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:255"]
  S5 -->|calls| T5
  S6["class:WrapperCellNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/WrapperCellNode.swift:26"]
  T6["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  S6 -->|calls| T6
  S7["class:WrapperNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/WrapperNode.swift:26"]
  T7["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  S7 -->|calls| T7
  S8["method:StackScrollNode::append<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:67"]
  T8["method:ASCollectionNode::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1063"]
  S8 -->|calls| T8
  S9["method:StackScrollNode::append<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:67"]
  T9["method:ASCollectionNode::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1031"]
  S9 -->|calls| T9
  S10["method:StackScrollNode::removeAll<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:77"]
  T10["method:ASCollectionNode::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1063"]
  S10 -->|calls| T10
  S11["method:StackScrollNode::removeAll<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:77"]
  T11["method:ASCollectionNode::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1031"]
  S11 -->|calls| T11
  S12["method:StackScrollNode::replaceAll<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:86"]
  T12["method:ASCollectionNode::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1063"]
  S12 -->|calls| T12
  S13["method:StackScrollNode::replaceAll<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:86"]
  T13["method:ASCollectionNode::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1031"]
  S13 -->|calls| T13
  S14["method:StackScrollNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:96"]
  T14["method:StackScrollNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:96"]
  S14 -->|calls| T14
  S15["method:GradientDrawingNode::setDescriptor<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientDrawingNode.swift:29"]
  T15["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S15 -->|calls| T15
  S16["method:GradientDrawingNode::setDescriptor<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientDrawingNode.swift:29"]
  T16["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:590"]
  S16 -->|calls| T16
  S17["method:GradientDrawingNode::drawParameters<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientDrawingNode.swift:35"]
  T17["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S17 -->|calls| T17
  S18["method:GradientDrawingNode::draw<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientDrawingNode.swift:40"]
  T18["method:ASHighlightOverlayLayer::drawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:70"]
  S18 -->|calls| T18
  S19["method:GradientLayerNode::setDescriptor<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientLayerNode.swift:54"]
  T19["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S19 -->|calls| T19
  S20["method:GradientLayerNode::setDescriptor<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/GradientLayerNode.swift:54"]
  T20["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  S20 -->|calls| T20
  S21["class:HostingCellNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:5"]
  T21["method:HostingCellNode::ContentNode::setContent<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:102"]
  S21 -->|calls| T21
  S22["method:HostingCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:42"]
  T22["method:HostingCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:42"]
  S22 -->|calls| T22
  S23["method:HostingCellNode::setContent<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:52"]
  T23["method:HostingCellNode::ContentNode::setContent<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingCellNode.swift:102"]
  S23 -->|calls| T23
  S24["class:HostingNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:25"]
  T24["method:HostingNode::setContent<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:63"]
  S24 -->|calls| T24
  S25["method:HostingNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:75"]
  T25["method:HostingNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:75"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

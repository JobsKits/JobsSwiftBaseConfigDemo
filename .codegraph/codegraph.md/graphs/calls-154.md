# `calls 符号关系 - 154`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:OverlayNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OverlayNode.swift:26"]
  T1["method:_ASLayoutElementType::overlay<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:146"]
  S1 -->|calls| T1
  S2["class:PaddingNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/PaddingNode.swift:28"]
  T2["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  S2 -->|calls| T2
  S3["class:ShapeDrawingNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeDrawingNode.swift:30"]
  T3["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:590"]
  S3 -->|calls| T3
  S4["method:ShapeDrawingNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeDrawingNode.swift:89"]
  T4["method:ShapeDrawingNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeDrawingNode.swift:89"]
  S4 -->|calls| T4
  S5["class:ShapeLayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:29"]
  T5["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S5 -->|calls| T5
  S6["class:ShapeLayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:29"]
  T6["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S6 -->|calls| T6
  S7["class:ShapeLayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:29"]
  T7["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S7 -->|calls| T7
  S8["class:ShapeLayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:29"]
  T8["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S8 -->|calls| T8
  S9["method:ShapeLayerNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:89"]
  T9["method:ShapeLayerNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:89"]
  S9 -->|calls| T9
  S10["class:ShapeLayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:29"]
  T10["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S10 -->|calls| T10
  S11["class:StyledEdgeNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:54"]
  T11["method:StyledEdgeNode::updateBorder<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:205"]
  S11 -->|calls| T11
  S12["class:StyledEdgeNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:54"]
  T12["method:StyledEdgeNode::updateStrategy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:227"]
  S12 -->|calls| T12
  S13["class:StyledEdgeNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:54"]
  T13["method:StyledEdgeNode::updateBorder<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:205"]
  S13 -->|calls| T13
  S14["class:StyledEdgeNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:54"]
  T14["method:StyledEdgeNode::updateStrategy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:227"]
  S14 -->|calls| T14
  S15["method:StyledEdgeNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:195"]
  T15["method:StyledEdgeNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:195"]
  S15 -->|calls| T15
  S16["method:StyledEdgeNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:195"]
  T16["method:StyledEdgeNode::updateBorder<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:205"]
  S16 -->|calls| T16
  S17["method:StyledEdgeNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:195"]
  T17["method:StyledEdgeNode::updateStrategy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:227"]
  S17 -->|calls| T17
  S18["method:StyledEdgeNode::updateBorder<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:205"]
  T18["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S18 -->|calls| T18
  S19["method:StyledEdgeNode::updateStrategy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:227"]
  T19["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S19 -->|calls| T19
  S20["method:StyledEdgeNode::layoutDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:255"]
  T20["method:StyledEdgeNode::layoutDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:255"]
  S20 -->|calls| T20
  S21["class:WrapperCellNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/WrapperCellNode.swift:26"]
  T21["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  S21 -->|calls| T21
  S22["class:WrapperNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/WrapperNode.swift:26"]
  T22["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  S22 -->|calls| T22
  S23["method:StackScrollNode::append<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:67"]
  T23["method:ASCollectionNode::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1063"]
  S23 -->|calls| T23
  S24["method:StackScrollNode::append<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:67"]
  T24["method:ASCollectionNode::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1031"]
  S24 -->|calls| T24
  S25["method:StackScrollNode::removeAll<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Containers/StackScrollNode.swift:77"]
  T25["method:ASCollectionNode::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1063"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

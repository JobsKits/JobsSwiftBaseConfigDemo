# `calls 符号关系 - 154`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:OnAppearNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:47"]
  T1["method:OnAppearNode::onAppear<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:95"]
  S1 -->|calls| T1
  S2["method:OnAppearNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:47"]
  T2["method:OnAppearNode::DebuggingNode::setText<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:117"]
  S2 -->|calls| T2
  S3["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T3["method:ASOverlayLayoutSpec::setOverlay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:51"]
  S3 -->|calls| T3
  S4["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T4["method:_ASLayoutElementType::relativePosition<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:177"]
  S4 -->|calls| T4
  S5["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T5["method:_ASLayoutElementType::preferredSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:360"]
  S5 -->|calls| T5
  S6["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T6["method:_ASLayoutElementType::relativePosition<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:177"]
  S6 -->|calls| T6
  S7["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T7["method:_ASLayoutElementType::preferredSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:360"]
  S7 -->|calls| T7
  S8["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T8["method:_ASLayoutElementType::relativePosition<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:177"]
  S8 -->|calls| T8
  S9["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T9["method:_ASLayoutElementType::preferredSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:360"]
  S9 -->|calls| T9
  S10["method:TiledLayerView::hitTest<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:156"]
  T10["method:TiledLayerView::hitTest<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:156"]
  S10 -->|calls| T10
  S11["class:OverlayNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OverlayNode.swift:26"]
  T11["method:_ASLayoutElementType::overlay<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:146"]
  S11 -->|calls| T11
  S12["class:PaddingNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/PaddingNode.swift:28"]
  T12["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  S12 -->|calls| T12
  S13["class:ShapeDrawingNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeDrawingNode.swift:30"]
  T13["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:590"]
  S13 -->|calls| T13
  S14["method:ShapeDrawingNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeDrawingNode.swift:89"]
  T14["method:ShapeDrawingNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeDrawingNode.swift:89"]
  S14 -->|calls| T14
  S15["class:ShapeLayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:29"]
  T15["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S15 -->|calls| T15
  S16["class:ShapeLayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:29"]
  T16["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S16 -->|calls| T16
  S17["class:ShapeLayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:29"]
  T17["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S17 -->|calls| T17
  S18["class:ShapeLayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:29"]
  T18["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S18 -->|calls| T18
  S19["method:ShapeLayerNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:89"]
  T19["method:ShapeLayerNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:89"]
  S19 -->|calls| T19
  S20["class:ShapeLayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/ShapeLayerNode.swift:29"]
  T20["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S20 -->|calls| T20
  S21["class:StyledEdgeNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:54"]
  T21["method:StyledEdgeNode::updateBorder<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:205"]
  S21 -->|calls| T21
  S22["class:StyledEdgeNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:54"]
  T22["method:StyledEdgeNode::updateStrategy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:227"]
  S22 -->|calls| T22
  S23["class:StyledEdgeNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:54"]
  T23["method:StyledEdgeNode::updateBorder<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:205"]
  S23 -->|calls| T23
  S24["class:StyledEdgeNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:54"]
  T24["method:StyledEdgeNode::updateStrategy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:227"]
  S24 -->|calls| T24
  S25["method:StyledEdgeNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:195"]
  T25["method:StyledEdgeNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:195"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

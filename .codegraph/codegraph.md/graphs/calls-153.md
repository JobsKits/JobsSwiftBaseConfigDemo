# `calls 符号关系 - 153`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::finishTouches<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:130"]
  T1["method:ASImageNode::setDefaultFocusAppearance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:169"]
  S1 -->|calls| T1
  S2["method:ASImageNode::setFocusedState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:157"]
  T2["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  S2 -->|calls| T2
  S3["method:ASImageNode::setDefaultFocusAppearance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:169"]
  T3["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  S3 -->|calls| T3
  S4["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  T4["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S4 -->|calls| T4
  S5["class:AnyDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:60"]
  T5["method:ASDisplayNode::setLayoutSpecBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:21"]
  S5 -->|calls| T5
  S6["method:AnyDisplayNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:96"]
  T6["method:AnyDisplayNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:96"]
  S6 -->|calls| T6
  S7["method:AnyDisplayNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:101"]
  T7["method:AnyDisplayNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:101"]
  S7 -->|calls| T7
  S8["method:AnyDisplayNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:101"]
  T8["method:AnyDisplayNode::onLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:117"]
  S8 -->|calls| T8
  S9["method:AnyDisplayNode::onDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:106"]
  T9["method:AnyDisplayNode::onDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:106"]
  S9 -->|calls| T9
  S10["class:BackgroundNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/BackgroundNode.swift:26"]
  T10["method:_ASLayoutElementType::background<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:138"]
  S10 -->|calls| T10
  S11["method:HighlightCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:83"]
  T11["method:HighlightCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:83"]
  S11 -->|calls| T11
  S12["method:HighlightCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:83"]
  T12["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:155"]
  S12 -->|calls| T12
  S13["method:HighlightCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:83"]
  T13["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S13 -->|calls| T13
  S14["method:HighlightCellNode::touchesBegan<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:124"]
  T14["method:HighlightCellNode::touchesBegan<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:124"]
  S14 -->|calls| T14
  S15["method:HighlightCellNode::touchesEnded<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:129"]
  T15["method:HighlightCellNode::touchesEnded<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:129"]
  S15 -->|calls| T15
  S16["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  T16["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  S16 -->|calls| T16
  S17["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  T17["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:155"]
  S17 -->|calls| T17
  S18["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  T18["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S18 -->|calls| T18
  S19["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  T19["method:InteractiveNode::_onLongPress<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:168"]
  S19 -->|calls| T19
  S20["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  T20["method:_ASDisplayView::addGestureRecognizer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:280"]
  S20 -->|calls| T20
  S21["class:MaskingNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/MaskingNode.swift:29"]
  T21["enum_member:MaskingNode::Sizing::maskedContent<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/MaskingNode.swift:32"]
  S21 -->|calls| T21
  S22["class:MaskingNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/MaskingNode.swift:29"]
  T22["enum_member:StyledEdgeCornerRoundingStrategy::mask<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:36"]
  S22 -->|calls| T22
  S23["method:MaskingNode::layoutDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/MaskingNode.swift:61"]
  T23["method:MaskingNode::layoutDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/MaskingNode.swift:61"]
  S23 -->|calls| T23
  S24["method:OnAppearNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:47"]
  T24["method:OnAppearNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:47"]
  S24 -->|calls| T24
  S25["method:OnAppearNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:47"]
  T25["method:TiledLayerView::setOnDraw<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:167"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

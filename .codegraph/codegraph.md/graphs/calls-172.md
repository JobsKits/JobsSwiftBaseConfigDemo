# `calls 符号关系 - 172`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:BackgroundNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/BackgroundNode.swift:26"]
  T1["method:_ASLayoutElementType::background<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:138"]
  S1 -->|calls| T1
  S2["method:HighlightCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:83"]
  T2["method:HighlightCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:83"]
  S2 -->|calls| T2
  S3["method:HighlightCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:83"]
  T3["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:155"]
  S3 -->|calls| T3
  S4["method:HighlightCellNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:83"]
  T4["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S4 -->|calls| T4
  S5["method:HighlightCellNode::touchesBegan<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:124"]
  T5["method:HighlightCellNode::touchesBegan<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:124"]
  S5 -->|calls| T5
  S6["method:HighlightCellNode::touchesEnded<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:129"]
  T6["method:HighlightCellNode::touchesEnded<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/HighlightCellNode.swift:129"]
  S6 -->|calls| T6
  S7["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  T7["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  S7 -->|calls| T7
  S8["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  T8["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:155"]
  S8 -->|calls| T8
  S9["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  T9["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S9 -->|calls| T9
  S10["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  T10["method:InteractiveNode::_onLongPress<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:168"]
  S10 -->|calls| T10
  S11["method:InteractiveNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/InteractiveNode.swift:105"]
  T11["method:_ASDisplayView::addGestureRecognizer:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:280"]
  S11 -->|calls| T11
  S12["class:MaskingNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/MaskingNode.swift:29"]
  T12["enum_member:MaskingNode::Sizing::maskedContent<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/MaskingNode.swift:32"]
  S12 -->|calls| T12
  S13["class:MaskingNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/MaskingNode.swift:29"]
  T13["enum_member:StyledEdgeCornerRoundingStrategy::mask<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/StyledEdgeNode.swift:36"]
  S13 -->|calls| T13
  S14["method:MaskingNode::layoutDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/MaskingNode.swift:61"]
  T14["method:MaskingNode::layoutDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/MaskingNode.swift:61"]
  S14 -->|calls| T14
  S15["method:OnAppearNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:47"]
  T15["method:OnAppearNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:47"]
  S15 -->|calls| T15
  S16["method:OnAppearNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:47"]
  T16["method:TiledLayerView::setOnDraw<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:167"]
  S16 -->|calls| T16
  S17["method:OnAppearNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:47"]
  T17["method:OnAppearNode::onAppear<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:95"]
  S17 -->|calls| T17
  S18["method:OnAppearNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:47"]
  T18["method:OnAppearNode::DebuggingNode::setText<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:117"]
  S18 -->|calls| T18
  S19["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T19["method:ASOverlayLayoutSpec::setOverlay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:51"]
  S19 -->|calls| T19
  S20["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T20["method:_ASLayoutElementType::relativePosition<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:177"]
  S20 -->|calls| T20
  S21["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T21["method:_ASLayoutElementType::preferredSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:360"]
  S21 -->|calls| T21
  S22["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T22["method:_ASLayoutElementType::relativePosition<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:177"]
  S22 -->|calls| T22
  S23["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T23["method:_ASLayoutElementType::preferredSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:360"]
  S23 -->|calls| T23
  S24["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T24["method:_ASLayoutElementType::relativePosition<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:177"]
  S24 -->|calls| T24
  S25["method:OnAppearNode::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/OnAppearNode.swift:64"]
  T25["method:_ASLayoutElementType::preferredSize<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

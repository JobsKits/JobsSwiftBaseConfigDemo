# `calls 符号关系 - 156`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:PlainDisplayNodeViewController::viewDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:86"]
  T1["method:PlainDisplayNodeViewController::viewDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:86"]
  S1 -->|calls| T1
  S2["method:PlainDisplayNodeViewController::viewDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:86"]
  T2["method:_ASDisplayView::addSubview:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:229"]
  S2 -->|calls| T2
  S3["method:PlainDisplayNodeViewController::viewWillAppear<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:94"]
  T3["method:PlainDisplayNodeViewController::viewWillAppear<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:94"]
  S3 -->|calls| T3
  S4["method:NamedDisplayCellNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayCellNodeBase.swift:37"]
  T4["method:NamedDisplayCellNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayCellNodeBase.swift:37"]
  S4 -->|calls| T4
  S5["method:NamedDisplayCellNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayCellNodeBase.swift:37"]
  T5["method:NamedDisplayCellNodeBase::propagate<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayCellNodeBase.swift:70"]
  S5 -->|calls| T5
  S6["method:NamedDisplayNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:41"]
  T6["method:NamedDisplayNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:41"]
  S6 -->|calls| T6
  S7["method:NamedDisplayNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:41"]
  T7["method:NamedDisplayNodeBase::propagate<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:73"]
  S7 -->|calls| T7
  S8["method:NamedDisplayControlNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:92"]
  T8["method:NamedDisplayControlNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:92"]
  S8 -->|calls| T8
  S9["method:NamedDisplayControlNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:92"]
  T9["method:NamedDisplayControlNodeBase::propagate<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:124"]
  S9 -->|calls| T9
  S10["method:SafeAreaDisplayNode::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:44"]
  T10["method:SafeAreaDisplayNode::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:44"]
  S10 -->|calls| T10
  S11["method:SafeAreaDisplayNode::hitTest<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:53"]
  T11["method:SafeAreaDisplayNode::hitTest<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:53"]
  S11 -->|calls| T11
  S12["method:SafeAreaDisplayNode::hitTest<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:53"]
  T12["method:SafeAreaDisplayNode::hitTest<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:53"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::_makeNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Experiments/NodeFactory.swift:25"]
  T13["method:NSMapTable::setObject:forPage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:135"]
  S13 -->|calls| T13
  S14["struct:AnyLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/AnyLayout.swift:24"]
  T14["method:_ASTableViewCell::setElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:104"]
  S14 -->|calls| T14
  S15["struct:AnyLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/AnyLayout.swift:24"]
  T15["method:AnyLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/AnyLayout.swift:56"]
  S15 -->|calls| T15
  S16["struct:AnyLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/AnyLayout.swift:24"]
  T16["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S16 -->|calls| T16
  S17["method:AspectRatioLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/AspectRatioLayout.swift:19"]
  T17["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S17 -->|calls| T17
  S18["struct:BackgroundLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/BackgroundLayout.swift:4"]
  T18["method:_ASLayoutElementType::background<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:138"]
  S18 -->|calls| T18
  S19["method:BackgroundLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/BackgroundLayout.swift:14"]
  T19["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S19 -->|calls| T19
  S20["method:BackgroundLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/BackgroundLayout.swift:14"]
  T20["method:BackgroundLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/BackgroundLayout.swift:14"]
  S20 -->|calls| T20
  S21["method:CenterLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/CenterLayout.swift:19"]
  T21["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S21 -->|calls| T21
  S22["method:CenterLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/CenterLayout.swift:19"]
  T22["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S22 -->|calls| T22
  S23["method:CornerLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/CornerLayout.swift:27"]
  T23["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S23 -->|calls| T23
  S24["method:CornerLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/CornerLayout.swift:27"]
  T24["method:CornerLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/CornerLayout.swift:27"]
  S24 -->|calls| T24
  S25["method:InsetLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/InsetLayout.swift:13"]
  T25["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

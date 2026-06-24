# `calls 符号关系 - 156`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:HostingNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:75"]
  T1["method:UIResponder::findNearestViewController<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/UIResponder+.swift:4"]
  S1 -->|calls| T1
  S2["method:HostingNode::didEnterHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:75"]
  T2["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  S2 -->|calls| T2
  S3["method:HostingNode::didExitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:90"]
  T3["method:HostingNode::didExitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:90"]
  S3 -->|calls| T3
  S4["method:HostingNode::didExitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:90"]
  T4["method:ASCollectionView::willMoveToWindow:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:2414"]
  S4 -->|calls| T4
  S5["method:HostingController::viewDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:106"]
  T5["method:HostingController::viewDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:106"]
  S5 -->|calls| T5
  S6["method:HostingController::viewWillLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:110"]
  T6["method:HostingController::viewWillLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:110"]
  S6 -->|calls| T6
  S7["method:HostingController::viewDidLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:121"]
  T7["method:HostingController::viewDidLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Elements/HostingNode.swift:121"]
  S7 -->|calls| T7
  S8["class:DisplayNodeViewController<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:30"]
  T8["method:DisplayNodeViewController::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:58"]
  S8 -->|calls| T8
  S9["class:PlainDisplayNodeViewController<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:63"]
  T9["method:DisplayNodeViewController::layoutSpecThatFits<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:58"]
  S9 -->|calls| T9
  S10["method:PlainDisplayNodeViewController::viewDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:86"]
  T10["method:PlainDisplayNodeViewController::viewDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:86"]
  S10 -->|calls| T10
  S11["method:PlainDisplayNodeViewController::viewDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:86"]
  T11["method:_ASDisplayView::addSubview:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:229"]
  S11 -->|calls| T11
  S12["method:PlainDisplayNodeViewController::viewWillAppear<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:94"]
  T12["method:PlainDisplayNodeViewController::viewWillAppear<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/DisplayNodeViewController.swift:94"]
  S12 -->|calls| T12
  S13["method:NamedDisplayCellNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayCellNodeBase.swift:37"]
  T13["method:NamedDisplayCellNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayCellNodeBase.swift:37"]
  S13 -->|calls| T13
  S14["method:NamedDisplayCellNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayCellNodeBase.swift:37"]
  T14["method:NamedDisplayCellNodeBase::propagate<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayCellNodeBase.swift:70"]
  S14 -->|calls| T14
  S15["method:NamedDisplayNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:41"]
  T15["method:NamedDisplayNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:41"]
  S15 -->|calls| T15
  S16["method:NamedDisplayNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:41"]
  T16["method:NamedDisplayNodeBase::propagate<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:73"]
  S16 -->|calls| T16
  S17["method:NamedDisplayControlNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:92"]
  T17["method:NamedDisplayControlNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:92"]
  S17 -->|calls| T17
  S18["method:NamedDisplayControlNodeBase::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:92"]
  T18["method:NamedDisplayControlNodeBase::propagate<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/NamedDisplayNodeBase.swift:124"]
  S18 -->|calls| T18
  S19["method:SafeAreaDisplayNode::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:44"]
  T19["method:SafeAreaDisplayNode::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:44"]
  S19 -->|calls| T19
  S20["method:SafeAreaDisplayNode::hitTest<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:53"]
  T20["method:SafeAreaDisplayNode::hitTest<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:53"]
  S20 -->|calls| T20
  S21["method:SafeAreaDisplayNode::hitTest<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:53"]
  T21["method:SafeAreaDisplayNode::hitTest<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Tools/SafeAreaDisplayNode.swift:53"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::_makeNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Experiments/NodeFactory.swift:25"]
  T22["method:NSMapTable::setObject:forPage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:135"]
  S22 -->|calls| T22
  S23["struct:AnyLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/AnyLayout.swift:24"]
  T23["method:_ASTableViewCell::setElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:104"]
  S23 -->|calls| T23
  S24["struct:AnyLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/AnyLayout.swift:24"]
  T24["method:AnyLayout::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/AnyLayout.swift:56"]
  S24 -->|calls| T24
  S25["struct:AnyLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Layout/AnyLayout.swift:24"]
  T25["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

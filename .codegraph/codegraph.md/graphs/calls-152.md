# `calls 符号关系 - 152`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASControlNode::_pressDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:18"]
  T1["method:ASControlNode::setPressedState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:65"]
  S1 -->|calls| T1
  S2["method:ASControlNode::_pressDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:18"]
  T2["method:ASControlNode::setFocusedState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:57"]
  S2 -->|calls| T2
  S3["method:ASControlNode::didUpdateFocusInContext:withAnimationCoordinator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:41"]
  T3["method:ASControlNode::setFocusedState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:57"]
  S3 -->|calls| T3
  S4["method:ASControlNode::didUpdateFocusInContext:withAnimationCoordinator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:41"]
  T4["method:ASControlNode::setDefaultFocusAppearance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:81"]
  S4 -->|calls| T4
  S5["method:ASImageNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:23"]
  T5["method:ASImageNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:23"]
  S5 -->|calls| T5
  S6["method:ASImageNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:23"]
  T6["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  S6 -->|calls| T6
  S7["method:ASImageNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:23"]
  T7["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S7 -->|calls| T7
  S8["method:ASImageNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:23"]
  T8["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S8 -->|calls| T8
  S9["method:ASImageNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:59"]
  T9["method:ASImageNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:59"]
  S9 -->|calls| T9
  S10["method:ASImageNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:59"]
  T10["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  S10 -->|calls| T10
  S11["method:ASImageNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:59"]
  T11["method:ASImageNode::setDefaultFocusAppearance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:169"]
  S11 -->|calls| T11
  S12["method:ASImageNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:124"]
  T12["method:ASImageNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:124"]
  S12 -->|calls| T12
  S13["method:ASImageNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:124"]
  T13["method:ASImageNode::finishTouches<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:130"]
  S13 -->|calls| T13
  S14["method:ASImageNode::finishTouches<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:130"]
  T14["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  S14 -->|calls| T14
  S15["method:ASImageNode::finishTouches<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:130"]
  T15["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S15 -->|calls| T15
  S16["method:ASImageNode::finishTouches<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:130"]
  T16["method:ASImageNode::setDefaultFocusAppearance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:169"]
  S16 -->|calls| T16
  S17["method:ASImageNode::setFocusedState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:157"]
  T17["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  S17 -->|calls| T17
  S18["method:ASImageNode::setDefaultFocusAppearance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:169"]
  T18["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  S18 -->|calls| T18
  S19["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  T19["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S19 -->|calls| T19
  S20["class:AnyDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:60"]
  T20["method:ASDisplayNode::setLayoutSpecBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:21"]
  S20 -->|calls| T20
  S21["method:AnyDisplayNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:96"]
  T21["method:AnyDisplayNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:96"]
  S21 -->|calls| T21
  S22["method:AnyDisplayNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:101"]
  T22["method:AnyDisplayNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:101"]
  S22 -->|calls| T22
  S23["method:AnyDisplayNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:101"]
  T23["method:AnyDisplayNode::onLayout<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:117"]
  S23 -->|calls| T23
  S24["method:AnyDisplayNode::onDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:106"]
  T24["method:AnyDisplayNode::onDidLoad<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/AnyDisplayNode.swift:106"]
  S24 -->|calls| T24
  S25["class:BackgroundNode<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/Components/Compositions/BackgroundNode.swift:26"]
  T25["method:_ASLayoutElementType::background<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/Modifiers.swift:138"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

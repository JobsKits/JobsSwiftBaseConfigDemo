# `calls 符号关系 - 032`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:BRPickerPanel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:18"]
  T1["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S1 -->|calls| T1
  S2["class:BRPickerPanel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:18"]
  T2["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S2 -->|calls| T2
  S3["class:BRPickerPanel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:18"]
  T3["method:_ASDisplayView::addSubview:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:229"]
  S3 -->|calls| T3
  S4["class:BRPickerPanel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:18"]
  T4["method:_ASDisplayView::addSubview:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:229"]
  S4 -->|calls| T4
  S5["class:BRPickerPanel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:18"]
  T5["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S5 -->|calls| T5
  S6["class:BRPickerPanel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:18"]
  T6["method:BRPickerPanel::applyTheme<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:50"]
  S6 -->|calls| T6
  S7["method:BRPickerPanel::applyTheme<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:50"]
  T7["method:UIView::byClipsToBounds<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:67"]
  S7 -->|calls| T7
  S8["method:BRPickerPanel::applyTheme<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:50"]
  T8["method:BRPickerTheme::byCornerRadius<br/>JobsByPods/BRPickerViewSwift@Pods/Theme/BRPickerTheme.swift:78"]
  S8 -->|calls| T8
  S9["method:BRPickerPanel::applyTheme<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:50"]
  T9["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/PDFKit/PDFThumbnailView.swift:32"]
  S9 -->|calls| T9
  S10["method:BRPickerPanel::applyTheme<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:50"]
  T10["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S10 -->|calls| T10
  S11["method:BRPickerPanel::applyTheme<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:50"]
  T11["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S11 -->|calls| T11
  S12["method:BRPickerPanel::configureToolbar<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:67"]
  T12["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:99"]
  S12 -->|calls| T12
  S13["method:BRPickerPanel::embed<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:81"]
  T13["method:_ASDisplayView::addSubview:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:229"]
  S13 -->|calls| T13
  S14["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:89"]
  T14["method:BRPickerPanel::defaultHostView<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:199"]
  S14 -->|calls| T14
  S15["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:89"]
  T15["field:BRPickerPanel::onDismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:20"]
  S15 -->|calls| T15
  S16["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:89"]
  T16["method:_ASDisplayView::addSubview:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:229"]
  S16 -->|calls| T16
  S17["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:89"]
  T17["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S17 -->|calls| T17
  S18["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:89"]
  T18["method:BRPickerPanel::layoutPanelSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:175"]
  S18 -->|calls| T18
  S19["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:117"]
  T19["field:BRPickerPanel::onDismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:20"]
  S19 -->|calls| T19
  S20["method:BRPickerPanel::didMoveToSuperview<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:144"]
  T20["method:BRPickerPanel::checkDepartureAfterReparenting<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:166"]
  S20 -->|calls| T20
  S21["method:BRPickerPanel::didMoveToWindow<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:156"]
  T21["method:BRPickerPanel::checkDepartureAfterReparenting<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:166"]
  S21 -->|calls| T21
  S22["method:BRPickerPanel::checkDepartureAfterReparenting<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:166"]
  T22["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:117"]
  S22 -->|calls| T22
  S23["method:BRPickerPanel::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:185"]
  T23["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:89"]
  S23 -->|calls| T23
  S24["method:BRPickerPanel::tapMask<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:195"]
  T24["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:117"]
  S24 -->|calls| T24
  S25["class:BRPickerToolbar<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:16"]
  T25["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

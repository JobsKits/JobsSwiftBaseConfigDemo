# `calls 符号关系 - 168`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:makeEKAttributes<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:234"]
  T1["method:EKAttributes::byPosition<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:19"]
  S1 -->|calls| T1
  S2["function:fmt<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:254"]
  T2["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S2 -->|calls| T2
  S3["function:fmt<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:254"]
  T3["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S3 -->|calls| T3
  S4["function:fmt<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:254"]
  T4["method:BRSystemDatePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:25"]
  S4 -->|calls| T4
  S5["method:UIView::makeBelowSeparatorBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:260"]
  T5["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S5 -->|calls| T5
  S6["method:UIView::makeBelowSeparatorBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:260"]
  T6["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S6 -->|calls| T6
  S7["method:UIView::makeBelowSeparatorBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:260"]
  T7["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S7 -->|calls| T7
  S8["method:UIView::makeBelowSeparatorBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:271"]
  T8["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S8 -->|calls| T8
  S9["method:UIView::makeBelowSeparatorBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:271"]
  T9["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S9 -->|calls| T9
  S10["method:UIView::makeBelowSeparatorBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:271"]
  T10["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S10 -->|calls| T10
  S11["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T11["method:UIView::bySuspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:267"]
  S11 -->|calls| T11
  S12["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T12["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S12 -->|calls| T12
  S13["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T13["method:CALayer::byMasksToBounds<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:132"]
  S13 -->|calls| T13
  S14["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T14["method:BRPickerTheme::byCornerRadius<br/>JobsByPods/BRPickerViewSwift@Pods/Theme/BRPickerTheme.swift:77"]
  S14 -->|calls| T14
  S15["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T15["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S15 -->|calls| T15
  S16["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T16["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S16 -->|calls| T16
  S17["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T17["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S17 -->|calls| T17
  S18["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T18["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S18 -->|calls| T18
  S19["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T19["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S19 -->|calls| T19
  S20["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T20["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S20 -->|calls| T20
  S21["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T21["method:UIView.SuspendConfig::byHapticOnDock<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:95"]
  S21 -->|calls| T21
  S22["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T22["method:UIView.SuspendConfig::byDocking<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:79"]
  S22 -->|calls| T22
  S23["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T23["method:YTKBaseRequest::byStart<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBaseRequest+DSL.swift:114"]
  S23 -->|calls| T23
  S24["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  T24["method:UIView.SuspendConfig::byContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:71"]
  S24 -->|calls| T24
  S25["function:networkNormalListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:331"]
  T25["method:YTKBaseRequest::byStart<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBaseRequest+DSL.swift:114"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 020`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRSpringAnimation::animateOut<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:53"]
  T1["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S1 -->|calls| T1
  S2["method:BRFadeAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:63"]
  T2["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S2 -->|calls| T2
  S3["method:BRFadeAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:63"]
  T3["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S3 -->|calls| T3
  S4["method:BRFadeAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:63"]
  T4["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S4 -->|calls| T4
  S5["method:BRFadeAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:63"]
  T5["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S5 -->|calls| T5
  S6["method:BRFadeAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:63"]
  T6["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S6 -->|calls| T6
  S7["method:BRFadeAnimation::animateOut<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:73"]
  T7["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S7 -->|calls| T7
  S8["method:BRFadeAnimation::animateOut<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:73"]
  T8["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S8 -->|calls| T8
  S9["method:BRBasePicker::bind<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:103"]
  T9["method:BRBasePicker::cancelPendingAwait<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:128"]
  S9 -->|calls| T9
  S10["method:BRBasePicker::bind<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:103"]
  T10["method:BRPickerPanel::applyTheme<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:50"]
  S10 -->|calls| T10
  S11["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  T11["method:BRPickerAwaitState::finish<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:229"]
  S11 -->|calls| T11
  S12["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  T12["field:BRBasePicker::resultHandler<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:19"]
  S12 -->|calls| T12
  S13["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:123"]
  T13["method:BRBasePicker::cancelPendingAwait<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:128"]
  S13 -->|calls| T13
  S14["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:123"]
  T14["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:117"]
  S14 -->|calls| T14
  S15["method:BRBasePicker::cancelPendingAwait<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:128"]
  T15["method:BRPickerAwaitState::finish<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:229"]
  S15 -->|calls| T15
  S16["method:BRBasePicker::awaitResult<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:136"]
  T16["method:BRPickerAwaitState::install<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:218"]
  S16 -->|calls| T16
  S17["method:BRBasePicker::awaitResult<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:136"]
  T17["method:BRPickerAwaitState::finish<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:229"]
  S17 -->|calls| T17
  S18["method:BRBasePicker::awaitResult<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:136"]
  T18["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:117"]
  S18 -->|calls| T18
  S19["method:BRBasePicker::awaitResultOrNil<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:161"]
  T19["method:BRBasePicker::awaitResult<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:136"]
  S19 -->|calls| T19
  S20["method:BRBasePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:175"]
  T20["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S20 -->|calls| T20
  S21["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T21["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:117"]
  S21 -->|calls| T21
  S22["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T22["method:BRBasePicker::bind<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:103"]
  S22 -->|calls| T22
  S23["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T23["method:BRBasePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:175"]
  S23 -->|calls| T23
  S24["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T24["method:BRPickerPanel::configureToolbar<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:67"]
  S24 -->|calls| T24
  S25["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T25["method:BRBasePicker::cancelSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:177"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

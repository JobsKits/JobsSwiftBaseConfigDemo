# `calls 符号关系 - 021`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T1["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:123"]
  S1 -->|calls| T1
  S2["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T2["method:BRPickerHaptics::successIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRPickerHaptics.swift:15"]
  S2 -->|calls| T2
  S3["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T3["method:BRBasePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:176"]
  S3 -->|calls| T3
  S4["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T4["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:123"]
  S4 -->|calls| T4
  S5["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T5["method:BRPickerPanel::embed<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:81"]
  S5 -->|calls| T5
  S6["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  T6["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:89"]
  S6 -->|calls| T6
  S7["method:BRPickerAwaitState::install<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:218"]
  T7["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S7 -->|calls| T7
  S8["method:BRPickerAwaitState::finish<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:229"]
  T8["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S8 -->|calls| T8
  S9["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:16"]
  T9["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:10"]
  S9 -->|calls| T9
  S10["class:BRAreaPicker<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:16"]
  T10["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S10 -->|calls| T10
  S11["method:BRAreaPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:45"]
  T11["method:BRAreaPicker::byDataSource<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:29"]
  S11 -->|calls| T11
  S12["method:BRAreaPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:45"]
  T12["method:UIPickerView::byDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIPickerView.swift:15"]
  S12 -->|calls| T12
  S13["method:BRAreaPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:45"]
  T13["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:162"]
  S13 -->|calls| T13
  S14["method:BRAreaPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:45"]
  T14["field:BRAreaPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:24"]
  S14 -->|calls| T14
  S15["method:BRAreaPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:59"]
  T15["field:BRAreaPicker::provinces<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:20"]
  S15 -->|calls| T15
  S16["method:BRAreaPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:59"]
  T16["field:BRAreaPicker::cities<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:21"]
  S16 -->|calls| T16
  S17["method:BRAreaPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:59"]
  T17["field:BRAreaPicker::districts<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:22"]
  S17 -->|calls| T17
  S18["method:BRAreaPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:59"]
  T18["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S18 -->|calls| T18
  S19["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:88"]
  T19["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S19 -->|calls| T19
  S20["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:88"]
  T20["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S20 -->|calls| T20
  S21["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:88"]
  T21["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S21 -->|calls| T21
  S22["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:88"]
  T22["method:UILabel::byTextAlignment<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:31"]
  S22 -->|calls| T22
  S23["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:88"]
  T23["field:BRAreaPicker::provinces<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:20"]
  S23 -->|calls| T23
  S24["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:88"]
  T24["field:BRAreaPicker::cities<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:21"]
  S24 -->|calls| T24
  S25["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:88"]
  T25["field:BRAreaPicker::districts<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:22"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 001`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRBasePicker::bind<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:99"]
  T1["method:BRPickerPanel::applyTheme<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:47"]
  S1 -->|calls| T1
  S2["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:111"]
  T2["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S2 -->|calls| T2
  S3["method:BRBasePicker::awaitResult<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:117"]
  T3["method:BRBasePicker::byResult<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:92"]
  S3 -->|calls| T3
  S4["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  T4["method:BRBasePicker::bind<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:99"]
  S4 -->|calls| T4
  S5["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  T5["method:BRBasePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:128"]
  S5 -->|calls| T5
  S6["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  T6["method:BRPickerPanel::configureToolbar<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:64"]
  S6 -->|calls| T6
  S7["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  T7["method:BRBasePicker::cancelSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:130"]
  S7 -->|calls| T7
  S8["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  T8["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:111"]
  S8 -->|calls| T8
  S9["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  T9["method:BRPickerHaptics::successIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRPickerHaptics.swift:13"]
  S9 -->|calls| T9
  S10["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  T10["method:BRBasePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:129"]
  S10 -->|calls| T10
  S11["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  T11["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:111"]
  S11 -->|calls| T11
  S12["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  T12["method:BRPickerPanel::embed<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:78"]
  S12 -->|calls| T12
  S13["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  T13["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S13 -->|calls| T13
  S14["class:UIColor<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRColorHex.swift:12"]
  T14["enum_member:TextFormatStrategy::uppercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:18"]
  S14 -->|calls| T14
  S15["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  T15["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:12"]
  S15 -->|calls| T15
  S16["method:BRAreaPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:42"]
  T16["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:175"]
  S16 -->|calls| T16
  S17["method:BRAreaPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:59"]
  T17["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:107"]
  S17 -->|calls| T17
  S18["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T18["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S18 -->|calls| T18
  S19["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T19["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S19 -->|calls| T19
  S20["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T20["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S20 -->|calls| T20
  S21["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T21["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:12"]
  S21 -->|calls| T21
  S22["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T22["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:200"]
  S22 -->|calls| T22
  S23["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T23["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:200"]
  S23 -->|calls| T23
  S24["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T24["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S24 -->|calls| T24
  S25["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T25["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:200"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

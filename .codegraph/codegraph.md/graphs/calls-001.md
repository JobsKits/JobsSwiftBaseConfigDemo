# `calls 符号关系 - 001`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:UIColor<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRColorHex.swift:12"]
  T1["enum_member:TextFormatStrategy::uppercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:18"]
  S1 -->|calls| T1
  S2["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  T2["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:12"]
  S2 -->|calls| T2
  S3["method:BRAreaPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:42"]
  T3["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:175"]
  S3 -->|calls| T3
  S4["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T4["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S4 -->|calls| T4
  S5["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T5["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S5 -->|calls| T5
  S6["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T6["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S6 -->|calls| T6
  S7["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T7["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:12"]
  S7 -->|calls| T7
  S8["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T8["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:200"]
  S8 -->|calls| T8
  S9["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T9["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:200"]
  S9 -->|calls| T9
  S10["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T10["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S10 -->|calls| T10
  S11["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T11["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:200"]
  S11 -->|calls| T11
  S12["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T12["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S12 -->|calls| T12
  S13["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T13["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:200"]
  S13 -->|calls| T13
  S14["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T14["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S14 -->|calls| T14
  S15["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T15["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:200"]
  S15 -->|calls| T15
  S16["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T16["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S16 -->|calls| T16
  S17["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:106"]
  T17["method:BRAreaPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:59"]
  S17 -->|calls| T17
  S18["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:175"]
  T18["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S18 -->|calls| T18
  S19["method:BRDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:39"]
  T19["method:BRDatePicker::configureData<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:68"]
  S19 -->|calls| T19
  S20["method:BRDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:39"]
  T20["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:91"]
  S20 -->|calls| T20
  S21["method:BRDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:39"]
  T21["method:BRDatePicker::numberOfComponents<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:137"]
  S21 -->|calls| T21
  S22["method:BRDatePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:55"]
  T22["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:114"]
  S22 -->|calls| T22
  S23["method:BRDatePicker::configureData<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:68"]
  T23["method:BRDatePicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:79"]
  S23 -->|calls| T23
  S24["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:91"]
  T24["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:97"]
  S24 -->|calls| T24
  S25["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:91"]
  T25["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:97"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

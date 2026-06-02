# `calls 符号关系 - 002`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:91"]
  T1["method:BRDatePicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:79"]
  S1 -->|calls| T1
  S2["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:91"]
  T2["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S2 -->|calls| T2
  S3["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:91"]
  T3["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:97"]
  S3 -->|calls| T3
  S4["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:91"]
  T4["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:97"]
  S4 -->|calls| T4
  S5["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:91"]
  T5["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:97"]
  S5 -->|calls| T5
  S6["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:91"]
  T6["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:97"]
  S6 -->|calls| T6
  S7["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:114"]
  T7["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:117"]
  S7 -->|calls| T7
  S8["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:114"]
  T8["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:117"]
  S8 -->|calls| T8
  S9["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:114"]
  T9["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:117"]
  S9 -->|calls| T9
  S10["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:114"]
  T10["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:117"]
  S10 -->|calls| T10
  S11["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:114"]
  T11["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:117"]
  S11 -->|calls| T11
  S12["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:114"]
  T12["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:117"]
  S12 -->|calls| T12
  S13["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:182"]
  T13["method:BRDatePicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:79"]
  S13 -->|calls| T13
  S14["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:182"]
  T14["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:12"]
  S14 -->|calls| T14
  S15["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:182"]
  T15["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S15 -->|calls| T15
  S16["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:182"]
  T16["method:BRDatePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:240"]
  S16 -->|calls| T16
  S17["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:182"]
  T17["method:BRDatePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:240"]
  S17 -->|calls| T17
  S18["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:182"]
  T18["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S18 -->|calls| T18
  S19["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:182"]
  T19["method:BRDatePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:240"]
  S19 -->|calls| T19
  S20["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:182"]
  T20["method:BRDatePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:240"]
  S20 -->|calls| T20
  S21["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:182"]
  T21["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S21 -->|calls| T21
  S22["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:182"]
  T22["method:BRDatePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:55"]
  S22 -->|calls| T22
  S23["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:97"]
  T23["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:12"]
  S23 -->|calls| T23
  S24["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:97"]
  T24["method:BRHourMinutePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:121"]
  S24 -->|calls| T24
  S25["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:97"]
  T25["method:BRHourMinutePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:121"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

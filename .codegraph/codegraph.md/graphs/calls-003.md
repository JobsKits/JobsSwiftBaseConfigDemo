# `calls 符号关系 - 003`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:97"]
  T1["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S1 -->|calls| T1
  S2["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:97"]
  T2["method:BRHourMinutePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:48"]
  S2 -->|calls| T2
  S3["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:30"]
  T3["method:BRMonthDayPicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:66"]
  S3 -->|calls| T3
  S4["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:30"]
  T4["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S4 -->|calls| T4
  S5["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:94"]
  T5["method:BRMonthDayPicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:66"]
  S5 -->|calls| T5
  S6["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:94"]
  T6["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S6 -->|calls| T6
  S7["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:94"]
  T7["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:12"]
  S7 -->|calls| T7
  S8["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:94"]
  T8["method:BRMonthDayPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:142"]
  S8 -->|calls| T8
  S9["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:94"]
  T9["method:BRMonthDayPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:142"]
  S9 -->|calls| T9
  S10["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:94"]
  T10["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S10 -->|calls| T10
  S11["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:94"]
  T11["method:BRMonthDayPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:142"]
  S11 -->|calls| T11
  S12["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:94"]
  T12["method:BRMonthDayPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:142"]
  S12 -->|calls| T12
  S13["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:94"]
  T13["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S13 -->|calls| T13
  S14["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:94"]
  T14["method:BRMonthDayPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:47"]
  S14 -->|calls| T14
  S15["method:BRMultiColumnPicker::bySelectedRows<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:27"]
  T15["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S15 -->|calls| T15
  S16["method:BRMultiColumnPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:37"]
  T16["method:BRMultiColumnPicker::numberOfComponents<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:62"]
  S16 -->|calls| T16
  S17["method:BRMultiColumnPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:50"]
  T17["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S17 -->|calls| T17
  S18["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:76"]
  T18["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:12"]
  S18 -->|calls| T18
  S19["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:76"]
  T19["method:BRMultiColumnPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:101"]
  S19 -->|calls| T19
  S20["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:76"]
  T20["method:BRMultiColumnPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:101"]
  S20 -->|calls| T20
  S21["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:76"]
  T21["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S21 -->|calls| T21
  S22["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:76"]
  T22["method:BRMultiColumnPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:50"]
  S22 -->|calls| T22
  S23["method:BRStringPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:31"]
  T23["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S23 -->|calls| T23
  S24["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:41"]
  T24["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S24 -->|calls| T24
  S25["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:51"]
  T25["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

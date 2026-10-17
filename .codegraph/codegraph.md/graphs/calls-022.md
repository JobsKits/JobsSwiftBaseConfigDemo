# `calls 符号关系 - 022`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T1["field:BRAreaPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:24"]
  S1 -->|calls| T1
  S2["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T2["field:BRAreaPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:24"]
  S2 -->|calls| T2
  S3["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T3["field:BRAreaPicker::provinces<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:20"]
  S3 -->|calls| T3
  S4["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T4["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:16"]
  S4 -->|calls| T4
  S5["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T5["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:16"]
  S5 -->|calls| T5
  S6["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T6["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S6 -->|calls| T6
  S7["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T7["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S7 -->|calls| T7
  S8["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T8["field:BRAreaPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:24"]
  S8 -->|calls| T8
  S9["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T9["field:BRAreaPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:24"]
  S9 -->|calls| T9
  S10["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T10["field:BRAreaPicker::cities<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:21"]
  S10 -->|calls| T10
  S11["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T11["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:16"]
  S11 -->|calls| T11
  S12["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T12["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S12 -->|calls| T12
  S13["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T13["field:BRAreaPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:24"]
  S13 -->|calls| T13
  S14["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T14["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:10"]
  S14 -->|calls| T14
  S15["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T15["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:187"]
  S15 -->|calls| T15
  S16["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T16["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:187"]
  S16 -->|calls| T16
  S17["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T17["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:187"]
  S17 -->|calls| T17
  S18["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T18["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:187"]
  S18 -->|calls| T18
  S19["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T19["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:187"]
  S19 -->|calls| T19
  S20["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T20["method:BRAreaPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:59"]
  S20 -->|calls| T20
  S21["method:BRAreaPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:102"]
  T21["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:123"]
  S21 -->|calls| T21
  S22["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:162"]
  T22["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S22 -->|calls| T22
  S23["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:162"]
  T23["field:BRAreaPicker::provinces<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:20"]
  S23 -->|calls| T23
  S24["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:162"]
  T24["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S24 -->|calls| T24
  S25["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:162"]
  T25["field:BRAreaPicker::cities<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

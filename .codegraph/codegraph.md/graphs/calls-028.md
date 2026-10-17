# `calls 符号关系 - 028`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T1["field:BRMonthDayPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:25"]
  S1 -->|calls| T1
  S2["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T2["field:BRMonthDayPicker::months<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:21"]
  S2 -->|calls| T2
  S3["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T3["method:BRMonthDayPicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:66"]
  S3 -->|calls| T3
  S4["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T4["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:16"]
  S4 -->|calls| T4
  S5["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T5["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S5 -->|calls| T5
  S6["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T6["field:BRMonthDayPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:25"]
  S6 -->|calls| T6
  S7["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T7["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:10"]
  S7 -->|calls| T7
  S8["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T8["method:BRMonthDayPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:138"]
  S8 -->|calls| T8
  S9["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T9["method:BRMonthDayPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:138"]
  S9 -->|calls| T9
  S10["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T10["field:BRMonthDayPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:25"]
  S10 -->|calls| T10
  S11["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T11["field:BRMonthDayPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:25"]
  S11 -->|calls| T11
  S12["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T12["method:BRMonthDayPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:138"]
  S12 -->|calls| T12
  S13["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T13["method:BRMonthDayPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:138"]
  S13 -->|calls| T13
  S14["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T14["method:BRMonthDayPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:49"]
  S14 -->|calls| T14
  S15["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T15["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:123"]
  S15 -->|calls| T15
  S16["method:BRMonthDayPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:138"]
  T16["method:ASIGListSupplementaryViewSourceMethods::viewForSupplementaryElementOfKind:atIndex:sectionController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/AsyncDisplayKit+IGListKitMethods.mm:38"]
  S16 -->|calls| T16
  S17["method:BRMonthDayPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:138"]
  T17["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S17 -->|calls| T17
  S18["class:BRMultiColumnPicker<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:16"]
  T18["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S18 -->|calls| T18
  S19["method:BRMultiColumnPicker::byColumns<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:24"]
  T19["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S19 -->|calls| T19
  S20["method:BRMultiColumnPicker::bySelectedRows<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:30"]
  T20["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S20 -->|calls| T20
  S21["method:BRMultiColumnPicker::bySelectedRows<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:30"]
  T21["field:BRMultiColumnPicker::columns<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:17"]
  S21 -->|calls| T21
  S22["method:BRMultiColumnPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:39"]
  T22["method:BRAreaPicker::byDataSource<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:29"]
  S22 -->|calls| T22
  S23["method:BRMultiColumnPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:39"]
  T23["method:UIPickerView::byDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIPickerView.swift:15"]
  S23 -->|calls| T23
  S24["method:BRMultiColumnPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:39"]
  T24["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S24 -->|calls| T24
  S25["method:BRMultiColumnPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:39"]
  T25["method:BRMultiColumnPicker::numberOfComponents<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:64"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

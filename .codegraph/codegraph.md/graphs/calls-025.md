# `calls 符号关系 - 025`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T1["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S1 -->|calls| T1
  S2["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T2["field:BRDatePicker::years<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:24"]
  S2 -->|calls| T2
  S3["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T3["field:BRDatePicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:29"]
  S3 -->|calls| T3
  S4["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T4["field:BRDatePicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:29"]
  S4 -->|calls| T4
  S5["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T5["field:BRDatePicker::years<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:24"]
  S5 -->|calls| T5
  S6["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T6["field:BRDatePicker::months<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:25"]
  S6 -->|calls| T6
  S7["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T7["method:BRDatePicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:72"]
  S7 -->|calls| T7
  S8["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T8["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:10"]
  S8 -->|calls| T8
  S9["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T9["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:16"]
  S9 -->|calls| T9
  S10["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T10["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S10 -->|calls| T10
  S11["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T11["method:BRDatePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:220"]
  S11 -->|calls| T11
  S12["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T12["method:BRDatePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:220"]
  S12 -->|calls| T12
  S13["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T13["field:BRDatePicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:29"]
  S13 -->|calls| T13
  S14["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T14["field:BRDatePicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:29"]
  S14 -->|calls| T14
  S15["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T15["method:BRDatePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:220"]
  S15 -->|calls| T15
  S16["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T16["method:BRDatePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:220"]
  S16 -->|calls| T16
  S17["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T17["method:BRDatePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:53"]
  S17 -->|calls| T17
  S18["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:170"]
  T18["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:123"]
  S18 -->|calls| T18
  S19["method:BRDatePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:220"]
  T19["method:ASIGListSupplementaryViewSourceMethods::viewForSupplementaryElementOfKind:atIndex:sectionController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/AsyncDisplayKit+IGListKitMethods.mm:38"]
  S19 -->|calls| T19
  S20["method:BRDatePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:220"]
  T20["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S20 -->|calls| T20
  S21["class:BRHourMinutePicker<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:16"]
  T21["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S21 -->|calls| T21
  S22["method:BRHourMinutePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:31"]
  T22["method:BRAreaPicker::byDataSource<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:29"]
  S22 -->|calls| T22
  S23["method:BRHourMinutePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:31"]
  T23["method:UIPickerView::byDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIPickerView.swift:15"]
  S23 -->|calls| T23
  S24["method:BRHourMinutePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:31"]
  T24["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S24 -->|calls| T24
  S25["method:BRHourMinutePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:31"]
  T25["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 023`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:162"]
  T1["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S1 -->|calls| T1
  S2["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:162"]
  T2["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S2 -->|calls| T2
  S3["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:162"]
  T3["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S3 -->|calls| T3
  S4["method:BRAreaPicker::applyPendingSelectionIfNeeded<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:162"]
  T4["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:16"]
  S4 -->|calls| T4
  S5["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:187"]
  T5["method:ASIGListSupplementaryViewSourceMethods::viewForSupplementaryElementOfKind:atIndex:sectionController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/AsyncDisplayKit+IGListKitMethods.mm:38"]
  S5 -->|calls| T5
  S6["method:BRAreaPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:187"]
  T6["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S6 -->|calls| T6
  S7["class:BRDatePicker<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:16"]
  T7["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S7 -->|calls| T7
  S8["method:BRDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:40"]
  T8["method:BRDatePicker::configureData<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:63"]
  S8 -->|calls| T8
  S9["method:BRDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:40"]
  T9["method:JXSegmentedView::byDelegate<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:30"]
  S9 -->|calls| T9
  S10["method:BRDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:40"]
  T10["method:BRAreaPicker::byDataSource<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:29"]
  S10 -->|calls| T10
  S11["method:BRDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:40"]
  T11["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:84"]
  S11 -->|calls| T11
  S12["method:BRDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:40"]
  T12["method:BRDatePicker::numberOfComponents<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:126"]
  S12 -->|calls| T12
  S13["method:BRDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:40"]
  T13["field:BRDatePicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:29"]
  S13 -->|calls| T13
  S14["method:BRDatePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:53"]
  T14["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  S14 -->|calls| T14
  S15["method:BRDatePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:53"]
  T15["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S15 -->|calls| T15
  S16["method:BRDatePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:53"]
  T16["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S16 -->|calls| T16
  S17["method:BRDatePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:53"]
  T17["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S17 -->|calls| T17
  S18["method:BRDatePicker::configureData<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:63"]
  T18["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S18 -->|calls| T18
  S19["method:BRDatePicker::configureData<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:63"]
  T19["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S19 -->|calls| T19
  S20["method:BRDatePicker::configureData<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:63"]
  T20["method:BRDatePicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:72"]
  S20 -->|calls| T20
  S21["method:BRDatePicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:72"]
  T21["method:ASTextRange::rangeWithRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:86"]
  S21 -->|calls| T21
  S22["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:89"]
  T22["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S22 -->|calls| T22
  S23["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:84"]
  T23["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:89"]
  S23 -->|calls| T23
  S24["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:84"]
  T24["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:89"]
  S24 -->|calls| T24
  S25["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:84"]
  T25["method:BRDatePicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

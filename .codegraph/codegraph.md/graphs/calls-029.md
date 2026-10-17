# `calls 符号关系 - 029`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRMultiColumnPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:39"]
  T1["field:BRMultiColumnPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:20"]
  S1 -->|calls| T1
  S2["method:BRMultiColumnPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:52"]
  T2["field:BRMultiColumnPicker::columns<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:17"]
  S2 -->|calls| T2
  S3["method:BRMultiColumnPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:52"]
  T3["field:BRMultiColumnPicker::columns<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:17"]
  S3 -->|calls| T3
  S4["method:BRMultiColumnPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:52"]
  T4["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S4 -->|calls| T4
  S5["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:65"]
  T5["field:BRMultiColumnPicker::columns<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:17"]
  S5 -->|calls| T5
  S6["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:68"]
  T6["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S6 -->|calls| T6
  S7["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:68"]
  T7["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:99"]
  S7 -->|calls| T7
  S8["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:68"]
  T8["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S8 -->|calls| T8
  S9["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:68"]
  T9["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S9 -->|calls| T9
  S10["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:68"]
  T10["method:UILabel::byTextAlignment<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:31"]
  S10 -->|calls| T10
  S11["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:68"]
  T11["field:BRMultiColumnPicker::columns<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:17"]
  S11 -->|calls| T11
  S12["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:79"]
  T12["field:BRMultiColumnPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:20"]
  S12 -->|calls| T12
  S13["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:79"]
  T13["field:BRMultiColumnPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:20"]
  S13 -->|calls| T13
  S14["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:79"]
  T14["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:10"]
  S14 -->|calls| T14
  S15["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:79"]
  T15["method:BRMultiColumnPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:101"]
  S15 -->|calls| T15
  S16["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:79"]
  T16["method:BRMultiColumnPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:101"]
  S16 -->|calls| T16
  S17["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:79"]
  T17["method:BRMultiColumnPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:52"]
  S17 -->|calls| T17
  S18["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:79"]
  T18["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:123"]
  S18 -->|calls| T18
  S19["method:BRMultiColumnPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:101"]
  T19["method:ASIGListSupplementaryViewSourceMethods::viewForSupplementaryElementOfKind:atIndex:sectionController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/AsyncDisplayKit+IGListKitMethods.mm:38"]
  S19 -->|calls| T19
  S20["method:BRMultiColumnPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:101"]
  T20["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S20 -->|calls| T20
  S21["class:BRStringPicker<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:16"]
  T21["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S21 -->|calls| T21
  S22["method:BRStringPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:26"]
  T22["method:BRStringPicker::byDataSource<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:23"]
  S22 -->|calls| T22
  S23["method:BRStringPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:26"]
  T23["method:UIPickerView::byDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIPickerView.swift:15"]
  S23 -->|calls| T23
  S24["method:BRStringPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:26"]
  T24["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S24 -->|calls| T24
  S25["method:BRStringPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:36"]
  T25["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

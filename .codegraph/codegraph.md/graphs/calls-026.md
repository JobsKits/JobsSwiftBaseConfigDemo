# `calls 符号关系 - 026`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRHourMinutePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:31"]
  T1["field:BRHourMinutePicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:24"]
  S1 -->|calls| T1
  S2["method:BRHourMinutePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:31"]
  T2["field:BRHourMinutePicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:24"]
  S2 -->|calls| T2
  S3["method:BRHourMinutePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:49"]
  T3["field:BRHourMinutePicker::hours<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:21"]
  S3 -->|calls| T3
  S4["method:BRHourMinutePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:49"]
  T4["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S4 -->|calls| T4
  S5["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:79"]
  T5["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S5 -->|calls| T5
  S6["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:79"]
  T6["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S6 -->|calls| T6
  S7["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:79"]
  T7["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S7 -->|calls| T7
  S8["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:79"]
  T8["method:UILabel::byTextAlignment<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:31"]
  S8 -->|calls| T8
  S9["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:79"]
  T9["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S9 -->|calls| T9
  S10["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:79"]
  T10["field:BRHourMinutePicker::hours<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:21"]
  S10 -->|calls| T10
  S11["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:79"]
  T11["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S11 -->|calls| T11
  S12["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:94"]
  T12["field:BRHourMinutePicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:24"]
  S12 -->|calls| T12
  S13["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:94"]
  T13["field:BRHourMinutePicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:24"]
  S13 -->|calls| T13
  S14["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:94"]
  T14["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:10"]
  S14 -->|calls| T14
  S15["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:94"]
  T15["method:BRHourMinutePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:115"]
  S15 -->|calls| T15
  S16["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:94"]
  T16["method:BRHourMinutePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:115"]
  S16 -->|calls| T16
  S17["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:94"]
  T17["method:BRHourMinutePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:49"]
  S17 -->|calls| T17
  S18["method:BRHourMinutePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:94"]
  T18["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:123"]
  S18 -->|calls| T18
  S19["method:BRHourMinutePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:115"]
  T19["method:ASIGListSupplementaryViewSourceMethods::viewForSupplementaryElementOfKind:atIndex:sectionController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/AsyncDisplayKit+IGListKitMethods.mm:38"]
  S19 -->|calls| T19
  S20["method:BRHourMinutePicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRHourMinutePicker.swift:115"]
  T20["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S20 -->|calls| T20
  S21["class:BRMonthDayPicker<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:16"]
  T21["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S21 -->|calls| T21
  S22["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T22["method:BRAreaPicker::byDataSource<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRAreaPicker.swift:29"]
  S22 -->|calls| T22
  S23["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T23["method:UIPickerView::byDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIPickerView.swift:15"]
  S23 -->|calls| T23
  S24["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T24["method:BRMonthDayPicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:66"]
  S24 -->|calls| T24
  S25["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T25["enum_member:JobsIconfontGlyph::component<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

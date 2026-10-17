# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRStringPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:36"]
  T1["field:BRStringPicker::data<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:17"]
  S1 -->|calls| T1
  S2["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:46"]
  T2["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S2 -->|calls| T2
  S3["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:46"]
  T3["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:99"]
  S3 -->|calls| T3
  S4["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:46"]
  T4["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S4 -->|calls| T4
  S5["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:46"]
  T5["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S5 -->|calls| T5
  S6["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:46"]
  T6["method:UILabel::byTextAlignment<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:31"]
  S6 -->|calls| T6
  S7["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:46"]
  T7["field:BRStringPicker::data<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:17"]
  S7 -->|calls| T7
  S8["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:57"]
  T8["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:10"]
  S8 -->|calls| T8
  S9["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:57"]
  T9["method:BRStringPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:72"]
  S9 -->|calls| T9
  S10["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:57"]
  T10["method:BRStringPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:72"]
  S10 -->|calls| T10
  S11["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:57"]
  T11["method:BRStringPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:36"]
  S11 -->|calls| T11
  S12["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:57"]
  T12["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:123"]
  S12 -->|calls| T12
  S13["method:BRStringPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:72"]
  T13["method:ASIGListSupplementaryViewSourceMethods::viewForSupplementaryElementOfKind:atIndex:sectionController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/AsyncDisplayKit+IGListKitMethods.mm:38"]
  S13 -->|calls| T13
  S14["method:BRStringPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:72"]
  T14["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S14 -->|calls| T14
  S15["class:BRSystemDatePicker<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:17"]
  T15["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S15 -->|calls| T15
  S16["method:BRSystemDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:32"]
  T16["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S16 -->|calls| T16
  S17["method:BRSystemDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:32"]
  T17["method:UIDatePicker::byMaximumDate<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:79"]
  S17 -->|calls| T17
  S18["method:BRSystemDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:32"]
  T18["method:UIDatePicker::byMinimumDate<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:73"]
  S18 -->|calls| T18
  S19["method:BRSystemDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:32"]
  T19["method:JobsSwiftCalendarDayCell::byDate<br/>JobsByPods/JobsSwiftCalendar@Pods/Core/JobsSwiftCalendarDayCell/JobsSwiftCalendarDayCell.swift:58"]
  S19 -->|calls| T19
  S20["method:BRSystemDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:32"]
  T20["method:BRSystemDatePicker::byMinuteInterval<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:27"]
  S20 -->|calls| T20
  S21["method:BRSystemDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:32"]
  T21["method:BRSystemDatePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:28"]
  S21 -->|calls| T21
  S22["method:BRSystemDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:32"]
  T22["method:UIDatePicker::byWheelsStyleIfAvailable<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:31"]
  S22 -->|calls| T22
  S23["method:BRSystemDatePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:32"]
  T23["method:UIDatePicker::byDatePickerMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:16"]
  S23 -->|calls| T23
  S24["method:BRSystemDatePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:44"]
  T24["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S24 -->|calls| T24
  S25["class:BRSystemDateTimePicker<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:49"]
  T25["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

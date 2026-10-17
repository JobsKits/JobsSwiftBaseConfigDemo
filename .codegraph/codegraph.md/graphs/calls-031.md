# `calls 符号关系 - 031`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRSystemDateTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:64"]
  T1["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S1 -->|calls| T1
  S2["method:BRSystemDateTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:64"]
  T2["method:UIDatePicker::byMaximumDate<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:79"]
  S2 -->|calls| T2
  S3["method:BRSystemDateTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:64"]
  T3["method:UIDatePicker::byMinimumDate<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:73"]
  S3 -->|calls| T3
  S4["method:BRSystemDateTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:64"]
  T4["method:JobsSwiftCalendarDayCell::byDate<br/>JobsByPods/JobsSwiftCalendar@Pods/Core/JobsSwiftCalendarDayCell/JobsSwiftCalendarDayCell.swift:58"]
  S4 -->|calls| T4
  S5["method:BRSystemDateTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:64"]
  T5["method:BRSystemDateTimePicker::byMinuteInterval<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:59"]
  S5 -->|calls| T5
  S6["method:BRSystemDateTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:64"]
  T6["method:BRSystemDateTimePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:60"]
  S6 -->|calls| T6
  S7["method:BRSystemDateTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:64"]
  T7["method:UIDatePicker::byWheelsStyleIfAvailable<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:31"]
  S7 -->|calls| T7
  S8["method:BRSystemDateTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:64"]
  T8["method:UIDatePicker::byDatePickerMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:16"]
  S8 -->|calls| T8
  S9["method:BRSystemDateTimePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:76"]
  T9["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S9 -->|calls| T9
  S10["class:BRSystemTimePicker<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:81"]
  T10["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S10 -->|calls| T10
  S11["method:BRSystemTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:94"]
  T11["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S11 -->|calls| T11
  S12["method:BRSystemTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:94"]
  T12["method:BRSystemTimePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:89"]
  S12 -->|calls| T12
  S13["method:BRSystemTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:94"]
  T13["method:JobsSwiftCalendarDayCell::byDate<br/>JobsByPods/JobsSwiftCalendar@Pods/Core/JobsSwiftCalendarDayCell/JobsSwiftCalendarDayCell.swift:58"]
  S13 -->|calls| T13
  S14["method:BRSystemTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:94"]
  T14["method:BRSystemTimePicker::byMinuteInterval<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:88"]
  S14 -->|calls| T14
  S15["method:BRSystemTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:94"]
  T15["method:UIDatePicker::byWheelsStyleIfAvailable<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:31"]
  S15 -->|calls| T15
  S16["method:BRSystemTimePicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:94"]
  T16["method:UIDatePicker::byDatePickerMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:16"]
  S16 -->|calls| T16
  S17["method:BRSystemTimePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:104"]
  T17["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S17 -->|calls| T17
  S18["class:BRSystemCountDownPicker<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:109"]
  T18["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S18 -->|calls| T18
  S19["method:BRSystemCountDownPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:131"]
  T19["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S19 -->|calls| T19
  S20["method:BRSystemCountDownPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:131"]
  T20["method:BRSystemCountDownPicker::byCountDownDuration<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:114"]
  S20 -->|calls| T20
  S21["method:BRSystemCountDownPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:131"]
  T21["method:BRSystemCountDownPicker::byMinuteInterval<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:127"]
  S21 -->|calls| T21
  S22["method:BRSystemCountDownPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:131"]
  T22["method:UIDatePicker::byWheelsStyleIfAvailable<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:31"]
  S22 -->|calls| T22
  S23["method:BRSystemCountDownPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:131"]
  T23["method:UIDatePicker::byDatePickerMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIDatePicker/UIDatePicker+DSL.swift:16"]
  S23 -->|calls| T23
  S24["method:BRSystemCountDownPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:140"]
  T24["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S24 -->|calls| T24
  S25["class:BRPickerPanel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:18"]
  T25["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

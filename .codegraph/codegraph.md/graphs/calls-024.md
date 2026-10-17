# `calls 符号关系 - 024`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:84"]
  T1["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:16"]
  S1 -->|calls| T1
  S2["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:84"]
  T2["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:89"]
  S2 -->|calls| T2
  S3["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:84"]
  T3["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:89"]
  S3 -->|calls| T3
  S4["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:84"]
  T4["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:89"]
  S4 -->|calls| T4
  S5["method:BRDatePicker::preselect<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:84"]
  T5["function:BRDatePicker::preselect::sel<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:89"]
  S5 -->|calls| T5
  S6["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  T6["field:BRDatePicker::years<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:24"]
  S6 -->|calls| T6
  S7["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  T7["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:108"]
  S7 -->|calls| T7
  S8["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  T8["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:108"]
  S8 -->|calls| T8
  S9["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  T9["field:BRDatePicker::days<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:26"]
  S9 -->|calls| T9
  S10["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  T10["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:108"]
  S10 -->|calls| T10
  S11["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  T11["field:BRDatePicker::years<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:24"]
  S11 -->|calls| T11
  S12["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  T12["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:108"]
  S12 -->|calls| T12
  S13["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  T13["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:108"]
  S13 -->|calls| T13
  S14["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  T14["field:BRDatePicker::years<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:24"]
  S14 -->|calls| T14
  S15["method:BRDatePicker::makeDate<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:105"]
  T15["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:108"]
  S15 -->|calls| T15
  S16["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T16["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S16 -->|calls| T16
  S17["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T17["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S17 -->|calls| T17
  S18["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T18["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S18 -->|calls| T18
  S19["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T19["method:UILabel::byTextAlignment<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:31"]
  S19 -->|calls| T19
  S20["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T20["field:BRDatePicker::years<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:24"]
  S20 -->|calls| T20
  S21["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T21["field:BRDatePicker::months<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:25"]
  S21 -->|calls| T21
  S22["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T22["field:BRDatePicker::days<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:26"]
  S22 -->|calls| T22
  S23["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T23["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S23 -->|calls| T23
  S24["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T24["field:BRDatePicker::years<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:24"]
  S24 -->|calls| T24
  S25["method:BRDatePicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:149"]
  T25["field:BRDatePicker::months<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

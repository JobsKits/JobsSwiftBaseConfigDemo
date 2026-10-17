# `calls 符号关系 - 027`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T1["enum_member:JobsIconfontGlyph::component<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:41"]
  S1 -->|calls| T1
  S2["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T2["enum_member:JobsIconfontGlyph::component<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:41"]
  S2 -->|calls| T2
  S3["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T3["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S3 -->|calls| T3
  S4["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T4["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:16"]
  S4 -->|calls| T4
  S5["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T5["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S5 -->|calls| T5
  S6["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T6["field:BRMonthDayPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:25"]
  S6 -->|calls| T6
  S7["method:BRMonthDayPicker::buildContentView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:33"]
  T7["field:BRMonthDayPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:25"]
  S7 -->|calls| T7
  S8["method:BRMonthDayPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:49"]
  T8["field:BRMonthDayPicker::months<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:21"]
  S8 -->|calls| T8
  S9["method:BRMonthDayPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:49"]
  T9["field:BRMonthDayPicker::days<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:22"]
  S9 -->|calls| T9
  S10["method:BRMonthDayPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:49"]
  T10["enum_member:JobsIconfontGlyph::component<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:41"]
  S10 -->|calls| T10
  S11["method:BRMonthDayPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:49"]
  T11["method:JobsRefreshCache::date<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:433"]
  S11 -->|calls| T11
  S12["method:BRMonthDayPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:49"]
  T12["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S12 -->|calls| T12
  S13["method:BRMonthDayPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:49"]
  T13["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S13 -->|calls| T13
  S14["method:BRMonthDayPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:49"]
  T14["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:116"]
  S14 -->|calls| T14
  S15["method:BRMonthDayPicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:66"]
  T15["enum_member:JobsIconfontGlyph::component<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:41"]
  S15 -->|calls| T15
  S16["method:BRMonthDayPicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:66"]
  T16["method:JobsRefreshCache::date<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:433"]
  S16 -->|calls| T16
  S17["method:BRMonthDayPicker::rebuildDays<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:66"]
  T17["method:ASTextRange::rangeWithRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:86"]
  S17 -->|calls| T17
  S18["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:84"]
  T18["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:99"]
  S18 -->|calls| T18
  S19["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:84"]
  T19["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S19 -->|calls| T19
  S20["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:84"]
  T20["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S20 -->|calls| T20
  S21["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:84"]
  T21["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S21 -->|calls| T21
  S22["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:84"]
  T22["method:UILabel::byTextAlignment<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:31"]
  S22 -->|calls| T22
  S23["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:84"]
  T23["field:BRMonthDayPicker::months<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:21"]
  S23 -->|calls| T23
  S24["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:84"]
  T24["field:BRMonthDayPicker::days<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:22"]
  S24 -->|calls| T24
  S25["method:BRMonthDayPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:95"]
  T25["field:BRMonthDayPicker::lastSelectedRow<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMonthDayPicker.swift:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

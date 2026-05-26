# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRMultiColumnPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRMultiColumnPicker.swift:76"]
  T1["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:111"]
  S1 -->|calls| T1
  S2["method:BRStringPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:31"]
  T2["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:107"]
  S2 -->|calls| T2
  S3["method:BRStringPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:31"]
  T3["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S3 -->|calls| T3
  S4["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:41"]
  T4["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S4 -->|calls| T4
  S5["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:51"]
  T5["function:br_on_main_async<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRDispatch.swift:12"]
  S5 -->|calls| T5
  S6["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:51"]
  T6["method:BRStringPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:66"]
  S6 -->|calls| T6
  S7["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:51"]
  T7["method:BRStringPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:66"]
  S7 -->|calls| T7
  S8["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:51"]
  T8["method:BRStringPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:31"]
  S8 -->|calls| T8
  S9["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:51"]
  T9["method:BRBasePicker::dismissPanel<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:111"]
  S9 -->|calls| T9
  S10["method:BRSystemDatePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:41"]
  T10["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:107"]
  S10 -->|calls| T10
  S11["method:BRSystemDateTimePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:74"]
  T11["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:107"]
  S11 -->|calls| T11
  S12["method:BRSystemTimePicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:103"]
  T12["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:107"]
  S12 -->|calls| T12
  S13["method:BRSystemCountDownPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:143"]
  T13["method:BRBasePicker::send<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:107"]
  S13 -->|calls| T13
  S14["class:BRPickerPanel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:12"]
  T14["method:BRPickerPanel::applyTheme<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:47"]
  S14 -->|calls| T14
  S15["method:BRPickerPanel::embed<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:78"]
  T15["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S15 -->|calls| T15
  S16["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  T16["method:BRPickerPanel::defaultHostView<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:168"]
  S16 -->|calls| T16
  S17["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  T17["method:BRPickerPanel::layoutPanelSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:144"]
  S17 -->|calls| T17
  S18["method:BRPickerPanel::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:154"]
  T18["method:BRPickerPanel::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:154"]
  S18 -->|calls| T18
  S19["method:BRPickerPanel::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:154"]
  T19["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S19 -->|calls| T19
  S20["method:BRPickerPanel::tapMask<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:164"]
  T20["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S20 -->|calls| T20
  S21["method:BRPickerPanel::defaultHostView<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:168"]
  T21["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S21 -->|calls| T21
  S22["method:BRPickerToolbar::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:40"]
  T22["method:BRPickerToolbar::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:40"]
  S22 -->|calls| T22
  S23["method:BRPickerToolbar::tapCancel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:48"]
  T23["method:UIView::onCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+回调@确认和取消.swift:53"]
  S23 -->|calls| T23
  S24["method:BRPickerToolbar::tapConfirm<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:49"]
  T24["method:UIView::onConfirm<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+回调@确认和取消.swift:47"]
  S24 -->|calls| T24
  S25["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  T25["method:JXSegmentedListContainerView::make<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 004`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:51"]
  T1["method:BRStringPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:66"]
  S1 -->|calls| T1
  S2["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:51"]
  T2["method:BRStringPicker::applyRowColor<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:66"]
  S2 -->|calls| T2
  S3["method:BRStringPicker::pickerView<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:51"]
  T3["method:BRStringPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:31"]
  S3 -->|calls| T3
  S4["class:BRPickerPanel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:12"]
  T4["method:BRPickerPanel::applyTheme<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:47"]
  S4 -->|calls| T4
  S5["method:BRPickerPanel::embed<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:78"]
  T5["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S5 -->|calls| T5
  S6["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  T6["method:BRPickerPanel::defaultHostView<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:168"]
  S6 -->|calls| T6
  S7["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  T7["method:BRPickerPanel::layoutPanelSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:144"]
  S7 -->|calls| T7
  S8["method:BRPickerPanel::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:154"]
  T8["method:BRPickerPanel::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:154"]
  S8 -->|calls| T8
  S9["method:BRPickerPanel::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:154"]
  T9["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S9 -->|calls| T9
  S10["method:BRPickerPanel::tapMask<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:164"]
  T10["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S10 -->|calls| T10
  S11["method:BRPickerPanel::defaultHostView<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:168"]
  T11["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S11 -->|calls| T11
  S12["method:BRPickerToolbar::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:40"]
  T12["method:BRPickerToolbar::layoutSubviews<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:40"]
  S12 -->|calls| T12
  S13["method:BRPickerToolbar::tapCancel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:48"]
  T13["method:UIView::onCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+回调@确认和取消.swift:53"]
  S13 -->|calls| T13
  S14["method:BRPickerToolbar::tapConfirm<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:49"]
  T14["method:UIView::onConfirm<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+回调@确认和取消.swift:47"]
  S14 -->|calls| T14
  S15["method:JXSegmentedTitleDataSource::byDynamicConfiguration<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:143"]
  T15["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S15 -->|calls| T15
  S16["method:JXSegmentedListContainerView::byIndexChange<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:102"]
  T16["method:JXSegmentedListContainerView::jx_currentIndexFromContentOffset<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:158"]
  S16 -->|calls| T16
  S17["method:JXSegmentedListContainerView::byIndexChange<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:102"]
  T17["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:166"]
  S17 -->|calls| T17
  S18["method:JXSegmentedListContainerView::byIndexChange<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:102"]
  T18["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:167"]
  S18 -->|calls| T18
  S19["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:167"]
  T19["method:JXSegmentedListContainerView::jx_currentIndexFromContentOffset<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:158"]
  S19 -->|calls| T19
  S20["method:_JXScrollDelegateProxy::responds<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:188"]
  T20["method:_JXScrollDelegateProxy::responds<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:188"]
  S20 -->|calls| T20
  S21["method:_JXScrollDelegateProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:197"]
  T21["method:_JXScrollDelegateProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:197"]
  S21 -->|calls| T21
  S22["method:_JXScrollDelegateProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:197"]
  T22["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:167"]
  S22 -->|calls| T22
  S23["method:_JXScrollDelegateProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:203"]
  T23["method:_JXScrollDelegateProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:203"]
  S23 -->|calls| T23
  S24["method:_JXScrollDelegateProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:203"]
  T24["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:167"]
  S24 -->|calls| T24
  S25["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:211"]
  T25["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:211"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

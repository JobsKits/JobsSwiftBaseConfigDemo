# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIProgressView::byProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIProgressView.swift:31"]
  T1["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:105"]
  S1 -->|calls| T1
  S2["method:UIProgressView::byProgressByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIProgressView.swift:37"]
  T2["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:105"]
  S2 -->|calls| T2
  S3["method:UIResponder::jobsCurrentFirstResponder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:20"]
  T3["method:UIResponder::_jobsTrapFindFirstResponder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:19"]
  S3 -->|calls| T3
  S4["method:UIResponder::jobsNearestVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:30"]
  T4["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:33"]
  S4 -->|calls| T4
  S5["method:UISegmentedControl::insertSegmentByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:34"]
  T5["method:UISegmentedControl::insertSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:40"]
  S5 -->|calls| T5
  S6["method:UISegmentedControl::insertSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:40"]
  T6["method:UISegmentedControl::insertSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:40"]
  S6 -->|calls| T6
  S7["method:UISegmentedControl::removeSegmentByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:46"]
  T7["method:UISegmentedControl::removeSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:52"]
  S7 -->|calls| T7
  S8["method:UISegmentedControl::removeSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:52"]
  T8["method:UISegmentedControl::removeSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:52"]
  S8 -->|calls| T8
  S9["method:UIStackView::addArrangedSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:48"]
  T9["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S9 -->|calls| T9
  S10["method:UIStackView::byRemoveAllArrangedSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:91"]
  T10["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S10 -->|calls| T10
  S11["method:UIStackView::byAddArrangedSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:100"]
  T11["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S11 -->|calls| T11
  S12["method:UIStackView::byResetArrangedSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:106"]
  T12["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S12 -->|calls| T12
  S13["method:UIStackView::byResetArrangedSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:106"]
  T13["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S13 -->|calls| T13
  S14["method:UIStackView::byResetArrangedSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:106"]
  T14["method:NumberFormatter::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NumberFormatter/NumberFormatter.swift:14"]
  S14 -->|calls| T14
  S15["class:UIWindowScene<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIWindowScene.swift:15"]
  T15["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S15 -->|calls| T15
  S16["method:PHPickerViewController::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:20"]
  T16["method:PHPickerViewController::jobs_phpickerBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:52"]
  S16 -->|calls| T16
  S17["method:PHPickerViewController::didFinishPicking<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:28"]
  T17["method:PHPickerViewController::jobs_phpickerBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:52"]
  S17 -->|calls| T17
  S18["method:JobsPHPickerBlocksProxy::picker<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:43"]
  T18["method:PHPickerViewController::didFinishPicking<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:28"]
  S18 -->|calls| T18
  S19["method:String::isEmoji<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:22"]
  T19["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S19 -->|calls| T19
  S20["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:19"]
  T20["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S20 -->|calls| T20
  S21["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:19"]
  T21["method:String::isEmoji<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:22"]
  S21 -->|calls| T21
  S22["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:19"]
  T22["method:String::isEmoji<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:22"]
  S22 -->|calls| T22
  S23["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:19"]
  T23["method:String::isEmoji<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:22"]
  S23 -->|calls| T23
  S24["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:19"]
  T24["method:String::isEmoji<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:22"]
  S24 -->|calls| T24
  S25["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:19"]
  T25["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

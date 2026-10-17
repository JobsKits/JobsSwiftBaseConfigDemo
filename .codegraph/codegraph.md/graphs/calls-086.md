# `calls 符号关系 - 086`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIListContentConfiguration::byImageReservedLayoutSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:311"]
  T1["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S1 -->|calls| T1
  S2["method:UIListContentConfiguration::byImageIgnoresInvertColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:316"]
  T2["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S2 -->|calls| T2
  S3["method:UIListContentConfiguration::byImageStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:321"]
  T3["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S3 -->|calls| T3
  S4["method:UIListContentConfiguration::byImageStrokeColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:327"]
  T4["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S4 -->|calls| T4
  S5["method:UIListContentConfiguration::byImageStrokeWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:333"]
  T5["method:UIListContentConfiguration::jobs_mutating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:43"]
  S5 -->|calls| T5
  S6["method:UIResponder::jobsCurrentFirstResponder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:20"]
  T6["method:UIResponder::_jobsTrapFindFirstResponder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:19"]
  S6 -->|calls| T6
  S7["method:UIResponder::jobsNearestVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:30"]
  T7["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:33"]
  S7 -->|calls| T7
  S8["method:UISegmentedControl::insertSegmentByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:33"]
  T8["method:UISegmentedControl::insertSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:39"]
  S8 -->|calls| T8
  S9["method:UISegmentedControl::insertSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:39"]
  T9["method:UISegmentedControl::insertSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:39"]
  S9 -->|calls| T9
  S10["method:UISegmentedControl::removeSegmentByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:45"]
  T10["method:UISegmentedControl::removeSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:51"]
  S10 -->|calls| T10
  S11["method:UISegmentedControl::removeSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:51"]
  T11["method:UISegmentedControl::removeSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:51"]
  S11 -->|calls| T11
  S12["method:UIStackView::addArrangedSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:47"]
  T12["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S12 -->|calls| T12
  S13["method:UIStackView::byAddArrangedSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:97"]
  T13["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S13 -->|calls| T13
  S14["method:PHPickerViewController::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:20"]
  T14["method:PHPickerViewController::jobs_phpickerBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:52"]
  S14 -->|calls| T14
  S15["method:PHPickerViewController::didFinishPicking<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:28"]
  T15["method:PHPickerViewController::jobs_phpickerBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:52"]
  S15 -->|calls| T15
  S16["method:JobsPHPickerBlocksProxy::picker<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:43"]
  T16["field:JobsPHPickerBlocksProxy::didFinishPicking<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/PHPickerViewController/PHPickerViewController.swift:40"]
  S16 -->|calls| T16
  S17["property:String::removingEmojis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:45"]
  T17["function:AS::filter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASLayoutSpecUtilities.h:49"]
  S17 -->|calls| T17
  S18["property:String::removingEmojis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:45"]
  T18["method:String::isEmoji<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:22"]
  S18 -->|calls| T18
  S19["property:String::keepingEmojisOnly<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:49"]
  T19["function:AS::filter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASLayoutSpecUtilities.h:49"]
  S19 -->|calls| T19
  S20["method:String::emojiStrength<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:91"]
  T20["method:String::isRegionalIndicator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:86"]
  S20 -->|calls| T20
  S21["method:String::emojiStrength<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:91"]
  T21["method:String::isLikelyStrongEmojiScalar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:69"]
  S21 -->|calls| T21
  S22["property:String::keepingStrongEmojisOnly<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:143"]
  T22["function:AS::filter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASLayoutSpecUtilities.h:49"]
  S22 -->|calls| T22
  S23["property:String::removingWeakEmojis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:147"]
  T23["function:AS::filter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASLayoutSpecUtilities.h:49"]
  S23 -->|calls| T23
  S24["method:String::svgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:36"]
  T24["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S24 -->|calls| T24
  S25["method:String::svgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:36"]
  T25["method:NSMapTable::setObject:forPage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:135"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

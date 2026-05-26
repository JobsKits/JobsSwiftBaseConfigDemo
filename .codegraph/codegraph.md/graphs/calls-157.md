# `calls 符号关系 - 157`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1028"]
  T1["method:UILabel::byTextAlignment<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:98"]
  S1 -->|calls| T1
  S2["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1028"]
  T2["method:UILabel::byTextColor<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:92"]
  S2 -->|calls| T2
  S3["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1028"]
  T3["method:UILabel::byFont<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:86"]
  S3 -->|calls| T3
  S4["method:JobsProgressBar::updateProgressLabelText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1051"]
  T4["method:Decimal::round<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:57"]
  S4 -->|calls| T4
  S5["method:JobsProgressBar::updateProgressLabelText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1051"]
  T5["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S5 -->|calls| T5
  S6["method:JobsProgressBar::layoutProgressLabelForHorizontal<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1056"]
  T6["method:UIView::byCenter<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:119"]
  S6 -->|calls| T6
  S7["method:UIView::byVisible<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:76"]
  T7["method:UIView::byHidden<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:64"]
  S7 -->|calls| T7
  S8["method:UIView::byVisible<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:76"]
  T8["method:UIView::byAlpha<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:70"]
  S8 -->|calls| T8
  S9["class:JobsDefaultIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:28"]
  T9["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S9 -->|calls| T9
  S10["class:JobsDefaultIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:28"]
  T10["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:63"]
  S10 -->|calls| T10
  S11["class:JobsDefaultIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:28"]
  T11["method:BRSystemDatePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:25"]
  S11 -->|calls| T11
  S12["class:JobsDefaultIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:28"]
  T12["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S12 -->|calls| T12
  S13["class:JobsDefaultIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:28"]
  T13["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S13 -->|calls| T13
  S14["class:JobsDefaultIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:28"]
  T14["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S14 -->|calls| T14
  S15["class:JobsDefaultIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:28"]
  T15["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S15 -->|calls| T15
  S16["method:JobsDefaultIndicatorView::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:71"]
  T16["method:JobsDefaultIndicatorView::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:71"]
  S16 -->|calls| T16
  S17["method:JobsDefaultIndicatorView::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:71"]
  T17["method:JobsDefaultIndicatorView::computeFixedLabelHeightIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:167"]
  S17 -->|calls| T17
  S18["method:JobsDefaultIndicatorView::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:71"]
  T18["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  S18 -->|calls| T18
  S19["method:JobsDefaultIndicatorView::markRefreshed<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:97"]
  T19["method:JobsDefaultIndicatorView::computeFixedLabelHeightIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:167"]
  S19 -->|calls| T19
  S20["method:JobsDefaultIndicatorView::decorate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:160"]
  T20["method:JobsDefaultIndicatorView::shouldShowLastRefreshTime<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:153"]
  S20 -->|calls| T20
  S21["method:JobsDefaultIndicatorView::decorate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:160"]
  T21["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S21 -->|calls| T21
  S22["method:JobsDefaultIndicatorView::computeFixedLabelHeightIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:167"]
  T22["method:JobsDefaultIndicatorView::shouldShowLastRefreshTime<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:153"]
  S22 -->|calls| T22
  S23["method:JobsDefaultIndicatorView::computeFixedLabelHeightIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:167"]
  T23["method:JobsDefaultIndicatorView::decorate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:160"]
  S23 -->|calls| T23
  S24["method:JobsDefaultIndicatorView::computeFixedLabelHeightIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:167"]
  T24["method:JobsDefaultIndicatorView::goOnText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:116"]
  S24 -->|calls| T24
  S25["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T25["method:JobsDefaultIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:207"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 159`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsLoadingIndicator::rebuildIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:170"]
  T1["method:JobsLoadingIndicator::resolveSetting<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:210"]
  S1 -->|calls| T1
  S2["method:JobsLoadingIndicator::rebuildIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:170"]
  T2["method:JobsLoadingIndicator::loadAnimation<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:229"]
  S2 -->|calls| T2
  S3["method:JobsLoadingIndicator::rebuildIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:170"]
  T3["method:JobsLoadingIndicator::mapLoopMode<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:245"]
  S3 -->|calls| T3
  S4["method:JobsLoadingIndicator::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:254"]
  T4["method:JobsLoadingIndicator::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:254"]
  S4 -->|calls| T4
  S5["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T5["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S5 -->|calls| T5
  S6["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T6["method:JobsArrowIndicatorView::idleArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:450"]
  S6 -->|calls| T6
  S7["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T7["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:483"]
  S7 -->|calls| T7
  S8["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T8["method:UIAlertController::byTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:60"]
  S8 -->|calls| T8
  S9["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T9["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:483"]
  S9 -->|calls| T9
  S10["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T10["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:483"]
  S10 -->|calls| T10
  S11["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T11["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S11 -->|calls| T11
  S12["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T12["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S12 -->|calls| T12
  S13["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T13["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S13 -->|calls| T13
  S14["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T14["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S14 -->|calls| T14
  S15["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T15["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S15 -->|calls| T15
  S16["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T16["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:63"]
  S16 -->|calls| T16
  S17["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T17["method:BRSystemDatePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:25"]
  S17 -->|calls| T17
  S18["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T18["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S18 -->|calls| T18
  S19["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T19["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:63"]
  S19 -->|calls| T19
  S20["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T20["method:BRSystemDatePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:25"]
  S20 -->|calls| T20
  S21["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T21["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S21 -->|calls| T21
  S22["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T22["method:JobsArrowIndicatorView::idleArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:450"]
  S22 -->|calls| T22
  S23["class:JobsArrowIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:267"]
  T23["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S23 -->|calls| T23
  S24["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T24["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S24 -->|calls| T24
  S25["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T25["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

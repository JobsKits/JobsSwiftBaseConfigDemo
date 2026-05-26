# `calls 符号关系 - 162`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T1["method:BRSystemDatePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:25"]
  S1 -->|calls| T1
  S2["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T2["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S2 -->|calls| T2
  S3["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T3["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:63"]
  S3 -->|calls| T3
  S4["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T4["method:BRSystemDatePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:25"]
  S4 -->|calls| T4
  S5["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T5["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S5 -->|calls| T5
  S6["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T6["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S6 -->|calls| T6
  S7["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T7["method:JobsArrowIndicatorView::idleArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:450"]
  S7 -->|calls| T7
  S8["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T8["method:JobsSideIndicatorView::setUpdateInfoVisible<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:703"]
  S8 -->|calls| T8
  S9["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T9["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S9 -->|calls| T9
  S10["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T10["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S10 -->|calls| T10
  S11["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T11["method:JobsArrowIndicatorView::idleArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:450"]
  S11 -->|calls| T11
  S12["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T12["method:JobsSideIndicatorView::setVertical<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:699"]
  S12 -->|calls| T12
  S13["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T13["method:JobsSideIndicatorView::idleText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:722"]
  S13 -->|calls| T13
  S14["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T14["method:JobsSideIndicatorView::setUpdateInfoVisible<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:703"]
  S14 -->|calls| T14
  S15["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T15["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S15 -->|calls| T15
  S16["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T16["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S16 -->|calls| T16
  S17["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T17["method:JobsArrowIndicatorView::readyArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:457"]
  S17 -->|calls| T17
  S18["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T18["method:JobsSideIndicatorView::setVertical<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:699"]
  S18 -->|calls| T18
  S19["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T19["method:JobsSideIndicatorView::readyText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:736"]
  S19 -->|calls| T19
  S20["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T20["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S20 -->|calls| T20
  S21["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T21["method:JobsSideIndicatorView::idleArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:750"]
  S21 -->|calls| T21
  S22["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T22["method:JobsSideIndicatorView::setVertical<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:699"]
  S22 -->|calls| T22
  S23["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T23["method:JobsSideIndicatorView::goOnText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:729"]
  S23 -->|calls| T23
  S24["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T24["method:JobsSideIndicatorView::setUpdateInfoVisible<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:703"]
  S24 -->|calls| T24
  S25["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T25["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

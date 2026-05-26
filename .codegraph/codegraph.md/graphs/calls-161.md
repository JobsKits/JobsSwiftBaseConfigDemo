# `calls 符号关系 - 161`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsArrowIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:435"]
  T1["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S1 -->|calls| T1
  S2["method:JobsArrowIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:435"]
  T2["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S2 -->|calls| T2
  S3["method:JobsArrowIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:435"]
  T3["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S3 -->|calls| T3
  S4["method:JobsArrowIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:435"]
  T4["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S4 -->|calls| T4
  S5["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  T5["method:JobsArrowIndicatorView::readyArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:457"]
  S5 -->|calls| T5
  S6["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T6["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:483"]
  S6 -->|calls| T6
  S7["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T7["method:UIAlertController::byTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:60"]
  S7 -->|calls| T7
  S8["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T8["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:483"]
  S8 -->|calls| T8
  S9["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T9["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:483"]
  S9 -->|calls| T9
  S10["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T10["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S10 -->|calls| T10
  S11["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T11["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S11 -->|calls| T11
  S12["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T12["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S12 -->|calls| T12
  S13["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T13["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S13 -->|calls| T13
  S14["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T14["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:483"]
  S14 -->|calls| T14
  S15["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T15["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S15 -->|calls| T15
  S16["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T16["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S16 -->|calls| T16
  S17["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T17["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S17 -->|calls| T17
  S18["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T18["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S18 -->|calls| T18
  S19["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T19["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:483"]
  S19 -->|calls| T19
  S20["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T20["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S20 -->|calls| T20
  S21["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T21["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S21 -->|calls| T21
  S22["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T22["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S22 -->|calls| T22
  S23["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T23["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S23 -->|calls| T23
  S24["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T24["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S24 -->|calls| T24
  S25["class:JobsSideIndicatorView<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:503"]
  T25["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:63"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

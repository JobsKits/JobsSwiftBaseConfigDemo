# `calls 符号关系 - 009`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:95"]
  T1["method:JobsDialogBoxBuilder::computeDialogFrame<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:149"]
  S1 -->|calls| T1
  S2["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:95"]
  T2["method:JobsDialogBoxBuilder::computeArrowRatio<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:183"]
  S2 -->|calls| T2
  S3["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:95"]
  T3["method:JobsLottieConfig::configure<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshEnums.swift:115"]
  S3 -->|calls| T3
  S4["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:95"]
  T4["method:JobsDialogBoxView::installOutsideTapDismiss<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:325"]
  S4 -->|calls| T4
  S5["method:JobsDialogBoxBuilder::computeArrowRatio<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:183"]
  T5["function:JobsDialogBoxBuilder::computeArrowRatio::clamp<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:189"]
  S5 -->|calls| T5
  S6["method:JobsDialogBoxBuilder::computeArrowRatio<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:183"]
  T6["function:JobsDialogBoxBuilder::computeArrowRatio::clamp<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:189"]
  S6 -->|calls| T6
  S7["method:UIView::byDialogBoxContent<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:212"]
  T7["method:UIView::byDialogBoxContent<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:212"]
  S7 -->|calls| T7
  S8["method:UIView::byDialogBoxContent<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:212"]
  T8["method:UIView::byDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:208"]
  S8 -->|calls| T8
  S9["method:JobsDialogBoxView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:242"]
  T9["method:JobsDialogBoxView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:242"]
  S9 -->|calls| T9
  S10["method:JobsDialogBoxView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:242"]
  T10["method:JobsDialogBoxView::updateShape<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:248"]
  S10 -->|calls| T10
  S11["method:JobsDialogBoxView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:242"]
  T11["method:JobsDialogBoxView::layoutContent<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:254"]
  S11 -->|calls| T11
  S12["method:JobsDialogBoxView::updateShape<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:248"]
  T12["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:278"]
  S12 -->|calls| T12
  S13["method:JobsDialogBoxView::layoutContent<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:254"]
  T13["method:JobsDialogBoxView::bubbleRect<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:260"]
  S13 -->|calls| T13
  S14["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:278"]
  T14["method:JobsDialogBoxView::bubbleRect<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:260"]
  S14 -->|calls| T14
  S15["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:278"]
  T15["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S15 -->|calls| T15
  S16["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:278"]
  T16["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S16 -->|calls| T16
  S17["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:278"]
  T17["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S17 -->|calls| T17
  S18["method:JobsDialogBoxView::makePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:278"]
  T18["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S18 -->|calls| T18
  S19["method:JobsDialogBoxView::installOutsideTapDismiss<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:325"]
  T19["method:JobsDialogBoxView::dismiss<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:340"]
  S19 -->|calls| T19
  S20["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T20["method:Decimal::round<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:57"]
  S20 -->|calls| T20
  S21["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T21["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S21 -->|calls| T21
  S22["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T22["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S22 -->|calls| T22
  S23["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T23["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S23 -->|calls| T23
  S24["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T24["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S24 -->|calls| T24
  S25["class:FTDashboardView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:20"]
  T25["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

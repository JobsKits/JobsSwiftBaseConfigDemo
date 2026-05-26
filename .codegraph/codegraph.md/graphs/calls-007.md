# `calls 符号关系 - 007`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:211"]
  T1["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:167"]
  S1 -->|calls| T1
  S2["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:211"]
  T2["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:196"]
  S2 -->|calls| T2
  S3["method:JXSegmentedView::byDelegateProxy<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:148"]
  T3["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S3 -->|calls| T3
  S4["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T4["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S4 -->|calls| T4
  S5["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T5["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S5 -->|calls| T5
  S6["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T6["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:314"]
  S6 -->|calls| T6
  S7["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T7["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:35"]
  S7 -->|calls| T7
  S8["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T8["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S8 -->|calls| T8
  S9["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T9["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S9 -->|calls| T9
  S10["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T10["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:314"]
  S10 -->|calls| T10
  S11["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T11["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:35"]
  S11 -->|calls| T11
  S12["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T12["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S12 -->|calls| T12
  S13["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T13["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S13 -->|calls| T13
  S14["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T14["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:35"]
  S14 -->|calls| T14
  S15["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T15["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S15 -->|calls| T15
  S16["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T16["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S16 -->|calls| T16
  S17["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T17["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S17 -->|calls| T17
  S18["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T18["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S18 -->|calls| T18
  S19["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T19["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S19 -->|calls| T19
  S20["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T20["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S20 -->|calls| T20
  S21["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T21["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S21 -->|calls| T21
  S22["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T22["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S22 -->|calls| T22
  S23["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T23["method:JobsDialogBoxBuilder::byCornerRadius<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:69"]
  S23 -->|calls| T23
  S24["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T24["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S24 -->|calls| T24
  S25["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T25["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

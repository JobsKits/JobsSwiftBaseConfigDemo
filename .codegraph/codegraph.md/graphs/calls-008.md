# `calls 符号关系 - 008`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T1["method:JobsDialogBoxBuilder::byCornerRadius<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:69"]
  S1 -->|calls| T1
  S2["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T2["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S2 -->|calls| T2
  S3["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T3["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S3 -->|calls| T3
  S4["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T4["method:JobsDialogBoxBuilder::byCornerRadius<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:69"]
  S4 -->|calls| T4
  S5["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T5["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S5 -->|calls| T5
  S6["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T6["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:109"]
  S6 -->|calls| T6
  S7["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:24"]
  T7["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:109"]
  S7 -->|calls| T7
  S8["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:100"]
  T8["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:100"]
  S8 -->|calls| T8
  S9["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:100"]
  T9["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:116"]
  S9 -->|calls| T9
  S10["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:100"]
  T10["method:JobsClockView::layoutHandLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:182"]
  S10 -->|calls| T10
  S11["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:100"]
  T11["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:236"]
  S11 -->|calls| T11
  S12["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:109"]
  T12["method:CALayer::byHidden<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:65"]
  S12 -->|calls| T12
  S13["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:109"]
  T13["method:CALayer::byHidden<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:65"]
  S13 -->|calls| T13
  S14["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:109"]
  T14["method:CALayer::byHidden<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:65"]
  S14 -->|calls| T14
  S15["method:JobsClockView::layoutHandLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:182"]
  T15["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S15 -->|calls| T15
  S16["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:205"]
  T16["method:JobsClockView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:230"]
  S16 -->|calls| T16
  S17["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:205"]
  T17["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:236"]
  S17 -->|calls| T17
  S18["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:205"]
  T18["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S18 -->|calls| T18
  S19["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:205"]
  T19["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:236"]
  S19 -->|calls| T19
  S20["method:JobsClockView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:230"]
  T20["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S20 -->|calls| T20
  S21["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:236"]
  T21["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S21 -->|calls| T21
  S22["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:236"]
  T22["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S22 -->|calls| T22
  S23["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:236"]
  T23["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S23 -->|calls| T23
  S24["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:236"]
  T24["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S24 -->|calls| T24
  S25["method:JobsDialogBoxBuilder::byShowDialogBox<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:95"]
  T25["method:JobsDirection::resolved<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:365"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

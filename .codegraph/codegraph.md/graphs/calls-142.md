# `calls 符号关系 - 142`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsMarqueeView::rebuildContent<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:199"]
  T1["method:JobsMarqueeView::updatePageControlPages<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:813"]
  S1 -->|calls| T1
  S2["method:JobsMarqueeView::rebuildContent<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:199"]
  T2["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  S2 -->|calls| T2
  S3["method:JobsMarqueeView::rebuildContent<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:199"]
  T3["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  S3 -->|calls| T3
  S4["method:JobsMarqueeView::rebuildContent<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:199"]
  T4["method:JobsMarqueeView::computeMinButtonSize<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:535"]
  S4 -->|calls| T4
  S5["method:JobsMarqueeView::rebuildContent<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:199"]
  T5["method:JobsMarqueeView::buildButtons<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:546"]
  S5 -->|calls| T5
  S6["method:JobsMarqueeView::rebuildContent<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:199"]
  T6["method:JobsMarqueeView::updatePageControlPages<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:813"]
  S6 -->|calls| T6
  S7["method:JobsMarqueeView::rebuildContent<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:199"]
  T7["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  S7 -->|calls| T7
  S8["method:JobsMarqueeView::rebuildContent<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:199"]
  T8["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  S8 -->|calls| T8
  S9["method:JobsMarqueeView::applyManualScrollConfig<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:291"]
  T9["method:JXSegmentedIndicatorBaseView::byScrollEnabled<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorBaseView.swift:62"]
  S9 -->|calls| T9
  S10["method:JobsMarqueeView::applyManualScrollConfig<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:291"]
  T10["method:UIScrollView::byPagingEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:55"]
  S10 -->|calls| T10
  S11["method:JobsMarqueeView::snapToNearestPageIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:297"]
  T11["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  S11 -->|calls| T11
  S12["method:JobsMarqueeView::snapToNearestPageIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:297"]
  T12["method:Decimal::round<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:57"]
  S12 -->|calls| T12
  S13["method:JobsMarqueeView::snapToNearestPageIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:297"]
  T13["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  S13 -->|calls| T13
  S14["method:JobsMarqueeView::start<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:335"]
  T14["method:JobsMarqueeView::createTimer<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:383"]
  S14 -->|calls| T14
  S15["method:JobsMarqueeView::start<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:335"]
  T15["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  S15 -->|calls| T15
  S16["method:JobsMarqueeView::pause<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:341"]
  T16["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  S16 -->|calls| T16
  S17["method:JobsMarqueeView::resume<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:345"]
  T17["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S17 -->|calls| T17
  S18["method:JobsMarqueeView::ensureAutoScrollRunning<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:352"]
  T18["method:JobsMarqueeView::createTimer<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:383"]
  S18 -->|calls| T18
  S19["method:JobsMarqueeView::ensureAutoScrollRunning<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:352"]
  T19["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S19 -->|calls| T19
  S20["method:JobsMarqueeView::ensureAutoScrollRunning<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:352"]
  T20["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  S20 -->|calls| T20
  S21["method:JobsMarqueeView::stop<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:363"]
  T21["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S21 -->|calls| T21
  S22["method:JobsMarqueeView::resetTimerIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:368"]
  T22["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S22 -->|calls| T22
  S23["method:JobsMarqueeView::handleScrollModeChanged<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:373"]
  T23["method:JobsMarqueeView::resetTimerIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:368"]
  S23 -->|calls| T23
  S24["method:JobsMarqueeView::createTimer<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:383"]
  T24["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S24 -->|calls| T24
  S25["method:JobsMarqueeView::createTimer<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:383"]
  T25["method:JobsMarqueeView::tickFrequency<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:420"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 141`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T1["method:JobsMarqueeView::applyManualScrollConfig<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:291"]
  S1 -->|calls| T1
  S2["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T2["method:JobsMarqueeView::resetTimerIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:368"]
  S2 -->|calls| T2
  S3["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T3["method:JobsMarqueeView::resetTimerIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:368"]
  S3 -->|calls| T3
  S4["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T4["method:JobsMarqueeView::applyManualScrollConfig<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:291"]
  S4 -->|calls| T4
  S5["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T5["method:JXSegmentedIndicatorBaseView::byScrollEnabled<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorBaseView.swift:62"]
  S5 -->|calls| T5
  S6["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T6["method:JXSegmentedListContainerView::byPagingEnabled<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:46"]
  S6 -->|calls| T6
  S7["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T7["method:JXSegmentedListContainerView::byBounces<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:51"]
  S7 -->|calls| T7
  S8["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T8["method:UIScrollView::byShowsVerticalScrollIndicator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:25"]
  S8 -->|calls| T8
  S9["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T9["method:UIScrollView::byShowsHorizontalScrollIndicator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:31"]
  S9 -->|calls| T9
  S10["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T10["method:JobsMarqueeView::installDefaultPageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:777"]
  S10 -->|calls| T10
  S11["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T11["method:JobsMarqueeView::updatePageControlPages<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:813"]
  S11 -->|calls| T11
  S12["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T12["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  S12 -->|calls| T12
  S13["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T13["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  S13 -->|calls| T13
  S14["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T14["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  S14 -->|calls| T14
  S15["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T15["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S15 -->|calls| T15
  S16["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T16["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S16 -->|calls| T16
  S17["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T17["method:CALayer::byHidden<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:65"]
  S17 -->|calls| T17
  S18["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T18["method:JobsMarqueeView::computeMinButtonSize<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:535"]
  S18 -->|calls| T18
  S19["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T19["method:JobsMarqueeView::commonInit<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:177"]
  S19 -->|calls| T19
  S20["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T20["method:JobsMarqueeView::commonInit<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:177"]
  S20 -->|calls| T20
  S21["method:JobsMarqueeView::commonInit<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:177"]
  T21["method:JobsMarqueeView::applyManualScrollConfig<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:291"]
  S21 -->|calls| T21
  S22["method:JobsMarqueeView::layoutSubviews<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:184"]
  T22["method:JobsMarqueeView::layoutSubviews<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:184"]
  S22 -->|calls| T22
  S23["method:JobsMarqueeView::layoutSubviews<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:184"]
  T23["method:JobsMarqueeView::rebuildContent<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:199"]
  S23 -->|calls| T23
  S24["method:JobsMarqueeView::layoutSubviews<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:184"]
  T24["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  S24 -->|calls| T24
  S25["method:JobsMarqueeView::rebuildContent<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:199"]
  T25["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

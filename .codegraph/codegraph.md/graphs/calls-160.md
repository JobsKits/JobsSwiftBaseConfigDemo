# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T1["method:JobsArrowIndicatorView::idleArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:450"]
  S1 -->|calls| T1
  S2["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T2["method:JobsArrowIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:435"]
  S2 -->|calls| T2
  S3["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T3["method:JobsArrowIndicatorView::idleText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:407"]
  S3 -->|calls| T3
  S4["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T4["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S4 -->|calls| T4
  S5["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T5["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S5 -->|calls| T5
  S6["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T6["method:JobsArrowIndicatorView::readyArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:457"]
  S6 -->|calls| T6
  S7["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T7["method:JobsArrowIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:435"]
  S7 -->|calls| T7
  S8["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T8["method:JobsArrowIndicatorView::readyText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:421"]
  S8 -->|calls| T8
  S9["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T9["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S9 -->|calls| T9
  S10["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T10["method:JobsArrowIndicatorView::idleArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:450"]
  S10 -->|calls| T10
  S11["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T11["method:JobsArrowIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:435"]
  S11 -->|calls| T11
  S12["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T12["method:JobsArrowIndicatorView::goOnText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:414"]
  S12 -->|calls| T12
  S13["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T13["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S13 -->|calls| T13
  S14["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T14["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S14 -->|calls| T14
  S15["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T15["method:JobsArrowIndicatorView::readyArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:457"]
  S15 -->|calls| T15
  S16["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T16["method:JobsArrowIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:435"]
  S16 -->|calls| T16
  S17["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T17["method:JobsArrowIndicatorView::readyText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:421"]
  S17 -->|calls| T17
  S18["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T18["method:JobsLoadingIndicator::showRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:138"]
  S18 -->|calls| T18
  S19["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T19["method:JobsArrowIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:435"]
  S19 -->|calls| T19
  S20["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T20["method:JobsArrowIndicatorView::refreshingText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:428"]
  S20 -->|calls| T20
  S21["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T21["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S21 -->|calls| T21
  S22["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T22["method:JobsArrowIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:435"]
  S22 -->|calls| T22
  S23["method:JobsArrowIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:340"]
  T23["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S23 -->|calls| T23
  S24["method:JobsArrowIndicatorView::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:378"]
  T24["method:JobsArrowIndicatorView::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:378"]
  S24 -->|calls| T24
  S25["method:JobsArrowIndicatorView::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:378"]
  T25["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

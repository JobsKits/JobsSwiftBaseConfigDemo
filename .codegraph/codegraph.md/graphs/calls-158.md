# `calls 符号关系 - 158`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T1["method:JobsDefaultIndicatorView::decorate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:160"]
  S1 -->|calls| T1
  S2["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T2["method:JobsDefaultIndicatorView::idleText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:103"]
  S2 -->|calls| T2
  S3["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T3["method:JobsDefaultIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:207"]
  S3 -->|calls| T3
  S4["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T4["method:JobsDefaultIndicatorView::decorate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:160"]
  S4 -->|calls| T4
  S5["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T5["method:JobsDefaultIndicatorView::readyText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:129"]
  S5 -->|calls| T5
  S6["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T6["method:JobsDefaultIndicatorView::goOnText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:116"]
  S6 -->|calls| T6
  S7["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T7["method:JobsDefaultIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:207"]
  S7 -->|calls| T7
  S8["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T8["method:JobsDefaultIndicatorView::decorate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:160"]
  S8 -->|calls| T8
  S9["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T9["method:JobsDefaultIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:207"]
  S9 -->|calls| T9
  S10["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T10["method:JobsDefaultIndicatorView::decorate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:160"]
  S10 -->|calls| T10
  S11["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T11["method:JobsDefaultIndicatorView::readyText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:129"]
  S11 -->|calls| T11
  S12["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T12["method:JobsDefaultIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:207"]
  S12 -->|calls| T12
  S13["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T13["method:JobsDefaultIndicatorView::decorate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:160"]
  S13 -->|calls| T13
  S14["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T14["method:JobsDefaultIndicatorView::refreshingText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:139"]
  S14 -->|calls| T14
  S15["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T15["method:JobsDefaultIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:207"]
  S15 -->|calls| T15
  S16["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T16["method:JobsDefaultIndicatorView::decorate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:160"]
  S16 -->|calls| T16
  S17["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T17["method:JobsDefaultIndicatorView::noMoreText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:149"]
  S17 -->|calls| T17
  S18["method:JobsDefaultIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:179"]
  T18["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S18 -->|calls| T18
  S19["method:JobsDefaultIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:207"]
  T19["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S19 -->|calls| T19
  S20["method:JobsDefaultIndicatorView::displayText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:207"]
  T20["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S20 -->|calls| T20
  S21["class:JobsLoadingIndicator<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:103"]
  T21["method:JobsLoadingIndicator::rebuildIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:170"]
  S21 -->|calls| T21
  S22["method:JobsLoadingIndicator::showRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:138"]
  T22["method:JobsLoadingIndicator::rebuildIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:170"]
  S22 -->|calls| T22
  S23["method:JobsLoadingIndicator::showRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:138"]
  T23["method:VideoPlayer::playToView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:201"]
  S23 -->|calls| T23
  S24["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  T24["method:JobsClockView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:230"]
  S24 -->|calls| T24
  S25["method:JobsLoadingIndicator::rebuildIfNeeded<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:170"]
  T25["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

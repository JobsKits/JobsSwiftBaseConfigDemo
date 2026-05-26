# `calls 符号关系 - 163`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T1["method:JobsArrowIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:464"]
  S1 -->|calls| T1
  S2["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T2["method:JobsSideIndicatorView::readyArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:758"]
  S2 -->|calls| T2
  S3["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T3["method:JobsSideIndicatorView::setVertical<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:699"]
  S3 -->|calls| T3
  S4["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T4["method:JobsSideIndicatorView::readyText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:736"]
  S4 -->|calls| T4
  S5["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T5["method:JobsSideIndicatorView::setUpdateInfoVisible<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:703"]
  S5 -->|calls| T5
  S6["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T6["method:JobsLoadingIndicator::showRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:138"]
  S6 -->|calls| T6
  S7["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T7["method:JobsSideIndicatorView::setVertical<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:699"]
  S7 -->|calls| T7
  S8["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T8["method:JobsSideIndicatorView::refreshingText<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:743"]
  S8 -->|calls| T8
  S9["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T9["method:JobsSideIndicatorView::setUpdateInfoVisible<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:703"]
  S9 -->|calls| T9
  S10["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T10["method:JobsSideIndicatorView::updateLabelsFromDate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:711"]
  S10 -->|calls| T10
  S11["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T11["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S11 -->|calls| T11
  S12["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T12["method:JobsSideIndicatorView::setVertical<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:699"]
  S12 -->|calls| T12
  S13["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T13["method:JobsSideIndicatorView::setUpdateInfoVisible<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:703"]
  S13 -->|calls| T13
  S14["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T14["method:JobsLoadingIndicator::hideRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:152"]
  S14 -->|calls| T14
  S15["method:JobsSideIndicatorView::apply<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:593"]
  T15["method:JobsSideIndicatorView::setUpdateInfoVisible<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:703"]
  S15 -->|calls| T15
  S16["method:JobsSideIndicatorView::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:639"]
  T16["method:JobsSideIndicatorView::layoutSubviews<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:639"]
  S16 -->|calls| T16
  S17["method:JobsSideIndicatorView::setUpdateInfoVisible<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:703"]
  T17["method:JobsSideIndicatorView::setVertical<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:699"]
  S17 -->|calls| T17
  S18["method:JobsSideIndicatorView::updateLabelsFromDate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:711"]
  T18["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S18 -->|calls| T18
  S19["method:JobsSideIndicatorView::updateLabelsFromDate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:711"]
  T19["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S19 -->|calls| T19
  S20["method:JobsSideIndicatorView::updateLabelsFromDate<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:711"]
  T20["method:JobsSideIndicatorView::setVertical<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:699"]
  S20 -->|calls| T20
  S21["method:JobsSideIndicatorView::applyArrow<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:766"]
  T21["method:JobsSideIndicatorView::readyArrowDirection<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshDefaultSkins.swift:758"]
  S21 -->|calls| T21
  S22["class:JobsProxy<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:18"]
  T22["method:JobsProxy::observe<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:48"]
  S22 -->|calls| T22
  S23["method:JobsProxy::observe<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:48"]
  T23["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S23 -->|calls| T23
  S24["method:JobsProxy::observe<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:48"]
  T24["method:JobsProxy::tick<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:58"]
  S24 -->|calls| T24
  S25["method:JobsProxy::observe<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:48"]
  T25["method:JobsProxy::observe<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:48"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

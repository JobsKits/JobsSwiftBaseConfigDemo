# `calls 符号关系 - 164`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsProxy::observe<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:48"]
  T1["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S1 -->|calls| T1
  S2["method:JobsProxy::observe<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:48"]
  T2["method:JobsProxy::tick<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:58"]
  S2 -->|calls| T2
  S3["class:JobsSlot<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:67"]
  T3["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S3 -->|calls| T3
  S4["method:JobsSlot::attach<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:100"]
  T4["method:JobsSlot::layout<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:113"]
  S4 -->|calls| T4
  S5["method:JobsSlot::handle<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:144"]
  T5["method:JobsSlot::attach<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:100"]
  S5 -->|calls| T5
  S6["method:JobsSlot::handle<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:144"]
  T6["method:JobsSlot::progress<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:168"]
  S6 -->|calls| T6
  S7["method:JobsSlot::handle<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:144"]
  T7["method:JobsSlot::progress<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:168"]
  S7 -->|calls| T7
  S8["method:JobsSlot::handle<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:144"]
  T8["method:JobsSlot::progress<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:168"]
  S8 -->|calls| T8
  S9["method:JobsSlot::handle<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:144"]
  T9["method:JobsSlot::progress<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:168"]
  S9 -->|calls| T9
  S10["method:JobsSlot::progress<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:168"]
  T10["method:JobsSlot::beginRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:185"]
  S10 -->|calls| T10
  S11["method:JobsSlot::beginRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:185"]
  T11["method:UIScrollView::byRefreshFeedback<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:215"]
  S11 -->|calls| T11
  S12["method:JobsSlot::beginRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:185"]
  T12["method:JobsSlot::endRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:228"]
  S12 -->|calls| T12
  S13["method:JobsSlot::endRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:228"]
  T13["method:JobsDefaultIndicatorView::markRefreshed<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshComponent.swift:97"]
  S13 -->|calls| T13
  S14["method:JobsSlot::endRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:228"]
  T14["method:JobsSlot::resetInset<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:257"]
  S14 -->|calls| T14
  S15["method:JobsSlot::endRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:228"]
  T15["method:JobsSlot::layout<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:113"]
  S15 -->|calls| T15
  S16["method:JobsSlot::endRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:228"]
  T16["method:JobsSlot::layout<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:113"]
  S16 -->|calls| T16
  S17["method:UIScrollView::byRefreshHeader<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:104"]
  T17["method:JobsSlot::attach<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:100"]
  S17 -->|calls| T17
  S18["method:UIScrollView::switchRefreshHeader<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:124"]
  T18["method:JobsSlot::beginRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:185"]
  S18 -->|calls| T18
  S19["method:UIScrollView::switchRefreshHeader<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:124"]
  T19["method:JobsSlot::endRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:228"]
  S19 -->|calls| T19
  S20["method:UIScrollView::switchRefreshHeader<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:124"]
  T20["method:JobsSlot::detach<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:107"]
  S20 -->|calls| T20
  S21["method:UIScrollView::byRefreshFooter<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:138"]
  T21["method:JobsSlot::attach<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:100"]
  S21 -->|calls| T21
  S22["method:UIScrollView::switchRefreshFooter<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:158"]
  T22["method:JobsSlot::beginRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:185"]
  S22 -->|calls| T22
  S23["method:UIScrollView::switchRefreshFooter<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:158"]
  T23["method:JobsSlot::endRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:228"]
  S23 -->|calls| T23
  S24["method:UIScrollView::switchRefreshFooter<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:158"]
  T24["method:JobsSlot::detach<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:107"]
  S24 -->|calls| T24
  S25["method:UIScrollView::switchRefreshFooter<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:158"]
  T25["method:JobsSlot::noticeNoMoreData<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:252"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

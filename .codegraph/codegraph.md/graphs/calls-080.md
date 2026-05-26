# `calls 符号关系 - 080`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["enum:JobsEmptyAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:21"]
  T1["method:JobsEmptyAuto::_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:59"]
  S1 -->|calls| T1
  S2["enum:JobsEmptyAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:21"]
  T2["method:UICollectionView::jobs_swizzled_performBatchUpdates<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:30"]
  S2 -->|calls| T2
  S3["enum:_JobsEmptyAutoBootstrap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:69"]
  T3["method:JobsEmptyAuto::enable<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:58"]
  S3 -->|calls| T3
  S4["method:UIScrollView::byEmptyButtonLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:128"]
  T4["method:JobsSlot::layout<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:113"]
  S4 -->|calls| T4
  S5["method:UIScrollView::byClearEmptyButtonLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:145"]
  T5["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:260"]
  S5 -->|calls| T5
  S6["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  T6["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:225"]
  S6 -->|calls| T6
  S7["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  T7["method:UIScrollView::_jobs_isEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:341"]
  S7 -->|calls| T7
  S8["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  T8["method:UIScrollView::_jobs_isEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:341"]
  S8 -->|calls| T8
  S9["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  T9["method:UIView::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:23"]
  S9 -->|calls| T9
  S10["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  T10["method:UIView::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:17"]
  S10 -->|calls| T10
  S11["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  T11["method:UIView::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:23"]
  S11 -->|calls| T11
  S12["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  T12["method:UIView::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:17"]
  S12 -->|calls| T12
  S13["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  T13["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S13 -->|calls| T13
  S14["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  T14["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S14 -->|calls| T14
  S15["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:225"]
  T15["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S15 -->|calls| T15
  S16["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:225"]
  T16["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:117"]
  S16 -->|calls| T16
  S17["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:225"]
  T17["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S17 -->|calls| T17
  S18["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:225"]
  T18["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S18 -->|calls| T18
  S19["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:225"]
  T19["method:JobsSlot::layout<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:113"]
  S19 -->|calls| T19
  S20["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:225"]
  T20["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:260"]
  S20 -->|calls| T20
  S21["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:225"]
  T21["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:260"]
  S21 -->|calls| T21
  S22["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:260"]
  T22["method:UIView::byMakeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:104"]
  S22 -->|calls| T22
  S23["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:260"]
  T23["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S23 -->|calls| T23
  S24["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:260"]
  T24["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S24 -->|calls| T24
  S25["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:260"]
  T25["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

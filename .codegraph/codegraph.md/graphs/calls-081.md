# `calls 符号关系 - 081`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:271"]
  T1["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:117"]
  S1 -->|calls| T1
  S2["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:271"]
  T2["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:292"]
  S2 -->|calls| T2
  S3["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:271"]
  T3["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:117"]
  S3 -->|calls| T3
  S4["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:271"]
  T4["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:292"]
  S4 -->|calls| T4
  S5["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:271"]
  T5["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  S5 -->|calls| T5
  S6["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:292"]
  T6["method:UIView::byBringToFront<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:531"]
  S6 -->|calls| T6
  S7["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:292"]
  T7["method:JobsSlot::layout<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:113"]
  S7 -->|calls| T7
  S8["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:292"]
  T8["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S8 -->|calls| T8
  S9["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:292"]
  T9["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S9 -->|calls| T9
  S10["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:292"]
  T10["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S10 -->|calls| T10
  S11["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:292"]
  T11["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S11 -->|calls| T11
  S12["method:UIScrollView::_jobs_isEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:341"]
  T12["method:RxDataSourcesDemoVC::tableView<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@RxDataSources/VC/Demo@RxDataSources.swift:290"]
  S12 -->|calls| T12
  S13["method:UIScrollView::_jobs_isEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:353"]
  T13["method:RxDataSourcesDemoVC::collectionView<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@RxDataSources/VC/Demo@RxDataSources.swift:295"]
  S13 -->|calls| T13
  S14["method:UIScrollView::byEmptyViewLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:81"]
  T14["method:JobsSlot::layout<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:113"]
  S14 -->|calls| T14
  S15["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:117"]
  T15["method:UIView::byBringToFront<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:531"]
  S15 -->|calls| T15
  S16["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:117"]
  T16["method:PHPickerViewController::byAddTo<br/>JobsByPods/JobsByPhotosUI@Pods/PHPickerViewController.swift:78"]
  S16 -->|calls| T16
  S17["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:117"]
  T17["method:JobsSlot::layout<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:113"]
  S17 -->|calls| T17
  S18["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:117"]
  T18["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S18 -->|calls| T18
  S19["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:117"]
  T19["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S19 -->|calls| T19
  S20["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:117"]
  T20["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S20 -->|calls| T20
  S21["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:117"]
  T21["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S21 -->|calls| T21
  S22["method:UIScrollView::byScrollTargetWeak<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:19"]
  T22["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S22 -->|calls| T22
  S23["method:UIScrollView::byScrollTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:27"]
  T23["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S23 -->|calls| T23
  S24["method:UIScrollView::byScrollTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:27"]
  T24["method:UIScrollView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:171"]
  S24 -->|calls| T24
  S25["method:UIScrollView::willBeginDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:36"]
  T25["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

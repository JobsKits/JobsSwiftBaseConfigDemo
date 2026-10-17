# `calls 符号关系 - 106`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:UICollectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+校验.swift:15"]
  T1["method:UICollectionView::isValid<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+校验.swift:17"]
  S1 -->|calls| T1
  S2["method:UICollectionView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:21"]
  T2["method:UICollectionView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:21"]
  S2 -->|calls| T2
  S3["method:UICollectionView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:21"]
  T3["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S3 -->|calls| T3
  S4["method:UICollectionView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:21"]
  T4["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  S4 -->|calls| T4
  S5["method:UICollectionView::jobs_swizzled_performBatchUpdates<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:31"]
  T5["method:UICollectionView::jobs_swizzled_performBatchUpdates<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:31"]
  S5 -->|calls| T5
  S6["method:UICollectionView::jobs_swizzled_performBatchUpdates<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:31"]
  T6["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S6 -->|calls| T6
  S7["method:UICollectionView::jobs_swizzled_performBatchUpdates<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:31"]
  T7["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  S7 -->|calls| T7
  S8["method:UICollectionView::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:19"]
  T8["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S8 -->|calls| T8
  S9["method:UICollectionView::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:19"]
  T9["method:UIScrollView::byScrollTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:26"]
  S9 -->|calls| T9
  S10["method:UICollectionView::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:19"]
  T10["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:417"]
  S10 -->|calls| T10
  S11["method:UICollectionView::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:30"]
  T11["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S11 -->|calls| T11
  S12["method:UICollectionView::numberOfItemsInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:36"]
  T12["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S12 -->|calls| T12
  S13["method:UICollectionView::cellForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:44"]
  T13["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S13 -->|calls| T13
  S14["method:UICollectionView::viewForSupplementaryElementOfKind<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:52"]
  T14["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S14 -->|calls| T14
  S15["method:UICollectionView::didSelectItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:61"]
  T15["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S15 -->|calls| T15
  S16["method:UICollectionView::didDeselectItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:69"]
  T16["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S16 -->|calls| T16
  S17["method:UICollectionView::willDisplayCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:77"]
  T17["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S17 -->|calls| T17
  S18["method:UICollectionView::didEndDisplayingCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:86"]
  T18["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S18 -->|calls| T18
  S19["method:UICollectionView::didEndDisplayingCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:86"]
  T19["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S19 -->|calls| T19
  S20["method:UICollectionView::didEndDisplayingCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:86"]
  T20["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:417"]
  S20 -->|calls| T20
  S21["method:UICollectionView::sizeForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:95"]
  T21["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S21 -->|calls| T21
  S22["method:UICollectionView::sizeForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:95"]
  T22["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S22 -->|calls| T22
  S23["method:UICollectionView::sizeForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:95"]
  T23["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:417"]
  S23 -->|calls| T23
  S24["method:UICollectionView::insetForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:104"]
  T24["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S24 -->|calls| T24
  S25["method:UICollectionView::insetForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:104"]
  T25["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

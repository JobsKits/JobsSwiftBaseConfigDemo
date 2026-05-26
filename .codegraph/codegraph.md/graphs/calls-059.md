# `calls 符号关系 - 059`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UICollectionView::byRegisterSupplementaryView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:86"]
  T1["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S1 -->|calls| T1
  S2["method:UICollectionView::byRegisterSupplementaryNib<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:100"]
  T2["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S2 -->|calls| T2
  S3["method:UICollectionView::byRegisterHeaderView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:111"]
  T3["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S3 -->|calls| T3
  S4["method:UICollectionView::byRegisterHeaderView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:122"]
  T4["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S4 -->|calls| T4
  S5["method:UICollectionView::byRegisterFooterView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:133"]
  T5["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S5 -->|calls| T5
  S6["method:UICollectionView::byRegisterFooterView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:144"]
  T6["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S6 -->|calls| T6
  S7["class:UICollectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+校验.swift:15"]
  T7["method:UICollectionView::isValid<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+校验.swift:17"]
  S7 -->|calls| T7
  S8["method:UICollectionView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:20"]
  T8["method:UICollectionView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:20"]
  S8 -->|calls| T8
  S9["method:UICollectionView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:20"]
  T9["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S9 -->|calls| T9
  S10["method:UICollectionView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:20"]
  T10["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  S10 -->|calls| T10
  S11["method:UICollectionView::jobs_swizzled_performBatchUpdates<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:30"]
  T11["method:UICollectionView::jobs_swizzled_performBatchUpdates<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:30"]
  S11 -->|calls| T11
  S12["method:UICollectionView::jobs_swizzled_performBatchUpdates<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:30"]
  T12["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S12 -->|calls| T12
  S13["method:UICollectionView::jobs_swizzled_performBatchUpdates<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+空态数据占位按钮.swift:30"]
  T13["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:186"]
  S13 -->|calls| T13
  S14["method:UICollectionView::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:18"]
  T14["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S14 -->|calls| T14
  S15["method:UICollectionView::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:18"]
  T15["method:UIScrollView::byScrollTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:27"]
  S15 -->|calls| T15
  S16["method:UICollectionView::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:18"]
  T16["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:441"]
  S16 -->|calls| T16
  S17["method:UICollectionView::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:29"]
  T17["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S17 -->|calls| T17
  S18["method:UICollectionView::numberOfItemsInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:35"]
  T18["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S18 -->|calls| T18
  S19["method:UICollectionView::cellForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:43"]
  T19["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S19 -->|calls| T19
  S20["method:UICollectionView::viewForSupplementaryElementOfKind<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:51"]
  T20["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S20 -->|calls| T20
  S21["method:UICollectionView::didSelectItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:60"]
  T21["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S21 -->|calls| T21
  S22["method:UICollectionView::didDeselectItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:68"]
  T22["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S22 -->|calls| T22
  S23["method:UICollectionView::willDisplayCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:76"]
  T23["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S23 -->|calls| T23
  S24["method:UICollectionView::didEndDisplayingCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:85"]
  T24["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S24 -->|calls| T24
  S25["method:UICollectionView::didEndDisplayingCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:85"]
  T25["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

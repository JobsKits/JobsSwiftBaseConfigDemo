# `calls 符号关系 - 083`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITableView::byDequeueReusableHeaderFooterView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DequeueReusable.swift:80"]
  T1["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:17"]
  S1 -->|calls| T1
  S2["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:17"]
  T2["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S2 -->|calls| T2
  S3["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:25"]
  T3["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S3 -->|calls| T3
  S4["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:33"]
  T4["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S4 -->|calls| T4
  S5["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:41"]
  T5["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S5 -->|calls| T5
  S6["method:UITableView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:52"]
  T6["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S6 -->|calls| T6
  S7["method:UITableView::byRegisterCellOnID<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:58"]
  T7["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S7 -->|calls| T7
  S8["method:UITableView::reloadDatas<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:20"]
  T8["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S8 -->|calls| T8
  S9["method:UITableView::reloadCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:28"]
  T9["method:UITableView::reloadCells<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:34"]
  S9 -->|calls| T9
  S10["method:UITableView::reloadCells<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:34"]
  T10["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S10 -->|calls| T10
  S11["method:UITableView::reloadSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:50"]
  T11["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S11 -->|calls| T11
  S12["method:UITableView::reloadSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:50"]
  T12["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  S12 -->|calls| T12
  S13["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  T13["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S13 -->|calls| T13
  S14["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  T14["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  S14 -->|calls| T14
  S15["class:UITableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+校验.swift:17"]
  T15["method:UITableView::isValid<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+校验.swift:19"]
  S15 -->|calls| T15
  S16["method:UITableView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+空态数据占位按钮.swift:19"]
  T16["method:UITableView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+空态数据占位按钮.swift:19"]
  S16 -->|calls| T16
  S17["method:UITableView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+空态数据占位按钮.swift:19"]
  T17["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S17 -->|calls| T17
  S18["method:UITableView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+空态数据占位按钮.swift:19"]
  T18["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:271"]
  S18 -->|calls| T18
  S19["method:UITableView::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:31"]
  T19["type_alias:AnyWeakBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:127"]
  S19 -->|calls| T19
  S20["method:UITableView::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:31"]
  T20["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:219"]
  S20 -->|calls| T20
  S21["method:UITableView::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:31"]
  T21["method:UIScrollView::byScrollTargetWeak<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:19"]
  S21 -->|calls| T21
  S22["method:UITableView::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:31"]
  T22["method:UITableView::jobs_installDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:233"]
  S22 -->|calls| T22
  S23["method:UITableView::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:51"]
  T23["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:219"]
  S23 -->|calls| T23
  S24["method:UITableView::numberOfRowsInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:57"]
  T24["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:219"]
  S24 -->|calls| T24
  S25["method:UITableView::cellForRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:65"]
  T25["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:219"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

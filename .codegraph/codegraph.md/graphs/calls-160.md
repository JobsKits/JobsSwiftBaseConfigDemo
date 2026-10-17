# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsDebugEnvironmentsVC<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:15"]
  T1["method:UITableView::byReloadData<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableView/UITableView+DSL.swift:668"]
  S1 -->|calls| T1
  S2["method:JobsDebugEnvironmentsVC::viewDidLoad<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:38"]
  T2["method:BaseVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:28"]
  S2 -->|calls| T2
  S3["method:JobsDebugEnvironmentsVC::viewDidLoad<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:38"]
  T3["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  S3 -->|calls| T3
  S4["method:JobsDebugEnvironmentsVC::viewDidLoad<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:38"]
  T4["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S4 -->|calls| T4
  S5["method:JobsDebugEnvironmentsVC::viewDidLoad<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:38"]
  T5["method:UIViewController::jobsDebugFollowTheme<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:15"]
  S5 -->|calls| T5
  S6["method:JobsDebugEnvironmentsVC::viewDidAppear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:45"]
  T6["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:39"]
  S6 -->|calls| T6
  S7["method:JobsDebugEnvironmentsVC::viewDidAppear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:45"]
  T7["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  S7 -->|calls| T7
  S8["method:JobsDebugEnvironmentsVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:54"]
  T8["method:UITableViewCell::byText<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:230"]
  S8 -->|calls| T8
  S9["method:JobsDebugEnvironmentsVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:54"]
  T9["method:UITableViewCell::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell.swift:19"]
  S9 -->|calls| T9
  S10["method:JobsDebugEnvironmentsVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:54"]
  T10["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S10 -->|calls| T10
  S11["method:JobsDebugEnvironmentsVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:71"]
  T11["method:JobsDebugPanel::select<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:249"]
  S11 -->|calls| T11
  S12["method:JobsDebugEnvironmentsVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:71"]
  T12["field:JobsDebugPanel::environments<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:20"]
  S12 -->|calls| T12
  S13["method:JobsDebugEnvironmentsVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:71"]
  T13["method:UICollectionView::byReloadData<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UICollectionView/UICollectionView+DSL.swift:340"]
  S13 -->|calls| T13
  S14["method:JobsDebugEnvironmentsVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugEnvironmentsVC/JobsDebugEnvironmentsVC.swift:71"]
  T14["method:UITableView::byDeselectRow<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableView/UITableView+DSL.swift:576"]
  S14 -->|calls| T14
  S15["class:JobsDebugMenuVC<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:15"]
  T15["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S15 -->|calls| T15
  S16["class:JobsDebugMenuVC<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:15"]
  T16["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S16 -->|calls| T16
  S17["class:JobsDebugMenuVC<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:15"]
  T17["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S17 -->|calls| T17
  S18["class:JobsDebugMenuVC<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:15"]
  T18["method:UITableView::byRowHeight<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableView/UITableView+DSL.swift:52"]
  S18 -->|calls| T18
  S19["class:JobsDebugMenuVC<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:15"]
  T19["method:JXSegmentedView::byDelegate<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:30"]
  S19 -->|calls| T19
  S20["class:JobsDebugMenuVC<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:15"]
  T20["method:UITableView::byDataSource<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableView/UITableView+DSL.swift:25"]
  S20 -->|calls| T20
  S21["method:JobsDebugMenuVC::viewDidLoad<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:30"]
  T21["method:BaseVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:28"]
  S21 -->|calls| T21
  S22["method:JobsDebugMenuVC::viewDidLoad<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:30"]
  T22["method:UIViewController::jobsSetupGKNav<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:306"]
  S22 -->|calls| T22
  S23["method:JobsDebugMenuVC::viewDidLoad<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:30"]
  T23["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S23 -->|calls| T23
  S24["method:JobsDebugMenuVC::viewDidLoad<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:30"]
  T24["method:UIViewController::jobsDebugFollowTheme<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:15"]
  S24 -->|calls| T24
  S25["method:JobsDebugMenuVC::viewWillAppear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:37"]
  T25["method:BaseVC::viewWillAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:34"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 161`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDebugMenuVC::viewWillAppear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:37"]
  T1["method:UITableView::byReloadData<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableView/UITableView+DSL.swift:668"]
  S1 -->|calls| T1
  S2["method:JobsDebugMenuVC::viewDidAppear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:42"]
  T2["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:39"]
  S2 -->|calls| T2
  S3["method:JobsDebugMenuVC::viewDidAppear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:42"]
  T3["method:JobsDebugPanel::refreshFloatingButtonAccessibility<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:151"]
  S3 -->|calls| T3
  S4["method:JobsDebugMenuVC::viewDidDisappear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:47"]
  T4["method:AsyncViewController::viewDidDisappear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/SynchronousConcurrency/Sample/AsyncViewController.m:30"]
  S4 -->|calls| T4
  S5["method:JobsDebugMenuVC::viewDidDisappear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:47"]
  T5["method:JobsDebugPanel::refreshFloatingButtonAccessibility<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:151"]
  S5 -->|calls| T5
  S6["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:56"]
  T6["method:UITableViewCell::byText<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:230"]
  S6 -->|calls| T6
  S7["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:56"]
  T7["method:UITableViewCell::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell.swift:19"]
  S7 -->|calls| T7
  S8["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:56"]
  T8["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S8 -->|calls| T8
  S9["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:56"]
  T9["field:JobsDebugPanel::actions<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:21"]
  S9 -->|calls| T9
  S10["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:56"]
  T10["method:UITableViewCell::byText<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:230"]
  S10 -->|calls| T10
  S11["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:56"]
  T11["method:UITableViewCell::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell.swift:19"]
  S11 -->|calls| T11
  S12["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:56"]
  T12["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S12 -->|calls| T12
  S13["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:79"]
  T13["method:UITableView::byDeselectRow<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableView/UITableView+DSL.swift:576"]
  S13 -->|calls| T13
  S14["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:79"]
  T14["method:UINavigationController::pushViewControllerByAnimated<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:107"]
  S14 -->|calls| T14
  S15["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:79"]
  T15["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S15 -->|calls| T15
  S16["method:JobsDebugMenuVC::tableView<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugMenuVC/JobsDebugMenuVC.swift:79"]
  T16["field:JobsDebugPanel::actions<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:21"]
  S16 -->|calls| T16
  S17["method:UIViewController::jobsDebugFollowTheme<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:15"]
  T17["method:BRBasePicker::bind<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:103"]
  S17 -->|calls| T17
  S18["method:UIViewController::jobsDebugFollowTheme<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:15"]
  T18["method:UIViewController::byOverrideUserInterfaceStyle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIViewController/UIViewController+DSL.swift:93"]
  S18 -->|calls| T18
  S19["method:JobsDebugNavigationRootVC::viewDidLoad<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:30"]
  T19["method:BaseVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:28"]
  S19 -->|calls| T19
  S20["method:JobsDebugNavigationRootVC::viewDidLoad<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:30"]
  T20["method:UIViewController::jobsDebugFollowTheme<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:15"]
  S20 -->|calls| T20
  S21["method:JobsDebugNavigationRootVC::viewDidAppear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:35"]
  T21["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:39"]
  S21 -->|calls| T21
  S22["method:JobsDebugNavigationRootVC::viewDidAppear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:35"]
  T22["method:UIViewController::byDismiss<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIViewController/UIViewController+DSL.swift:253"]
  S22 -->|calls| T22
  S23["method:JobsDebugNavigationRootVC::viewDidDisappear<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:43"]
  T23["method:AsyncViewController::viewDidDisappear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/SynchronousConcurrency/Sample/AsyncViewController.m:30"]
  S23 -->|calls| T23
  S24["method:JobsDebugOverlayWindow::make<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugOverlayWindow/JobsDebugOverlayWindow.swift:14"]
  T24["method:JobsDebugOverlayWindow::byHostWindow<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugOverlayWindow/JobsDebugOverlayWindow.swift:23"]
  S24 -->|calls| T24
  S25["method:JobsDebugOverlayWindow::make<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugOverlayWindow/JobsDebugOverlayWindow.swift:19"]
  T25["method:JobsDebugOverlayWindow::byHostWindow<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugOverlayWindow/JobsDebugOverlayWindow.swift:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

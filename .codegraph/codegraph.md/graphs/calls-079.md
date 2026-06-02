# `calls 符号关系 - 079`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:DemoDB::clear<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@WCDB/DemoDB.swift:55"]
  T1["method:ManDB::delete<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@FMDB/ManDB.swift:83"]
  S1 -->|calls| T1
  S2["class:PatternStore<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/PatternStore.swift:17"]
  T2["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S2 -->|calls| T2
  S3["method:PatternStore::save<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/PatternStore.swift:24"]
  T3["method:PatternStore::saltValue<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/PatternStore.swift:36"]
  S3 -->|calls| T3
  S4["method:PatternStore::save<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/PatternStore.swift:24"]
  T4["method:GesturePattern::sha256Hex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GesturePattern.swift:24"]
  S4 -->|calls| T4
  S5["method:PatternStore::verify<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/PatternStore.swift:30"]
  T5["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S5 -->|calls| T5
  S6["method:PatternStore::verify<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/PatternStore.swift:30"]
  T6["method:GesturePattern::sha256Hex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GesturePattern.swift:24"]
  S6 -->|calls| T6
  S7["method:PatternStore::verify<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/PatternStore.swift:30"]
  T7["method:PatternStore::saltValue<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/PatternStore.swift:36"]
  S7 -->|calls| T7
  S8["method:PatternStore::saltValue<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/PatternStore.swift:36"]
  T8["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S8 -->|calls| T8
  S9["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  T9["method:MVVMMockUserRepo::users<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:24"]
  S9 -->|calls| T9
  S10["method:MVVMUserListVC::viewDidLoad<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:79"]
  T10["method:MVVMUserListVC::viewDidLoad<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:79"]
  S10 -->|calls| T10
  S11["method:MVVMUserListVC::viewDidLoad<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:79"]
  T11["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S11 -->|calls| T11
  S12["method:MVVMUserListVC::tableView<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:107"]
  T12["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S12 -->|calls| T12
  S13["method:MVVMUserListVC::tableView<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:114"]
  T13["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S13 -->|calls| T13
  S14["method:VIPERUserListInteractor::fetchUsers<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:61"]
  T14["method:MVVMMockUserRepo::users<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:24"]
  S14 -->|calls| T14
  S15["method:VIPERUserListPresenter::onViewDidLoad<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:75"]
  T15["method:VIPERUserListPresenter::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:77"]
  S15 -->|calls| T15
  S16["method:VIPERUserListPresenter::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:77"]
  T16["method:VIPERUserListInteractor::fetchUsers<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:61"]
  S16 -->|calls| T16
  S17["method:VIPERUserListPresenter::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:77"]
  T17["method:VIPERUserListVC::render<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:120"]
  S17 -->|calls| T17
  S18["method:VIPERUserListPresenter::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:77"]
  T18["method:VIPERUserListVC::render<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:120"]
  S18 -->|calls| T18
  S19["method:VIPERUserListPresenter::onSelect<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:93"]
  T19["method:VIPERUserListRouter::toDetail<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:153"]
  S19 -->|calls| T19
  S20["method:VIPERUserListVC::viewDidLoad<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:111"]
  T20["method:VIPERUserListVC::viewDidLoad<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:111"]
  S20 -->|calls| T20
  S21["method:VIPERUserListVC::viewDidLoad<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:111"]
  T21["method:VIPERUserListPresenter::onViewDidLoad<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:75"]
  S21 -->|calls| T21
  S22["method:VIPERUserListVC::render<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:120"]
  T22["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S22 -->|calls| T22
  S23["method:VIPERUserListVC::tableView<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:145"]
  T23["method:VIPERUserListPresenter::onSelect<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式VIPER.swift:93"]
  S23 -->|calls| T23
  S24["method:WalletLayout::animateToggle<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@钱包卡片效果/Other/WalletLayout.swift:32"]
  T24["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S24 -->|calls| T24
  S25["method:WalletLayout::prepare<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@钱包卡片效果/Other/WalletLayout.swift:55"]
  T25["method:WalletLayout::prepare<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@钱包卡片效果/Other/WalletLayout.swift:55"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

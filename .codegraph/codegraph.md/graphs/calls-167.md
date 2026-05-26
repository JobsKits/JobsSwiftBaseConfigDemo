# `calls 符号关系 - 167`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:LaunchChecker::logLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:166"]
  T1["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S1 -->|calls| T1
  S2["method:LaunchChecker::logLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:166"]
  T2["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S2 -->|calls| T2
  S3["method:LaunchChecker::logLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:166"]
  T3["function:LaunchChecker::logLaunch::desc<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:174"]
  S3 -->|calls| T3
  S4["method:LaunchChecker::logLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:166"]
  T4["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S4 -->|calls| T4
  S5["method:LaunchChecker::logLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:166"]
  T5["function:LaunchChecker::logLaunch::desc<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:174"]
  S5 -->|calls| T5
  S6["function:nowClock<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:193"]
  T6["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S6 -->|calls| T6
  S7["function:nowClock<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:193"]
  T7["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S7 -->|calls| T7
  S8["function:nowClock<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:193"]
  T8["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:63"]
  S8 -->|calls| T8
  S9["function:nowClock<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:193"]
  T9["method:BRSystemDatePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:25"]
  S9 -->|calls| T9
  S10["function:fmt<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:201"]
  T10["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S10 -->|calls| T10
  S11["function:fmt<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:201"]
  T11["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S11 -->|calls| T11
  S12["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:215"]
  T12["method:UICollectionView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:31"]
  S12 -->|calls| T12
  S13["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:215"]
  T13["method:UICollectionView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:31"]
  S13 -->|calls| T13
  S14["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:215"]
  T14["method:UICollectionView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:31"]
  S14 -->|calls| T14
  S15["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:215"]
  T15["method:UICollectionView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:31"]
  S15 -->|calls| T15
  S16["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:215"]
  T16["method:UICollectionView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:31"]
  S16 -->|calls| T16
  S17["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:227"]
  T17["method:UICollectionView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:31"]
  S17 -->|calls| T17
  S18["function:makeEKAttributes<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:234"]
  T18["method:EKAttributes::byExit<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:48"]
  S18 -->|calls| T18
  S19["function:makeEKAttributes<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:234"]
  T19["method:EKAttributes::byEntrance<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:46"]
  S19 -->|calls| T19
  S20["function:makeEKAttributes<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:234"]
  T20["method:EKAttributes::byStatusBar<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:102"]
  S20 -->|calls| T20
  S21["function:makeEKAttributes<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:234"]
  T21["method:EKAttributes::byDisplayMode<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:100"]
  S21 -->|calls| T21
  S22["function:makeEKAttributes<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:234"]
  T22["method:EKAttributes::byScreenInteraction<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:75"]
  S22 -->|calls| T22
  S23["function:makeEKAttributes<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:234"]
  T23["method:EKAttributes::byShadow<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:35"]
  S23 -->|calls| T23
  S24["function:makeEKAttributes<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:234"]
  T24["method:EKAttributes::byCorner<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:25"]
  S24 -->|calls| T24
  S25["function:makeEKAttributes<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:234"]
  T25["method:EKAttributes::byDuration<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:22"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 080`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsSwiftBaseConfigDemoUITestsLaunchTests::testLaunch<br/>JobsSwiftBaseConfigDemoUITests/JobsSwiftBaseConfigDemoUITestsLaunchTests.swift:20"]
  T1["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S1 -->|calls| T1
  S2["file:TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacros/EquatableBy.swift<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacros/EquatableBy.swift:1"]
  T2["method:STTask::hash<br/>TODO/TaskCenterComponent/Schedule/Task.swift:286"]
  S2 -->|calls| T2
  S3["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:16"]
  T3["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S3 -->|calls| T3
  S4["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:16"]
  T4["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S4 -->|calls| T4
  S5["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:16"]
  T5["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S5 -->|calls| T5
  S6["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:44"]
  T6["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S6 -->|calls| T6
  S7["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:44"]
  T7["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S7 -->|calls| T7
  S8["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:44"]
  T8["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S8 -->|calls| T8
  S9["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:44"]
  T9["function:parseSingleStringArgument<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:87"]
  S9 -->|calls| T9
  S10["method:Atomic::read<br/>TODO/TaskCenterComponent/Schedule/Atomic.swift:24"]
  T10["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S10 -->|calls| T10
  S11["method:Atomic::readVoid<br/>TODO/TaskCenterComponent/Schedule/Atomic.swift:30"]
  T11["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S11 -->|calls| T11
  S12["method:Atomic::write<br/>TODO/TaskCenterComponent/Schedule/Atomic.swift:36"]
  T12["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S12 -->|calls| T12
  S13["method:Atomic::writeVoid<br/>TODO/TaskCenterComponent/Schedule/Atomic.swift:42"]
  T13["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S13 -->|calls| T13
  S14["method:Bag::append<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:59"]
  T14["method:BagKeyGenerator::next<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:33"]
  S14 -->|calls| T14
  S15["method:Bag::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:97"]
  T15["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S15 -->|calls| T15
  S16["method:Int::clampedAdding<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:25"]
  T16["method:Double::clampedToInt<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:14"]
  S16 -->|calls| T16
  S17["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  T17["function:unlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:120"]
  S17 -->|calls| T17
  S18["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  T18["function:unlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:120"]
  S18 -->|calls| T18
  S19["class:Interval<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:47"]
  T19["method:Double::clampedToInt<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:14"]
  S19 -->|calls| T19
  S20["method:Interval::<<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:87"]
  T20["method:Interval::compare<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:75"]
  S20 -->|calls| T20
  S21["method:Interval::*<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:129"]
  T21["method:Interval::multiplying<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:111"]
  S21 -->|calls| T21
  S22["method:Interval::asMinutes<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:183"]
  T22["method:Interval::asSeconds<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:178"]
  S22 -->|calls| T22
  S23["method:Interval::asHours<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:188"]
  T23["method:Interval::asMinutes<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:183"]
  S23 -->|calls| T23
  S24["method:Interval::asDays<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:193"]
  T24["method:Interval::asHours<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:188"]
  S24 -->|calls| T24
  S25["method:Interval::asWeeks<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:198"]
  T25["method:Interval::asDays<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:193"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

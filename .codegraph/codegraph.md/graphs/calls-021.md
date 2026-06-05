# `calls 符号关系 - 021`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T1["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S1 -->|calls| T1
  S2["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  T2["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S2 -->|calls| T2
  S3["method:CurlLoggerPlugin::willSend<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/Plugins.swift:20"]
  T3["method:URLRequest::cURLDescription<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/Plugins.swift:31"]
  S3 -->|calls| T3
  S4["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T4["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S4 -->|calls| T4
  S5["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T5["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S5 -->|calls| T5
  S6["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T6["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S6 -->|calls| T6
  S7["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T7["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S7 -->|calls| T7
  S8["method:WalletLayout::animateToggle<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@钱包卡片效果/Other/WalletLayout.swift:32"]
  T8["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S8 -->|calls| T8
  S9["method:WalletLayout::prepare<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@钱包卡片效果/Other/WalletLayout.swift:55"]
  T9["method:WalletLayout::prepare<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@钱包卡片效果/Other/WalletLayout.swift:55"]
  S9 -->|calls| T9
  S10["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:16"]
  T10["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S10 -->|calls| T10
  S11["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:16"]
  T11["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S11 -->|calls| T11
  S12["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:16"]
  T12["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S12 -->|calls| T12
  S13["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:44"]
  T13["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S13 -->|calls| T13
  S14["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:44"]
  T14["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S14 -->|calls| T14
  S15["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:44"]
  T15["method:DeclGroupSyntax::isDecl<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:100"]
  S15 -->|calls| T15
  S16["method:EquatableByMacro::expansion<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:44"]
  T16["function:parseSingleStringArgument<br/>TODO/JobsBySwiftPackageManager/MyMacros/Sources/MyMacrosMacros/EquatableByMacro.swift:87"]
  S16 -->|calls| T16
  S17["method:Int::clampedAdding<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:25"]
  T17["method:Double::clampedToInt<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:14"]
  S17 -->|calls| T17
  S18["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  T18["function:unlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:120"]
  S18 -->|calls| T18
  S19["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  T19["function:unlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:120"]
  S19 -->|calls| T19
  S20["method:RunLoopTask::InternalRunLoopTask::threadAction<br/>TODO/TaskCenterComponent/Schedule/RunLoopTask.swift:85"]
  T20["method:TaskCenter::add<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:52"]
  S20 -->|calls| T20
  S21["method:RunLoopTask::InternalRunLoopTask::notifyExeAction<br/>TODO/TaskCenterComponent/Schedule/RunLoopTask.swift:90"]
  T21["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  S21 -->|calls| T21
  S22["class:RunLoopTask<br/>TODO/TaskCenterComponent/Schedule/RunLoopTask.swift:56"]
  T22["method:RunLoopTask::InternalRunLoopTask::notifyExeAction<br/>TODO/TaskCenterComponent/Schedule/RunLoopTask.swift:90"]
  S22 -->|calls| T22
  S23["method:TaskCenter::add<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:52"]
  T23["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S23 -->|calls| T23
  S24["method:TaskCenter::add<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:52"]
  T24["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S24 -->|calls| T24
  S25["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  T25["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

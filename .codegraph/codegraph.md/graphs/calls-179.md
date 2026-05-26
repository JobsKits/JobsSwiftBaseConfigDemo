# `calls 符号关系 - 179`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UserDefaults::setCodable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:100"]
  T1["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S1 -->|calls| T1
  S2["method:UserDefaults::codable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:106"]
  T2["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S2 -->|calls| T2
  S3["method:UserDefaults::codable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:106"]
  T3["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S3 -->|calls| T3
  S4["method:UserDefaults::setArray<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:111"]
  T4["method:UserDefaults::setCodable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:100"]
  S4 -->|calls| T4
  S5["method:UserDefaults::array<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:114"]
  T5["method:UserDefaults::codable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:106"]
  S5 -->|calls| T5
  S6["method:UserDefaults::setDictionary<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:118"]
  T6["method:UserDefaults::setCodable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:100"]
  S6 -->|calls| T6
  S7["method:UserDefaults::dictionary<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:121"]
  T7["method:UserDefaults::codable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:106"]
  S7 -->|calls| T7
  S8["method:UserDefaults::load<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:128"]
  T8["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S8 -->|calls| T8
  S9["method:UserDefaults::load<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:128"]
  T9["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S9 -->|calls| T9
  S10["method:UserDefaults::save<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:138"]
  T10["method:JSONValue::encode<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:992"]
  S10 -->|calls| T10
  S11["method:UserDefaults::save<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:138"]
  T11["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S11 -->|calls| T11
  S12["method:UserDefaults::exists<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:148"]
  T12["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S12 -->|calls| T12
  S13["method:Array::addBy<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:26"]
  T13["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  S13 -->|calls| T13
  S14["method:Array::Builder::addBy<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:44"]
  T14["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  S14 -->|calls| T14
  S15["method:Sequence::minMax<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Sequence.swift:19"]
  T15["method:JobsPlan::makeIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:140"]
  S15 -->|calls| T15
  S16["method:Sequence::minMax<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Sequence.swift:19"]
  T16["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S16 -->|calls| T16
  S17["method:Sequence::minMax<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Sequence.swift:19"]
  T17["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S17 -->|calls| T17
  S18["method:Double::toAmount<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/浮点类型/Double.swift:18"]
  T18["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S18 -->|calls| T18
  S19["struct:JobsMergedTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsMergedTaskExecutionSequence.swift:28"]
  T19["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S19 -->|calls| T19
  S20["struct:JobsMergedTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsMergedTaskExecutionSequence.swift:28"]
  T20["method:JobsWorkerScheduler::cancel<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:51"]
  S20 -->|calls| T20
  S21["struct:JobsMergedTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsMergedTaskExecutionSequence.swift:28"]
  T21["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S21 -->|calls| T21
  S22["struct:JobsMergedTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsMergedTaskExecutionSequence.swift:28"]
  T22["method:JobsTaskManagerExecutionStream::makeAsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerExecutionStream.swift:26"]
  S22 -->|calls| T22
  S23["method:JobsMergedTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsMergedTaskExecutionSequence.swift:60"]
  T23["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S23 -->|calls| T23
  S24["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T24["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S24 -->|calls| T24
  S25["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T25["enum_member:PromiseKitDemoVC::Section::actions<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PromiseKit/PromiseKitDemoVC.swift:56"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

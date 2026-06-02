# `calls 符号关系 - 050`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UserDefaults::save<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:138"]
  T1["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S1 -->|calls| T1
  S2["method:UserDefaults::exists<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:148"]
  T2["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S2 -->|calls| T2
  S3["method:Array::addBy<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:26"]
  T3["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  S3 -->|calls| T3
  S4["method:Array::Builder::addBy<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:44"]
  T4["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  S4 -->|calls| T4
  S5["method:Sequence::minMax<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Sequence.swift:19"]
  T5["method:JobsPlan::makeIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:140"]
  S5 -->|calls| T5
  S6["method:Sequence::minMax<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Sequence.swift:19"]
  T6["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S6 -->|calls| T6
  S7["method:Sequence::minMax<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Sequence.swift:19"]
  T7["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S7 -->|calls| T7
  S8["method:Double::toAmount<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/浮点类型/Double.swift:18"]
  T8["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S8 -->|calls| T8
  S9["struct:JobsMergedTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsMergedTaskExecutionSequence.swift:28"]
  T9["method:JobsWorkerScheduler::cancel<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:51"]
  S9 -->|calls| T9
  S10["struct:JobsMergedTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsMergedTaskExecutionSequence.swift:28"]
  T10["method:JobsTaskManagerExecutionStream::makeAsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerExecutionStream.swift:26"]
  S10 -->|calls| T10
  S11["method:JobsMergedTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsMergedTaskExecutionSequence.swift:60"]
  T11["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S11 -->|calls| T11
  S12["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T12["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S12 -->|calls| T12
  S13["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T13["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  S13 -->|calls| T13
  S14["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T14["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  S14 -->|calls| T14
  S15["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  T15["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S15 -->|calls| T15
  S16["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  T16["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S16 -->|calls| T16
  S17["method:JobsTask::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:166"]
  T17["method:JobsTask::updateState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:353"]
  S17 -->|calls| T17
  S18["method:JobsTask::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:166"]
  T18["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  S18 -->|calls| T18
  S19["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  T19["method:JobsTask::updateState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:353"]
  S19 -->|calls| T19
  S20["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  T20["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S20 -->|calls| T20
  S21["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  T21["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  S21 -->|calls| T21
  S22["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  T22["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S22 -->|calls| T22
  S23["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  T23["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S23 -->|calls| T23
  S24["method:JobsTask::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:232"]
  T24["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S24 -->|calls| T24
  S25["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T25["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

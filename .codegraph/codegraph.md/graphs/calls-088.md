# `calls 符号关系 - 088`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TaskCenterComponent::createTimerTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:38"]
  T1["method:TaskCenterComponent::createTimerTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:38"]
  S1 -->|calls| T1
  S2["method:TaskCenterComponent::createTimerTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:42"]
  T2["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  S2 -->|calls| T2
  S3["method:TaskManager::ApplicationStateListener::backgroundState<br/>TODO/TaskCenterComponent/TaskItem.swift:33"]
  T3["method:TaskManager::applicationStatusDidChanged<br/>TODO/TaskCenterComponent/TaskItem.swift:204"]
  S3 -->|calls| T3
  S4["method:TaskManager::ApplicationStateListener::activeState<br/>TODO/TaskCenterComponent/TaskItem.swift:37"]
  T4["method:TaskManager::applicationStatusDidChanged<br/>TODO/TaskCenterComponent/TaskItem.swift:204"]
  S4 -->|calls| T4
  S5["class:TaskManager::ApplicationStateListener<br/>TODO/TaskCenterComponent/TaskItem.swift:23"]
  T5["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S5 -->|calls| T5
  S6["method:TaskManager::task<br/>TODO/TaskCenterComponent/TaskItem.swift:61"]
  T6["method:Plan::first<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:259"]
  S6 -->|calls| T6
  S7["method:TaskManager::addTask<br/>TODO/TaskCenterComponent/TaskItem.swift:72"]
  T7["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S7 -->|calls| T7
  S8["method:TaskManager::addTask<br/>TODO/TaskCenterComponent/TaskItem.swift:72"]
  T8["method:TaskCenter::add<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:52"]
  S8 -->|calls| T8
  S9["method:TaskManager::addTask<br/>TODO/TaskCenterComponent/TaskItem.swift:72"]
  T9["method:TaskCenter::addTag<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:82"]
  S9 -->|calls| T9
  S10["method:TaskManager::addTask<br/>TODO/TaskCenterComponent/TaskItem.swift:72"]
  T10["method:TaskManager::suspend<br/>TODO/TaskCenterComponent/TaskItem.swift:154"]
  S10 -->|calls| T10
  S11["method:TaskManager::addTask<br/>TODO/TaskCenterComponent/TaskItem.swift:72"]
  T11["method:Bag::append<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:59"]
  S11 -->|calls| T11
  S12["method:TaskManager::removeTask<br/>TODO/TaskCenterComponent/TaskItem.swift:88"]
  T12["method:TaskManager::removeTask<br/>TODO/TaskCenterComponent/TaskItem.swift:88"]
  S12 -->|calls| T12
  S13["method:TaskManager::removeTask<br/>TODO/TaskCenterComponent/TaskItem.swift:93"]
  T13["method:Plan::first<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:259"]
  S13 -->|calls| T13
  S14["method:TaskManager::removeTask<br/>TODO/TaskCenterComponent/TaskItem.swift:93"]
  T14["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S14 -->|calls| T14
  S15["method:TaskManager::removeTask<br/>TODO/TaskCenterComponent/TaskItem.swift:93"]
  T15["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  S15 -->|calls| T15
  S16["method:TaskManager::removeTask<br/>TODO/TaskCenterComponent/TaskItem.swift:93"]
  T16["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S16 -->|calls| T16
  S17["method:TaskManager::removeTask<br/>TODO/TaskCenterComponent/TaskItem.swift:93"]
  T17["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  S17 -->|calls| T17
  S18["method:TaskManager::removeAllTask<br/>TODO/TaskCenterComponent/TaskItem.swift:104"]
  T18["method:Bag::removeAll<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:84"]
  S18 -->|calls| T18
  S19["method:TaskManager::resume<br/>TODO/TaskCenterComponent/TaskItem.swift:114"]
  T19["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S19 -->|calls| T19
  S20["method:TaskManager::resume<br/>TODO/TaskCenterComponent/TaskItem.swift:114"]
  T20["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S20 -->|calls| T20
  S21["method:TaskManager::resume<br/>TODO/TaskCenterComponent/TaskItem.swift:114"]
  T21["method:TaskManager::resume<br/>TODO/TaskCenterComponent/TaskItem.swift:114"]
  S21 -->|calls| T21
  S22["method:TaskManager::resume<br/>TODO/TaskCenterComponent/TaskItem.swift:123"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S22 -->|calls| T22
  S23["method:TaskManager::resume<br/>TODO/TaskCenterComponent/TaskItem.swift:123"]
  T23["method:TaskManager::resume<br/>TODO/TaskCenterComponent/TaskItem.swift:123"]
  S23 -->|calls| T23
  S24["method:TaskManager::executeNow<br/>TODO/TaskCenterComponent/TaskItem.swift:134"]
  T24["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S24 -->|calls| T24
  S25["method:TaskManager::executeNow<br/>TODO/TaskCenterComponent/TaskItem.swift:134"]
  T25["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

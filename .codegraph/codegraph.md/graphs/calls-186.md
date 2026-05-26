# `calls 符号关系 - 186`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  T1["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S1 -->|calls| T1
  S2["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  T2["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S2 -->|calls| T2
  S3["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  T3["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  S3 -->|calls| T3
  S4["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  T4["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  S4 -->|calls| T4
  S5["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  T5["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S5 -->|calls| T5
  S6["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:175"]
  T6["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S6 -->|calls| T6
  S7["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:175"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S7 -->|calls| T7
  S8["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:175"]
  T8["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:175"]
  S8 -->|calls| T8
  S9["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:175"]
  T9["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  S9 -->|calls| T9
  S10["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:175"]
  T10["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S10 -->|calls| T10
  S11["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:184"]
  T11["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S11 -->|calls| T11
  S12["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:184"]
  T12["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S12 -->|calls| T12
  S13["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:184"]
  T13["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:205"]
  S13 -->|calls| T13
  S14["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:184"]
  T14["method:JobsTaskManager::notifyStatusChange<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:371"]
  S14 -->|calls| T14
  S15["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:205"]
  T15["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S15 -->|calls| T15
  S16["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:205"]
  T16["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S16 -->|calls| T16
  S17["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:205"]
  T17["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:205"]
  S17 -->|calls| T17
  S18["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:205"]
  T18["method:JobsTaskManager::notifyStatusChange<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:371"]
  S18 -->|calls| T18
  S19["class:JobsTaskManager<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:47"]
  T19["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S19 -->|calls| T19
  S20["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:233"]
  T20["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S20 -->|calls| T20
  S21["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:233"]
  T21["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S21 -->|calls| T21
  S22["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:237"]
  T22["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:237"]
  S22 -->|calls| T22
  S23["method:JobsTaskManager::addTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:250"]
  T23["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S23 -->|calls| T23
  S24["method:JobsTaskManager::addTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:250"]
  T24["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  S24 -->|calls| T24
  S25["method:JobsTaskManager::addTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:250"]
  T25["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:205"]
  T1["method:JobsTaskManager::notifyStatusChange<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:371"]
  S1 -->|calls| T1
  S2["class:JobsTaskManager<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:47"]
  T2["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S2 -->|calls| T2
  S3["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:233"]
  T3["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S3 -->|calls| T3
  S4["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:233"]
  T4["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S4 -->|calls| T4
  S5["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:237"]
  T5["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:237"]
  S5 -->|calls| T5
  S6["method:JobsTaskManager::addTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:250"]
  T6["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S6 -->|calls| T6
  S7["method:JobsTaskManager::addTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:250"]
  T7["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  S7 -->|calls| T7
  S8["method:JobsTaskManager::addTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:250"]
  T8["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S8 -->|calls| T8
  S9["method:JobsTaskManager::removeTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:257"]
  T9["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S9 -->|calls| T9
  S10["method:JobsTaskManager::removeTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:257"]
  T10["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:93"]
  S10 -->|calls| T10
  S11["method:JobsTaskManager::executeNowAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:264"]
  T11["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S11 -->|calls| T11
  S12["method:JobsTaskManager::executeNowAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:264"]
  T12["method:JobsTask::executeAndWait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:441"]
  S12 -->|calls| T12
  S13["method:JobsTaskManager::waitForAllTasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:270"]
  T13["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S13 -->|calls| T13
  S14["method:JobsTaskManager::waitForTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:281"]
  T14["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S14 -->|calls| T14
  S15["method:JobsTaskManager::waitForTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:281"]
  T15["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S15 -->|calls| T15
  S16["method:JobsTaskManager::executeNowAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:286"]
  T16["method:JobsTaskManager::executeNowAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:286"]
  S16 -->|calls| T16
  S17["method:JobsTaskManager::removeStatusObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:323"]
  T17["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S17 -->|calls| T17
  S18["method:JobsTaskManager::bindLifecycle<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:335"]
  T18["method:JobsTask::addLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:140"]
  S18 -->|calls| T18
  S19["method:JobsTaskManager::bindLifecycle<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:335"]
  T19["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S19 -->|calls| T19
  S20["method:JobsTaskManager::bindLifecycle<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:335"]
  T20["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  S20 -->|calls| T20
  S21["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  T21["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S21 -->|calls| T21
  S22["method:JobsTaskManager::notifyStatusChange<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:371"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S22 -->|calls| T22
  S23["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  T23["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S23 -->|calls| T23
  S24["method:JobsTaskManager::byAddTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:399"]
  T24["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  S24 -->|calls| T24
  S25["method:JobsTaskManager::byRemoveTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:405"]
  T25["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:88"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

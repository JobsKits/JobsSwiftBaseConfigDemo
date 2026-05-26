# `calls 符号关系 - 187`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTaskManager::removeTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:257"]
  T1["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S1 -->|calls| T1
  S2["method:JobsTaskManager::removeTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:257"]
  T2["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:93"]
  S2 -->|calls| T2
  S3["method:JobsTaskManager::executeNowAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:264"]
  T3["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S3 -->|calls| T3
  S4["method:JobsTaskManager::executeNowAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:264"]
  T4["method:JobsTask::executeAndWait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:441"]
  S4 -->|calls| T4
  S5["method:JobsTaskManager::waitForAllTasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:270"]
  T5["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S5 -->|calls| T5
  S6["method:JobsTaskManager::waitForTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:281"]
  T6["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S6 -->|calls| T6
  S7["method:JobsTaskManager::waitForTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:281"]
  T7["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S7 -->|calls| T7
  S8["method:JobsTaskManager::executeNowAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:286"]
  T8["method:JobsTaskManager::executeNowAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:286"]
  S8 -->|calls| T8
  S9["method:JobsTaskManager::removeStatusObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:323"]
  T9["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S9 -->|calls| T9
  S10["method:JobsTaskManager::bindLifecycle<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:335"]
  T10["method:JobsTask::addLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:140"]
  S10 -->|calls| T10
  S11["method:JobsTaskManager::bindLifecycle<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:335"]
  T11["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S11 -->|calls| T11
  S12["method:JobsTaskManager::bindLifecycle<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:335"]
  T12["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  S12 -->|calls| T12
  S13["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  T13["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S13 -->|calls| T13
  S14["method:JobsTaskManager::notifyStatusChange<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:371"]
  T14["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S14 -->|calls| T14
  S15["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  T15["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S15 -->|calls| T15
  S16["method:JobsTaskManager::byAddTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:399"]
  T16["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  S16 -->|calls| T16
  S17["method:JobsTaskManager::byRemoveTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:405"]
  T17["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:88"]
  S17 -->|calls| T17
  S18["method:JobsTaskManager::byRemoveTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:411"]
  T18["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:88"]
  S18 -->|calls| T18
  S19["method:JobsTaskManager::byRemoveAllTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:417"]
  T19["method:JobsTaskManager::removeAllTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:109"]
  S19 -->|calls| T19
  S20["method:JobsTaskManager::byResume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:423"]
  T20["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  S20 -->|calls| T20
  S21["method:JobsTaskManager::byResume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:429"]
  T21["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  S21 -->|calls| T21
  S22["method:JobsTaskManager::byExecuteNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:435"]
  T22["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  S22 -->|calls| T22
  S23["method:JobsTaskManager::byExecuteNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:441"]
  T23["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  S23 -->|calls| T23
  S24["method:JobsTaskManager::bySuspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:447"]
  T24["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  S24 -->|calls| T24
  S25["method:JobsTaskManager::bySuspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:453"]
  T25["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 185`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTaskManager::removeAllTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:109"]
  T1["method:JobsTaskManager::notifyStatusChange<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:371"]
  S1 -->|calls| T1
  S2["method:JobsTaskManager::removeAllTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:109"]
  T2["method:JobsTaskCenter::removeAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:50"]
  S2 -->|calls| T2
  S3["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  T3["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S3 -->|calls| T3
  S4["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  T4["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S4 -->|calls| T4
  S5["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  T5["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S5 -->|calls| T5
  S6["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  T6["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  S6 -->|calls| T6
  S7["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  T7["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  S7 -->|calls| T7
  S8["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  T8["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S8 -->|calls| T8
  S9["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:139"]
  T9["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S9 -->|calls| T9
  S10["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:139"]
  T10["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S10 -->|calls| T10
  S11["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:139"]
  T11["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:139"]
  S11 -->|calls| T11
  S12["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:139"]
  T12["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  S12 -->|calls| T12
  S13["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:139"]
  T13["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S13 -->|calls| T13
  S14["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  T14["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S14 -->|calls| T14
  S15["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  T15["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S15 -->|calls| T15
  S16["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  T16["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S16 -->|calls| T16
  S17["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  T17["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  S17 -->|calls| T17
  S18["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  T18["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  S18 -->|calls| T18
  S19["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  T19["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S19 -->|calls| T19
  S20["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:157"]
  T20["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S20 -->|calls| T20
  S21["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:157"]
  T21["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S21 -->|calls| T21
  S22["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:157"]
  T22["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:157"]
  S22 -->|calls| T22
  S23["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:157"]
  T23["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  S23 -->|calls| T23
  S24["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:157"]
  T24["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S24 -->|calls| T24
  S25["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  T25["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

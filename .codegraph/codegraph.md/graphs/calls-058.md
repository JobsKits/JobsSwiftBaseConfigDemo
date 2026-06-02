# `calls 符号关系 - 058`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTaskManager::byRemoveTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:411"]
  T1["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:88"]
  S1 -->|calls| T1
  S2["method:JobsTaskManager::byRemoveAllTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:417"]
  T2["method:JobsTaskManager::removeAllTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:109"]
  S2 -->|calls| T2
  S3["method:JobsTaskManager::byResume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:423"]
  T3["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  S3 -->|calls| T3
  S4["method:JobsTaskManager::byResume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:429"]
  T4["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  S4 -->|calls| T4
  S5["method:JobsTaskManager::byExecuteNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:435"]
  T5["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  S5 -->|calls| T5
  S6["method:JobsTaskManager::byExecuteNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:441"]
  T6["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  S6 -->|calls| T6
  S7["method:JobsTaskManager::bySuspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:447"]
  T7["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  S7 -->|calls| T7
  S8["method:JobsTaskManager::bySuspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:453"]
  T8["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  S8 -->|calls| T8
  S9["method:JobsTaskManager::byCancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:459"]
  T9["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:184"]
  S9 -->|calls| T9
  S10["method:JobsTaskManager::byCancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:465"]
  T10["method:JobsTaskManager::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:184"]
  S10 -->|calls| T10
  S11["method:JobsTaskManager::byAddTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:471"]
  T11["method:JobsTaskManager::addTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:250"]
  S11 -->|calls| T11
  S12["method:JobsTaskManager::byRemoveTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:477"]
  T12["method:JobsTaskManager::removeTaskAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:257"]
  S12 -->|calls| T12
  S13["method:JobsTaskManager::byExecuteNowAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:483"]
  T13["method:JobsTaskManager::executeNowAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:286"]
  S13 -->|calls| T13
  S14["method:JobsTaskManager::backgroundState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:492"]
  T14["method:JobsTaskManager::applicationStatusDidChanged<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:500"]
  S14 -->|calls| T14
  S15["method:JobsTaskManager::activeState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:496"]
  T15["method:JobsTaskManager::applicationStatusDidChanged<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:500"]
  S15 -->|calls| T15
  S16["method:JobsTaskManager::applicationStatusDidChanged<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:500"]
  T16["method:JobsTaskManager::tasksSnapshot<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:329"]
  S16 -->|calls| T16
  S17["method:JobsTaskManager::applicationStatusDidChanged<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:500"]
  T17["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S17 -->|calls| T17
  S18["method:JobsTaskManager::applicationStatusDidChanged<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:500"]
  T18["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  S18 -->|calls| T18
  S19["method:JobsTaskManager::applicationStatusDidChanged<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:500"]
  T19["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  S19 -->|calls| T19
  S20["method:JobsTaskManager::applicationStatusDidChanged<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:500"]
  T20["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S20 -->|calls| T20
  S21["method:JobsTaskManager::applicationStatusDidChanged<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:500"]
  T21["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  S21 -->|calls| T21
  S22["method:JobsTaskManager::applicationStatusDidChanged<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:500"]
  T22["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  S22 -->|calls| T22
  S23["struct:JobsTaskManagerExecutionStream::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerExecutionStream.swift:30"]
  T23["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S23 -->|calls| T23
  S24["struct:JobsTaskManagerExecutionStream::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerExecutionStream.swift:30"]
  T24["method:JobsTaskManagerExecutionStream::makeAsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerExecutionStream.swift:26"]
  S24 -->|calls| T24
  S25["struct:JobsTaskManagerExecutionStream::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerExecutionStream.swift:30"]
  T25["method:JobsTask::executions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:450"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

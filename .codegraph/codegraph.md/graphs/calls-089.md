# `calls 符号关系 - 089`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TaskManager::executeNow<br/>TODO/TaskCenterComponent/TaskItem.swift:134"]
  T1["method:TaskManager::executeNow<br/>TODO/TaskCenterComponent/TaskItem.swift:134"]
  S1 -->|calls| T1
  S2["method:TaskManager::executeNow<br/>TODO/TaskCenterComponent/TaskItem.swift:143"]
  T2["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S2 -->|calls| T2
  S3["method:TaskManager::executeNow<br/>TODO/TaskCenterComponent/TaskItem.swift:143"]
  T3["method:TaskManager::executeNow<br/>TODO/TaskCenterComponent/TaskItem.swift:143"]
  S3 -->|calls| T3
  S4["method:TaskManager::suspend<br/>TODO/TaskCenterComponent/TaskItem.swift:154"]
  T4["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S4 -->|calls| T4
  S5["method:TaskManager::suspend<br/>TODO/TaskCenterComponent/TaskItem.swift:154"]
  T5["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S5 -->|calls| T5
  S6["method:TaskManager::suspend<br/>TODO/TaskCenterComponent/TaskItem.swift:154"]
  T6["method:TaskManager::suspend<br/>TODO/TaskCenterComponent/TaskItem.swift:154"]
  S6 -->|calls| T6
  S7["method:TaskManager::suspend<br/>TODO/TaskCenterComponent/TaskItem.swift:165"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S7 -->|calls| T7
  S8["method:TaskManager::suspend<br/>TODO/TaskCenterComponent/TaskItem.swift:165"]
  T8["method:TaskManager::suspend<br/>TODO/TaskCenterComponent/TaskItem.swift:165"]
  S8 -->|calls| T8
  S9["method:TaskManager::cancel<br/>TODO/TaskCenterComponent/TaskItem.swift:176"]
  T9["method:Plan::first<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:259"]
  S9 -->|calls| T9
  S10["method:TaskManager::cancel<br/>TODO/TaskCenterComponent/TaskItem.swift:176"]
  T10["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S10 -->|calls| T10
  S11["method:TaskManager::cancel<br/>TODO/TaskCenterComponent/TaskItem.swift:176"]
  T11["method:TaskManager::cancel<br/>TODO/TaskCenterComponent/TaskItem.swift:176"]
  S11 -->|calls| T11
  S12["method:TaskManager::cancel<br/>TODO/TaskCenterComponent/TaskItem.swift:176"]
  T12["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S12 -->|calls| T12
  S13["method:TaskManager::cancel<br/>TODO/TaskCenterComponent/TaskItem.swift:176"]
  T13["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S13 -->|calls| T13
  S14["method:TaskManager::cancel<br/>TODO/TaskCenterComponent/TaskItem.swift:176"]
  T14["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  S14 -->|calls| T14
  S15["method:TaskManager::cancel<br/>TODO/TaskCenterComponent/TaskItem.swift:188"]
  T15["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S15 -->|calls| T15
  S16["method:TaskManager::cancel<br/>TODO/TaskCenterComponent/TaskItem.swift:188"]
  T16["method:TaskManager::cancel<br/>TODO/TaskCenterComponent/TaskItem.swift:188"]
  S16 -->|calls| T16
  S17["method:TaskManager::applicationStatusDidChanged<br/>TODO/TaskCenterComponent/TaskItem.swift:204"]
  T17["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S17 -->|calls| T17
  S18["method:TaskManager::applicationStatusDidChanged<br/>TODO/TaskCenterComponent/TaskItem.swift:204"]
  T18["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S18 -->|calls| T18
  S19["method:TaskManager::applicationStatusDidChanged<br/>TODO/TaskCenterComponent/TaskItem.swift:204"]
  T19["method:TaskManager::resume<br/>TODO/TaskCenterComponent/TaskItem.swift:123"]
  S19 -->|calls| T19
  S20["method:TaskManager::applicationStatusDidChanged<br/>TODO/TaskCenterComponent/TaskItem.swift:204"]
  T20["method:TaskManager::executeNow<br/>TODO/TaskCenterComponent/TaskItem.swift:143"]
  S20 -->|calls| T20
  S21["method:TaskManager::applicationStatusDidChanged<br/>TODO/TaskCenterComponent/TaskItem.swift:204"]
  T21["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S21 -->|calls| T21
  S22["method:TaskManager::applicationStatusDidChanged<br/>TODO/TaskCenterComponent/TaskItem.swift:204"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S22 -->|calls| T22
  S23["method:TaskManager::applicationStatusDidChanged<br/>TODO/TaskCenterComponent/TaskItem.swift:204"]
  T23["method:TaskManager::suspend<br/>TODO/TaskCenterComponent/TaskItem.swift:165"]
  S23 -->|calls| T23
  S24["class:TaskItem<br/>TODO/TaskCenterComponent/TaskItem.swift:230"]
  T24["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  S24 -->|calls| T24
  S25["function:InitCrashReporter<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:72"]
  T25["function:SavePendingCrashReport<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:22"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 087`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TaskCenter::removeTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:114"]
  T1["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S1 -->|calls| T1
  S2["method:TaskCenter::removeTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:114"]
  T2["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S2 -->|calls| T2
  S3["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  T3["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S3 -->|calls| T3
  S4["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  T4["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S4 -->|calls| T4
  S5["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  T5["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S5 -->|calls| T5
  S6["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  T6["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S6 -->|calls| T6
  S7["class:TaskCenter<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:39"]
  T7["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S7 -->|calls| T7
  S8["class:TaskCenter<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:39"]
  T8["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S8 -->|calls| T8
  S9["method:TaskCenter::removeAll<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:162"]
  T9["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S9 -->|calls| T9
  S10["method:TaskCenter::suspend<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:170"]
  T10["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S10 -->|calls| T10
  S11["method:TaskCenter::suspend<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:170"]
  T11["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S11 -->|calls| T11
  S12["method:TaskCenter::resume<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:175"]
  T12["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S12 -->|calls| T12
  S13["method:TaskCenter::resume<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:175"]
  T13["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S13 -->|calls| T13
  S14["method:TaskCenter::cancel<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:180"]
  T14["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S14 -->|calls| T14
  S15["method:TaskCenter::cancel<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:180"]
  T15["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S15 -->|calls| T15
  S16["struct:Time<br/>TODO/TaskCenterComponent/Schedule/Time.swift:12"]
  T16["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S16 -->|calls| T16
  S17["struct:Time<br/>TODO/TaskCenterComponent/Schedule/Time.swift:12"]
  T17["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S17 -->|calls| T17
  S18["struct:Time<br/>TODO/TaskCenterComponent/Schedule/Time.swift:12"]
  T18["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S18 -->|calls| T18
  S19["struct:Time<br/>TODO/TaskCenterComponent/Schedule/Time.swift:12"]
  T19["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S19 -->|calls| T19
  S20["struct:Time<br/>TODO/TaskCenterComponent/Schedule/Time.swift:12"]
  T20["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S20 -->|calls| T20
  S21["struct:Time<br/>TODO/TaskCenterComponent/Schedule/Time.swift:12"]
  T21["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S21 -->|calls| T21
  S22["method:TaskCenterComponent::createRunLoopTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:14"]
  T22["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  S22 -->|calls| T22
  S23["method:TaskCenterComponent::createRunLoppTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:22"]
  T23["method:TaskCenterComponent::createRunLoopTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:14"]
  S23 -->|calls| T23
  S24["method:TaskCenterComponent::appendTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:26"]
  T24["method:STTask::addAction<br/>TODO/TaskCenterComponent/Schedule/Task.swift:261"]
  S24 -->|calls| T24
  S25["method:TaskCenterComponent::createTimerTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:30"]
  T25["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

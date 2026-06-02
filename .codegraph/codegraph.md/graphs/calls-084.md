# `calls 符号关系 - 084`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:478"]
  T1["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:478"]
  S1 -->|calls| T1
  S2["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:478"]
  T2["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S2 -->|calls| T2
  S3["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:478"]
  T3["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S3 -->|calls| T3
  S4["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:478"]
  T4["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  S4 -->|calls| T4
  S5["method:Plan::isNever<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:492"]
  T5["method:BagKeyGenerator::next<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:33"]
  S5 -->|calls| T5
  S6["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  T6["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S6 -->|calls| T6
  S7["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  T7["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S7 -->|calls| T7
  S8["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  T8["method:Date::interval<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:317"]
  S8 -->|calls| T8
  S9["method:RunLoopTask::InternalRunLoopTask::threadAction<br/>TODO/TaskCenterComponent/Schedule/RunLoopTask.swift:85"]
  T9["method:TaskCenter::add<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:52"]
  S9 -->|calls| T9
  S10["method:RunLoopTask::InternalRunLoopTask::notifyExeAction<br/>TODO/TaskCenterComponent/Schedule/RunLoopTask.swift:90"]
  T10["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  S10 -->|calls| T10
  S11["class:RunLoopTask<br/>TODO/TaskCenterComponent/Schedule/RunLoopTask.swift:56"]
  T11["method:RunLoopTask::InternalRunLoopTask::notifyExeAction<br/>TODO/TaskCenterComponent/Schedule/RunLoopTask.swift:90"]
  S11 -->|calls| T11
  S12["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T12["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S12 -->|calls| T12
  S13["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T13["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S13 -->|calls| T13
  S14["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T14["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S14 -->|calls| T14
  S15["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T15["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S15 -->|calls| T15
  S16["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T16["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S16 -->|calls| T16
  S17["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T17["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S17 -->|calls| T17
  S18["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T18["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S18 -->|calls| T18
  S19["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T19["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S19 -->|calls| T19
  S20["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T20["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S20 -->|calls| T20
  S21["method:STTask::removeFromTaskCenter<br/>TODO/TaskCenterComponent/Schedule/Task.swift:126"]
  T21["method:JobsTaskCenter::remove<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:41"]
  S21 -->|calls| T21
  S22["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T22["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S22 -->|calls| T22
  S23["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T23["method:STTask::elapse<br/>TODO/TaskCenterComponent/Schedule/Task.swift:179"]
  S23 -->|calls| T23
  S24["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T24["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S24 -->|calls| T24
  S25["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T25["method:DispatchSourceTimer::schedule<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:337"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

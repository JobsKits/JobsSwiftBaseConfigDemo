# `calls 符号关系 - 085`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T1["method:Interval::adding<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:118"]
  S1 -->|calls| T1
  S2["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T2["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S2 -->|calls| T2
  S3["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T3["method:TaskCenter::add<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:52"]
  S3 -->|calls| T3
  S4["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T4["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S4 -->|calls| T4
  S5["class:STTask<br/>TODO/TaskCenterComponent/Schedule/Task.swift:25"]
  T5["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  S5 -->|calls| T5
  S6["method:STTask::elapse<br/>TODO/TaskCenterComponent/Schedule/Task.swift:179"]
  T6["method:STTask::scheduleNextExecution<br/>TODO/TaskCenterComponent/Schedule/Task.swift:184"]
  S6 -->|calls| T6
  S7["method:STTask::elapse<br/>TODO/TaskCenterComponent/Schedule/Task.swift:179"]
  T7["method:STTask::executeNow<br/>TODO/TaskCenterComponent/Schedule/Task.swift:202"]
  S7 -->|calls| T7
  S8["method:STTask::scheduleNextExecution<br/>TODO/TaskCenterComponent/Schedule/Task.swift:184"]
  T8["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S8 -->|calls| T8
  S9["method:STTask::scheduleNextExecution<br/>TODO/TaskCenterComponent/Schedule/Task.swift:184"]
  T9["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S9 -->|calls| T9
  S10["method:STTask::scheduleNextExecution<br/>TODO/TaskCenterComponent/Schedule/Task.swift:184"]
  T10["method:DispatchSourceTimer::schedule<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:337"]
  S10 -->|calls| T10
  S11["method:STTask::scheduleNextExecution<br/>TODO/TaskCenterComponent/Schedule/Task.swift:184"]
  T11["method:Date::interval<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:317"]
  S11 -->|calls| T11
  S12["method:STTask::executeNow<br/>TODO/TaskCenterComponent/Schedule/Task.swift:202"]
  T12["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S12 -->|calls| T12
  S13["method:STTask::executeNow<br/>TODO/TaskCenterComponent/Schedule/Task.swift:202"]
  T13["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S13 -->|calls| T13
  S14["method:STTask::reschedule<br/>TODO/TaskCenterComponent/Schedule/Task.swift:219"]
  T14["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S14 -->|calls| T14
  S15["method:STTask::reschedule<br/>TODO/TaskCenterComponent/Schedule/Task.swift:219"]
  T15["method:STTask::scheduleNextExecution<br/>TODO/TaskCenterComponent/Schedule/Task.swift:184"]
  S15 -->|calls| T15
  S16["method:STTask::suspend<br/>TODO/TaskCenterComponent/Schedule/Task.swift:229"]
  T16["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S16 -->|calls| T16
  S17["method:STTask::resume<br/>TODO/TaskCenterComponent/Schedule/Task.swift:241"]
  T17["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S17 -->|calls| T17
  S18["method:STTask::resume<br/>TODO/TaskCenterComponent/Schedule/Task.swift:241"]
  T18["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S18 -->|calls| T18
  S19["method:STTask::cancel<br/>TODO/TaskCenterComponent/Schedule/Task.swift:253"]
  T19["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S19 -->|calls| T19
  S20["method:STTask::cancel<br/>TODO/TaskCenterComponent/Schedule/Task.swift:253"]
  T20["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  S20 -->|calls| T20
  S21["method:STTask::addAction<br/>TODO/TaskCenterComponent/Schedule/Task.swift:261"]
  T21["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S21 -->|calls| T21
  S22["method:STTask::addAction<br/>TODO/TaskCenterComponent/Schedule/Task.swift:261"]
  T22["method:BagKey::asActionKey<br/>TODO/TaskCenterComponent/Schedule/Task.swift:19"]
  S22 -->|calls| T22
  S23["method:STTask::removeAction<br/>TODO/TaskCenterComponent/Schedule/Task.swift:269"]
  T23["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S23 -->|calls| T23
  S24["method:STTask::removeAction<br/>TODO/TaskCenterComponent/Schedule/Task.swift:269"]
  T24["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S24 -->|calls| T24
  S25["method:STTask::removeAllActions<br/>TODO/TaskCenterComponent/Schedule/Task.swift:276"]
  T25["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

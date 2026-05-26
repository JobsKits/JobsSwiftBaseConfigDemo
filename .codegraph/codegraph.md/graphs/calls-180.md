# `calls 符号关系 - 180`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T1["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  S1 -->|calls| T1
  S2["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T2["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  S2 -->|calls| T2
  S3["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  T3["enum_member:PromiseKitDemoVC::Section::actions<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PromiseKit/PromiseKitDemoVC.swift:56"]
  S3 -->|calls| T3
  S4["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  T4["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S4 -->|calls| T4
  S5["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  T5["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S5 -->|calls| T5
  S6["method:JobsTask::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:166"]
  T6["method:JobsTask::updateState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:353"]
  S6 -->|calls| T6
  S7["method:JobsTask::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:166"]
  T7["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  S7 -->|calls| T7
  S8["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  T8["method:JobsTask::updateState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:353"]
  S8 -->|calls| T8
  S9["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  T9["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S9 -->|calls| T9
  S10["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  T10["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  S10 -->|calls| T10
  S11["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  T11["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S11 -->|calls| T11
  S12["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  T12["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S12 -->|calls| T12
  S13["method:JobsTask::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:232"]
  T13["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S13 -->|calls| T13
  S14["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T14["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S14 -->|calls| T14
  S15["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T15["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S15 -->|calls| T15
  S16["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T16["method:Date::adding<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterExtension.swift:32"]
  S16 -->|calls| T16
  S17["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T17["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S17 -->|calls| T17
  S18["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T18["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  S18 -->|calls| T18
  S19["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T19["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S19 -->|calls| T19
  S20["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T20["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S20 -->|calls| T20
  S21["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T21["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S21 -->|calls| T21
  S22["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T22["method:Date::adding<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterExtension.swift:32"]
  S22 -->|calls| T22
  S23["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T23["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S23 -->|calls| T23
  S24["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T24["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  S24 -->|calls| T24
  S25["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  T25["method:JobsTask::handleTimerFired<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:343"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

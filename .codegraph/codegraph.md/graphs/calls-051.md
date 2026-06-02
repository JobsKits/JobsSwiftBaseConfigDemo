# `calls 符号关系 - 051`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T1["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S1 -->|calls| T1
  S2["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T2["method:Date::adding<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterExtension.swift:32"]
  S2 -->|calls| T2
  S3["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T3["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S3 -->|calls| T3
  S4["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T4["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  S4 -->|calls| T4
  S5["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T5["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S5 -->|calls| T5
  S6["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T6["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S6 -->|calls| T6
  S7["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S7 -->|calls| T7
  S8["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T8["method:Date::adding<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterExtension.swift:32"]
  S8 -->|calls| T8
  S9["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T9["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S9 -->|calls| T9
  S10["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T10["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  S10 -->|calls| T10
  S11["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  T11["method:JobsTask::handleTimerFired<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:343"]
  S11 -->|calls| T11
  S12["method:JobsTask::handleTimerFired<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:343"]
  T12["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  S12 -->|calls| T12
  S13["method:JobsTask::handleTimerFired<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:343"]
  T13["method:JobsTask::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:232"]
  S13 -->|calls| T13
  S14["method:JobsTask::updateState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:353"]
  T14["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S14 -->|calls| T14
  S15["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T15["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S15 -->|calls| T15
  S16["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T16["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S16 -->|calls| T16
  S17["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T17["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S17 -->|calls| T17
  S18["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T18["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S18 -->|calls| T18
  S19["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T19["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S19 -->|calls| T19
  S20["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T20["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S20 -->|calls| T20
  S21["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T21["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S21 -->|calls| T21
  S22["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T22["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S22 -->|calls| T22
  S23["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T23["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S23 -->|calls| T23
  S24["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T24["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S24 -->|calls| T24
  S25["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T25["method:JobsTask::addLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:140"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

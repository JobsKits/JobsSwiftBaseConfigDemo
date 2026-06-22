# `calls 符号关系 - 014`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T1["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S1 -->|calls| T1
  S2["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T2["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S2 -->|calls| T2
  S3["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T3["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S3 -->|calls| T3
  S4["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T4["method:JobsTask::addLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:140"]
  S4 -->|calls| T4
  S5["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T5["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S5 -->|calls| T5
  S6["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T6["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S6 -->|calls| T6
  S7["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T7["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S7 -->|calls| T7
  S8["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T8["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S8 -->|calls| T8
  S9["method:JobsTask::executeAndWait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:441"]
  T9["method:JobsTask::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:232"]
  S9 -->|calls| T9
  S10["method:JobsTask::executeAndWait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:441"]
  T10["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  S10 -->|calls| T10
  S11["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T11["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S11 -->|calls| T11
  S12["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T12["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S12 -->|calls| T12
  S13["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T13["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S13 -->|calls| T13
  S14["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T14["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S14 -->|calls| T14
  S15["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T15["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S15 -->|calls| T15
  S16["method:JobsTask::waitAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:481"]
  T16["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S16 -->|calls| T16
  S17["method:JobsTask::waitAny<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:496"]
  T17["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S17 -->|calls| T17
  S18["class:JobsSwiftTimerCountdown<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:11"]
  T18["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  S18 -->|calls| T18
  S19["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  T19["method:JobsSwiftTimerCountdown::resetInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:176"]
  S19 -->|calls| T19
  S20["method:JobsSwiftTimerCountdown::reset<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:171"]
  T20["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  S20 -->|calls| T20
  S21["method:JobsSwiftTimerCountdown::reset<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:171"]
  T21["method:JobsSwiftTimerCountdown::resetInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:176"]
  S21 -->|calls| T21
  S22["method:JobsSwiftTimerCountdown::byStartRunning<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:197"]
  T22["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  S22 -->|calls| T22
  S23["method:JobsObservable::combineLatest<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Combine.swift:12"]
  T23["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S23 -->|calls| T23
  S24["method:JobsObservable::combineLatest<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Combine.swift:12"]
  T24["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S24 -->|calls| T24
  S25["method:JobsObservable::map<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:12"]
  T25["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

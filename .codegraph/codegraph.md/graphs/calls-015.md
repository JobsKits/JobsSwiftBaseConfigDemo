# `calls 符号关系 - 015`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T1["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S1 -->|calls| T1
  S2["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T2["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S2 -->|calls| T2
  S3["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T3["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S3 -->|calls| T3
  S4["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T4["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S4 -->|calls| T4
  S5["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T5["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S5 -->|calls| T5
  S6["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T6["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S6 -->|calls| T6
  S7["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T7["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S7 -->|calls| T7
  S8["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T8["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S8 -->|calls| T8
  S9["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T9["method:JobsTask::addLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:140"]
  S9 -->|calls| T9
  S10["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T10["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S10 -->|calls| T10
  S11["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T11["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S11 -->|calls| T11
  S12["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T12["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S12 -->|calls| T12
  S13["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T13["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S13 -->|calls| T13
  S14["method:JobsTask::executeAndWait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:441"]
  T14["method:JobsTask::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:232"]
  S14 -->|calls| T14
  S15["method:JobsTask::executeAndWait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:441"]
  T15["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  S15 -->|calls| T15
  S16["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T16["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S16 -->|calls| T16
  S17["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T17["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S17 -->|calls| T17
  S18["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T18["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S18 -->|calls| T18
  S19["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T19["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S19 -->|calls| T19
  S20["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T20["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S20 -->|calls| T20
  S21["method:JobsTask::waitAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:481"]
  T21["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S21 -->|calls| T21
  S22["method:JobsTask::waitAny<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:496"]
  T22["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S22 -->|calls| T22
  S23["class:JobsSwiftTimerCountdown<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:11"]
  T23["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  S23 -->|calls| T23
  S24["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  T24["method:JobsSwiftTimerCountdown::resetInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:176"]
  S24 -->|calls| T24
  S25["method:JobsSwiftTimerCountdown::reset<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:171"]
  T25["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

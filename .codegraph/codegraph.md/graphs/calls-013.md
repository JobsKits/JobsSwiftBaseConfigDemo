# `calls 符号关系 - 013`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCallbackable::jobsCallOptional<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:88"]
  T1["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S1 -->|calls| T1
  S2["method:JobsCallbackable::jobsCallOptional<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:93"]
  T2["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S2 -->|calls| T2
  S3["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:103"]
  T3["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S3 -->|calls| T3
  S4["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:103"]
  T4["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S4 -->|calls| T4
  S5["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:107"]
  T5["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S5 -->|calls| T5
  S6["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:107"]
  T6["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S6 -->|calls| T6
  S7["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:111"]
  T7["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S7 -->|calls| T7
  S8["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:111"]
  T8["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S8 -->|calls| T8
  S9["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T9["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  S9 -->|calls| T9
  S10["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T10["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  S10 -->|calls| T10
  S11["method:JobsTask::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:166"]
  T11["method:JobsTask::updateState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:353"]
  S11 -->|calls| T11
  S12["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  T12["method:JobsTask::updateState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:353"]
  S12 -->|calls| T12
  S13["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  T13["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  S13 -->|calls| T13
  S14["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T14["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  S14 -->|calls| T14
  S15["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T15["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  S15 -->|calls| T15
  S16["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  T16["method:JobsTask::handleTimerFired<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:343"]
  S16 -->|calls| T16
  S17["method:JobsTask::handleTimerFired<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:343"]
  T17["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  S17 -->|calls| T17
  S18["method:JobsTask::handleTimerFired<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:343"]
  T18["method:JobsTask::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:232"]
  S18 -->|calls| T18
  S19["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T19["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S19 -->|calls| T19
  S20["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T20["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S20 -->|calls| T20
  S21["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T21["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S21 -->|calls| T21
  S22["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T22["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S22 -->|calls| T22
  S23["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T23["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S23 -->|calls| T23
  S24["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T24["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S24 -->|calls| T24
  S25["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  T25["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

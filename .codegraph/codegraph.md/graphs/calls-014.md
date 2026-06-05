# `calls 符号关系 - 014`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:68"]
  T1["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S1 -->|calls| T1
  S2["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:73"]
  T2["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S2 -->|calls| T2
  S3["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:78"]
  T3["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S3 -->|calls| T3
  S4["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  T4["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S4 -->|calls| T4
  S5["method:JobsCallbackable::jobsCallOptional<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:88"]
  T5["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S5 -->|calls| T5
  S6["method:JobsCallbackable::jobsCallOptional<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:93"]
  T6["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S6 -->|calls| T6
  S7["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:103"]
  T7["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S7 -->|calls| T7
  S8["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:103"]
  T8["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S8 -->|calls| T8
  S9["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:107"]
  T9["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S9 -->|calls| T9
  S10["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:107"]
  T10["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S10 -->|calls| T10
  S11["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:111"]
  T11["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S11 -->|calls| T11
  S12["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:111"]
  T12["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S12 -->|calls| T12
  S13["method:JobsDebugDeinitAutoLoad::load<br/>JobsByPods/JobsSwiftDebugTools@Pods/JobsDebugDeinitAutoLoad.m:18"]
  T13["method:CameraCaptureController::start<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:356"]
  S13 -->|calls| T13
  S14["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T14["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  S14 -->|calls| T14
  S15["class:JobsTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:28"]
  T15["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  S15 -->|calls| T15
  S16["method:JobsTask::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:166"]
  T16["method:JobsTask::updateState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:353"]
  S16 -->|calls| T16
  S17["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  T17["method:JobsTask::updateState<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:353"]
  S17 -->|calls| T17
  S18["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  T18["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  S18 -->|calls| T18
  S19["method:JobsTask::scheduleInitialIfNeeded<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:255"]
  T19["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  S19 -->|calls| T19
  S20["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  T20["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  S20 -->|calls| T20
  S21["method:JobsTask::installTimer<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:308"]
  T21["method:JobsTask::handleTimerFired<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:343"]
  S21 -->|calls| T21
  S22["method:JobsTask::handleTimerFired<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:343"]
  T22["method:JobsTask::scheduleNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:279"]
  S22 -->|calls| T22
  S23["method:JobsTask::handleTimerFired<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:343"]
  T23["method:JobsTask::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:232"]
  S23 -->|calls| T23
  S24["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T24["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S24 -->|calls| T24
  S25["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  T25["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 191`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T1["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S1 -->|calls| T1
  S2["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T2["method:JobsAppStateManager::syncWithCurrentAppStateIfNeeded<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:494"]
  S2 -->|calls| T2
  S3["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:448"]
  T3["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  S3 -->|calls| T3
  S4["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:448"]
  T4["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S4 -->|calls| T4
  S5["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:448"]
  T5["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S5 -->|calls| T5
  S6["class:JobsAppStateManager<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:479"]
  T6["method:JobsAppStateManager::register<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:503"]
  S6 -->|calls| T6
  S7["class:JobsAppStateManager<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:479"]
  T7["method:JobsAppStateManager::unregister<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:520"]
  S7 -->|calls| T7
  S8["method:JobsAppStateManager::unregister<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:520"]
  T8["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S8 -->|calls| T8
  S9["class:JobsSwiftTimerCountdown<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:11"]
  T9["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  S9 -->|calls| T9
  S10["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  T10["method:JobsSwiftTimerCountdown::resetInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:176"]
  S10 -->|calls| T10
  S11["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  T11["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S11 -->|calls| T11
  S12["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  T12["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S12 -->|calls| T12
  S13["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  T13["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S13 -->|calls| T13
  S14["method:JobsSwiftTimerCountdown::reset<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:171"]
  T14["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  S14 -->|calls| T14
  S15["method:JobsSwiftTimerCountdown::reset<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:171"]
  T15["method:JobsSwiftTimerCountdown::resetInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:176"]
  S15 -->|calls| T15
  S16["method:JobsSwiftTimerCountdown::byStartRunning<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:197"]
  T16["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  S16 -->|calls| T16
  S17["method:JobsSwiftTimerManager::create<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:33"]
  T17["method:JobsSwiftTimerManager::remove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:101"]
  S17 -->|calls| T17
  S18["method:JobsSwiftTimerManager::create<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:33"]
  T18["method:JobsSwiftTimerManager::register<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:134"]
  S18 -->|calls| T18
  S19["method:JobsSwiftTimerManager::act<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:87"]
  T19["method:JobsSwiftTimerManager::timer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:81"]
  S19 -->|calls| T19
  S20["method:JobsSwiftTimerManager::act<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:87"]
  T20["method:JobsSwiftTimerManager::remove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:101"]
  S20 -->|calls| T20
  S21["method:JobsSwiftTimerManager::remove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:101"]
  T21["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S21 -->|calls| T21
  S22["method:JobsSwiftTimerManager::removeAll<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:109"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S22 -->|calls| T22
  S23["method:JobsSwiftTimerManager::stopAndRemove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:121"]
  T23["method:JobsSwiftTimerManager::act<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:87"]
  S23 -->|calls| T23
  S24["method:JobsSwiftTimerManager::stopAndRemove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:129"]
  T24["method:JobsSwiftTimerManager::stopAndRemove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:129"]
  S24 -->|calls| T24
  S25["method:JobsSwiftTimerManager::register<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:134"]
  T25["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

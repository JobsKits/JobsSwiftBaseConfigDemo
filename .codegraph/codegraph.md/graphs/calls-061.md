# `calls 符号关系 - 061`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTimer::startDisplayLink<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:380"]
  T1["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  S1 -->|calls| T1
  S2["method:JobsTimer::DisplayLinkProxy::tick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:398"]
  T2["method:JobsTimer::onTick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:237"]
  S2 -->|calls| T2
  S3["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T3["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S3 -->|calls| T3
  S4["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T4["method:JobsTimer::requireMainRunLoopForNonGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:80"]
  S4 -->|calls| T4
  S5["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T5["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S5 -->|calls| T5
  S6["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T6["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  S6 -->|calls| T6
  S7["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T7["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S7 -->|calls| T7
  S8["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T8["method:JobsAppStateManager::syncWithCurrentAppStateIfNeeded<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:494"]
  S8 -->|calls| T8
  S9["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:448"]
  T9["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  S9 -->|calls| T9
  S10["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:448"]
  T10["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S10 -->|calls| T10
  S11["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:448"]
  T11["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S11 -->|calls| T11
  S12["class:JobsAppStateManager<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:479"]
  T12["method:JobsAppStateManager::register<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:503"]
  S12 -->|calls| T12
  S13["class:JobsAppStateManager<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:479"]
  T13["method:JobsAppStateManager::unregister<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:520"]
  S13 -->|calls| T13
  S14["method:JobsAppStateManager::unregister<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:520"]
  T14["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S14 -->|calls| T14
  S15["class:JobsSwiftTimerCountdown<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:11"]
  T15["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  S15 -->|calls| T15
  S16["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  T16["method:JobsSwiftTimerCountdown::resetInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:176"]
  S16 -->|calls| T16
  S17["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  T17["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S17 -->|calls| T17
  S18["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  T18["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S18 -->|calls| T18
  S19["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  T19["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
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
  S23["method:JobsSwiftTimerManager::create<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:33"]
  T23["method:JobsSwiftTimerManager::remove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:101"]
  S23 -->|calls| T23
  S24["method:JobsSwiftTimerManager::create<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:33"]
  T24["method:JobsSwiftTimerManager::register<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:134"]
  S24 -->|calls| T24
  S25["method:JobsSwiftTimerManager::act<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:87"]
  T25["method:JobsSwiftTimerManager::timer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:81"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

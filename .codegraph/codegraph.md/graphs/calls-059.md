# `calls 符号关系 - 059`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTaskManagerExecutionStream::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerExecutionStream.swift:44"]
  T1["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S1 -->|calls| T1
  S2["struct:JobsTaskManagerStatusStream::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerStatusStream.swift:28"]
  T2["method:JobsTaskManager::addStatusObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:314"]
  S2 -->|calls| T2
  S3["struct:JobsTaskManagerStatusStream::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerStatusStream.swift:28"]
  T3["method:JobsTaskManager::removeStatusObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:323"]
  S3 -->|calls| T3
  S4["struct:JobsTaskManagerStatusStream::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerStatusStream.swift:28"]
  T4["method:JobsTaskManagerExecutionStream::makeAsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerExecutionStream.swift:26"]
  S4 -->|calls| T4
  S5["method:JobsTaskManagerStatusStream::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerStatusStream.swift:44"]
  T5["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S5 -->|calls| T5
  S6["class:JobsTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:37"]
  T6["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S6 -->|calls| T6
  S7["class:JobsTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:37"]
  T7["method:JobsTimer::requireMainRunLoopForNonGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:80"]
  S7 -->|calls| T7
  S8["class:JobsTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:37"]
  T8["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:448"]
  S8 -->|calls| T8
  S9["class:JobsTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:37"]
  T9["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S9 -->|calls| T9
  S10["class:JobsTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:37"]
  T10["method:JobsTimer::teardownAppState<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:466"]
  S10 -->|calls| T10
  S11["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T11["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S11 -->|calls| T11
  S12["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T12["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S12 -->|calls| T12
  S13["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T13["method:JobsTimer::startGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:318"]
  S13 -->|calls| T13
  S14["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T14["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  S14 -->|calls| T14
  S15["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T15["method:JobsTimer::startDisplayLink<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:380"]
  S15 -->|calls| T15
  S16["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T16["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  S16 -->|calls| T16
  S17["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  T17["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S17 -->|calls| T17
  S18["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  T18["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S18 -->|calls| T18
  S19["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  T19["method:JobsTimer::pauseGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:336"]
  S19 -->|calls| T19
  S20["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T20["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S20 -->|calls| T20
  S21["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T21["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S21 -->|calls| T21
  S22["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T22["method:JobsTimer::resumeGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:345"]
  S22 -->|calls| T22
  S23["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T23["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  S23 -->|calls| T23
  S24["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T24["method:JobsTimer::startDisplayLink<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:380"]
  S24 -->|calls| T24
  S25["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T25["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

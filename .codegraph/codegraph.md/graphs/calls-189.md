# `calls 符号关系 - 189`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:37"]
  T1["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S1 -->|calls| T1
  S2["class:JobsTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:37"]
  T2["method:JobsTimer::teardownAppState<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:466"]
  S2 -->|calls| T2
  S3["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T3["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S3 -->|calls| T3
  S4["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T4["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S4 -->|calls| T4
  S5["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T5["method:JobsTimer::startGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:318"]
  S5 -->|calls| T5
  S6["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T6["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  S6 -->|calls| T6
  S7["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T7["method:JobsTimer::startDisplayLink<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:380"]
  S7 -->|calls| T7
  S8["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  T8["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  S8 -->|calls| T8
  S9["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  T9["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S9 -->|calls| T9
  S10["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  T10["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S10 -->|calls| T10
  S11["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  T11["method:JobsTimer::pauseGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:336"]
  S11 -->|calls| T11
  S12["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T12["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S12 -->|calls| T12
  S13["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T13["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S13 -->|calls| T13
  S14["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T14["method:JobsTimer::resumeGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:345"]
  S14 -->|calls| T14
  S15["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T15["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  S15 -->|calls| T15
  S16["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T16["method:JobsTimer::startDisplayLink<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:380"]
  S16 -->|calls| T16
  S17["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  T17["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  S17 -->|calls| T17
  S18["method:JobsTimer::fireOnce<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:194"]
  T18["method:JobsTimer::fireOnce<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:194"]
  S18 -->|calls| T18
  S19["method:JobsTimer::fireOnce<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:194"]
  T19["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S19 -->|calls| T19
  S20["method:JobsTimer::fireOnce<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:194"]
  T20["method:JobsTimer::stopInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:249"]
  S20 -->|calls| T20
  S21["method:JobsTimer::fireOnce<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:194"]
  T21["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S21 -->|calls| T21
  S22["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  T22["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S22 -->|calls| T22
  S23["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  T23["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S23 -->|calls| T23
  S24["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  T24["method:JobsTimer::stopInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:249"]
  S24 -->|calls| T24
  S25["method:JobsTimer::onTick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:237"]
  T25["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

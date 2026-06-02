# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTimer::fireOnce<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:194"]
  T1["method:JobsTimer::fireOnce<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:194"]
  S1 -->|calls| T1
  S2["method:JobsTimer::fireOnce<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:194"]
  T2["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S2 -->|calls| T2
  S3["method:JobsTimer::fireOnce<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:194"]
  T3["method:JobsTimer::stopInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:249"]
  S3 -->|calls| T3
  S4["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  T4["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S4 -->|calls| T4
  S5["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  T5["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S5 -->|calls| T5
  S6["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  T6["method:JobsTimer::stopInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:249"]
  S6 -->|calls| T6
  S7["method:JobsTimer::onTick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:237"]
  T7["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S7 -->|calls| T7
  S8["method:JobsTimer::onFinish<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:243"]
  T8["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S8 -->|calls| T8
  S9["method:JobsTimer::stopInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:249"]
  T9["method:JobsTimer::stopGCDSafely<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:353"]
  S9 -->|calls| T9
  S10["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:267"]
  T10["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S10 -->|calls| T10
  S11["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:267"]
  T11["method:JobsTimer::stopInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:249"]
  S11 -->|calls| T11
  S12["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:267"]
  T12["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S12 -->|calls| T12
  S13["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:267"]
  T13["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S13 -->|calls| T13
  S14["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  T14["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S14 -->|calls| T14
  S15["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  T15["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:267"]
  S15 -->|calls| T15
  S16["method:JobsTimer::startGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:318"]
  T16["method:JobsTimer::stopGCDSafely<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:353"]
  S16 -->|calls| T16
  S17["method:JobsTimer::startGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:318"]
  T17["method:UnityWebRequestUploadStream::scheduleInRunLoop:forMode:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:345"]
  S17 -->|calls| T17
  S18["method:JobsTimer::startGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:318"]
  T18["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  S18 -->|calls| T18
  S19["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  T19["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S19 -->|calls| T19
  S20["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  T20["method:JobsTimer::requireMainRunLoopForNonGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:80"]
  S20 -->|calls| T20
  S21["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  T21["function:Timer<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/icalls/mscorlib/System.Threading/Timer.h:13"]
  S21 -->|calls| T21
  S22["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  T22["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  S22 -->|calls| T22
  S23["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  T23["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S23 -->|calls| T23
  S24["method:JobsTimer::startDisplayLink<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:380"]
  T24["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S24 -->|calls| T24
  S25["method:JobsTimer::startDisplayLink<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:380"]
  T25["method:JobsTimer::requireMainRunLoopForNonGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:80"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

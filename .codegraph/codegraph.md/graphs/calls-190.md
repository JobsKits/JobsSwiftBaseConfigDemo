# `calls 符号关系 - 190`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTimer::onFinish<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:243"]
  T1["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S1 -->|calls| T1
  S2["method:JobsTimer::stopInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:249"]
  T2["method:JobsTimer::stopGCDSafely<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:353"]
  S2 -->|calls| T2
  S3["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:267"]
  T3["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S3 -->|calls| T3
  S4["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:267"]
  T4["method:JobsTimer::stopInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:249"]
  S4 -->|calls| T4
  S5["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:267"]
  T5["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S5 -->|calls| T5
  S6["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:267"]
  T6["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S6 -->|calls| T6
  S7["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  T7["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S7 -->|calls| T7
  S8["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  T8["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:267"]
  S8 -->|calls| T8
  S9["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  T9["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S9 -->|calls| T9
  S10["method:JobsTimer::startGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:318"]
  T10["method:JobsTimer::stopGCDSafely<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:353"]
  S10 -->|calls| T10
  S11["method:JobsTimer::startGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:318"]
  T11["method:UnityWebRequestUploadStream::scheduleInRunLoop:forMode:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:345"]
  S11 -->|calls| T11
  S12["method:JobsTimer::startGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:318"]
  T12["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  S12 -->|calls| T12
  S13["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  T13["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S13 -->|calls| T13
  S14["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  T14["method:JobsTimer::requireMainRunLoopForNonGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:80"]
  S14 -->|calls| T14
  S15["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  T15["function:Timer<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/icalls/mscorlib/System.Threading/Timer.h:13"]
  S15 -->|calls| T15
  S16["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  T16["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  S16 -->|calls| T16
  S17["method:JobsTimer::startFoundationTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:368"]
  T17["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S17 -->|calls| T17
  S18["method:JobsTimer::startDisplayLink<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:380"]
  T18["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S18 -->|calls| T18
  S19["method:JobsTimer::startDisplayLink<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:380"]
  T19["method:JobsTimer::requireMainRunLoopForNonGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:80"]
  S19 -->|calls| T19
  S20["method:JobsTimer::startDisplayLink<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:380"]
  T20["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  S20 -->|calls| T20
  S21["method:JobsTimer::DisplayLinkProxy::tick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:398"]
  T21["method:JobsTimer::onTick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:237"]
  S21 -->|calls| T21
  S22["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T22["method:JobsTimer::requireMainThreadForRunLoopAPI<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:72"]
  S22 -->|calls| T22
  S23["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T23["method:JobsTimer::requireMainRunLoopForNonGCD<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:80"]
  S23 -->|calls| T23
  S24["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T24["method:JobsUnfairLock::jobs_withLock<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:21"]
  S24 -->|calls| T24
  S25["method:JobsTimer::startRunLoopTimer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:401"]
  T25["method:JobsTimer::fireTickIfValid<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:290"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

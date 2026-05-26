# `calls 符号关系 - 175`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  T1["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S1 -->|calls| T1
  S2["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  T2["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S2 -->|calls| T2
  S3["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  T3["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S3 -->|calls| T3
  S4["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  T4["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S4 -->|calls| T4
  S5["function:fromBool<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:376"]
  T5["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S5 -->|calls| T5
  S6["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T6["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S6 -->|calls| T6
  S7["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T7["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S7 -->|calls| T7
  S8["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T8["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S8 -->|calls| T8
  S9["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T9["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S9 -->|calls| T9
  S10["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T10["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S10 -->|calls| T10
  S11["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T11["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S11 -->|calls| T11
  S12["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T12["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S12 -->|calls| T12
  S13["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T13["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S13 -->|calls| T13
  S14["function:currentNetworkBytes<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:109"]
  T14["function:currentNetworkBytesSplit<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:56"]
  S14 -->|calls| T14
  S15["class:JobsNetworkTrafficMonitor<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:116"]
  T15["method:JobsNetworkTrafficMonitor::start<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:154"]
  S15 -->|calls| T15
  S16["method:JobsNetworkTrafficMonitor::start<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:154"]
  T16["method:JobsNetworkTrafficMonitor::stop<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:187"]
  S16 -->|calls| T16
  S17["method:JobsNetworkTrafficMonitor::start<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:154"]
  T17["function:currentNetworkBytes<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:109"]
  S17 -->|calls| T17
  S18["method:JobsNetworkTrafficMonitor::start<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:154"]
  T18["method:UnityWebRequestUploadStream::scheduleInRunLoop:forMode:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:345"]
  S18 -->|calls| T18
  S19["method:JobsNetworkTrafficMonitor::start<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:154"]
  T19["function:currentNetworkBytes<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:109"]
  S19 -->|calls| T19
  S20["method:JobsNetworkTrafficMonitor::start<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:154"]
  T20["function:currentNetworkBytes<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:109"]
  S20 -->|calls| T20
  S21["method:JobsNetworkTrafficMonitor::stop<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:187"]
  T21["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  S21 -->|calls| T21
  S22["method:JobsNetworkTrafficMonitor::byStart<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:201"]
  T22["method:JobsNetworkTrafficMonitor::start<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:154"]
  S22 -->|calls| T22
  S23["function:currentNetworkSource<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:253"]
  T23["method:JobsNetworkTrafficMonitor::byStart<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:201"]
  S23 -->|calls| T23
  S24["function:currentNetworkSource<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:253"]
  T24["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S24 -->|calls| T24
  S25["method:JobsNetworkDataReadyMonitor::waitOnce<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:302"]
  T25["method:JobsNetworkDataReadyMonitor::stopLocked<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:403"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

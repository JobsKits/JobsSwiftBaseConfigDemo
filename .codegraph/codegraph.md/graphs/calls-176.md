# `calls 符号关系 - 176`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsNetworkDataReadyMonitor::waitOnce<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:302"]
  T1["function:currentNetworkBytesSplit<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:56"]
  S1 -->|calls| T1
  S2["method:JobsNetworkDataReadyMonitor::waitOnce<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:302"]
  T2["method:UnityWebRequestUploadStream::scheduleInRunLoop:forMode:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:345"]
  S2 -->|calls| T2
  S3["method:JobsNetworkDataReadyMonitor::waitOnce<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:302"]
  T3["function:currentNetworkBytesSplit<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:56"]
  S3 -->|calls| T3
  S4["method:JobsNetworkDataReadyMonitor::waitOnce<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:302"]
  T4["method:JobsNetworkDataReadyMonitor::stopLocked<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:403"]
  S4 -->|calls| T4
  S5["method:JobsNetworkDataReadyMonitor::waitOnce<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:302"]
  T5["method:JobsNetworkDataReadyMonitor::stopLocked<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:403"]
  S5 -->|calls| T5
  S6["method:JobsNetworkDataReadyMonitor::cancel<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:397"]
  T6["method:JobsNetworkDataReadyMonitor::stopLocked<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:403"]
  S6 -->|calls| T6
  S7["method:JobsNetworkDataReadyMonitor::stopLocked<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:403"]
  T7["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:163"]
  S7 -->|calls| T7
  S8["function:JobsCancelWaitNetworkDataReady<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:417"]
  T8["method:JobsNetworkDataReadyMonitor::cancel<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:397"]
  S8 -->|calls| T8
  S9["function:JobsNetworkTrafficMonitorStop<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:421"]
  T9["method:JobsNetworkTrafficMonitor::stop<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:187"]
  S9 -->|calls| T9
  S10["method:JobsNetworkDataReadyMonitor::byWaitOnce<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:426"]
  T10["method:JobsNetworkDataReadyMonitor::waitOnce<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:302"]
  S10 -->|calls| T10
  S11["function:jobsWaitNetworkDataReady<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:462"]
  T11["method:JobsNetworkDataReadyMonitor::byWaitOnce<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:426"]
  S11 -->|calls| T11
  S12["method:JobsCallbackable::jobsBySelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:42"]
  T12["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:28"]
  S12 -->|calls| T12
  S13["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:53"]
  T13["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S13 -->|calls| T13
  S14["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:58"]
  T14["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S14 -->|calls| T14
  S15["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:63"]
  T15["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S15 -->|calls| T15
  S16["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:68"]
  T16["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S16 -->|calls| T16
  S17["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:73"]
  T17["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S17 -->|calls| T17
  S18["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:78"]
  T18["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S18 -->|calls| T18
  S19["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  T19["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S19 -->|calls| T19
  S20["method:JobsCallbackable::jobsCallOptional<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:88"]
  T20["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S20 -->|calls| T20
  S21["method:JobsCallbackable::jobsCallOptional<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:93"]
  T21["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S21 -->|calls| T21
  S22["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:103"]
  T22["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S22 -->|calls| T22
  S23["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:103"]
  T23["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S23 -->|calls| T23
  S24["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:107"]
  T24["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S24 -->|calls| T24
  S25["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:107"]
  T25["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

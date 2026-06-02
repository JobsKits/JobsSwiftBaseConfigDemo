# `calls 符号关系 - 063`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CrashCatcher::installOnce<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:214"]
  T1["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  S1 -->|calls| T1
  S2["method:CrashCatcher::installOnce<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:214"]
  T2["function:jobs_installSignalHandlers<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:291"]
  S2 -->|calls| T2
  S3["method:CrashCatcher::installOnce<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:214"]
  T3["function:jobs_installTerminateHandler<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:281"]
  S3 -->|calls| T3
  S4["method:CrashCatcher::installOnce<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:214"]
  T4["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  S4 -->|calls| T4
  S5["method:CrashCatcher::installOnce<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:214"]
  T5["method:CrashLogCenter::installedBanner<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:192"]
  S5 -->|calls| T5
  S6["method:CrashCatcher::handleSignal<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:246"]
  T6["function:jobs_signalName<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:300"]
  S6 -->|calls| T6
  S7["method:CrashCatcher::handleSignal<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:246"]
  T7["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  S7 -->|calls| T7
  S8["method:CrashCatcher::handleTerminate<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:261"]
  T8["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  S8 -->|calls| T8
  S9["function:jobs_terminate_handler<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:276"]
  T9["method:CrashCatcher::handleTerminate<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:261"]
  S9 -->|calls| T9
  S10["function:jobs_signal_handler<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:287"]
  T10["method:CrashCatcher::handleSignal<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:246"]
  S10 -->|calls| T10
  S11["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T11["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S11 -->|calls| T11
  S12["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T12["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S12 -->|calls| T12
  S13["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T13["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S13 -->|calls| T13
  S14["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T14["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S14 -->|calls| T14
  S15["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T15["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S15 -->|calls| T15
  S16["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T16["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S16 -->|calls| T16
  S17["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T17["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S17 -->|calls| T17
  S18["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T18["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S18 -->|calls| T18
  S19["method:JobsLog::log<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:160"]
  T19["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  S19 -->|calls| T19
  S20["method:JobsLog::log<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:160"]
  T20["method:JobsLog::timeNow<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:207"]
  S20 -->|calls| T20
  S21["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T21["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S21 -->|calls| T21
  S22["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T22["method:JobsLog::toJSONString<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:272"]
  S22 -->|calls| T22
  S23["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T23["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S23 -->|calls| T23
  S24["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T24["method:JobsLog::toJSONStringFromObject<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:313"]
  S24 -->|calls| T24
  S25["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T25["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

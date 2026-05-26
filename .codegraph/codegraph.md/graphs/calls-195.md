# `calls 符号关系 - 195`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T1["method:JobsLog::decodeUnicodeEscapes<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:259"]
  S1 -->|calls| T1
  S2["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T2["method:JobsLog::decodeUnicodeEscapes<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:259"]
  S2 -->|calls| T2
  S3["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T3["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S3 -->|calls| T3
  S4["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T4["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S4 -->|calls| T4
  S5["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T5["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S5 -->|calls| T5
  S6["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T6["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S6 -->|calls| T6
  S7["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T7["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S7 -->|calls| T7
  S8["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T8["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S8 -->|calls| T8
  S9["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T9["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S9 -->|calls| T9
  S10["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T10["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S10 -->|calls| T10
  S11["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T11["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S11 -->|calls| T11
  S12["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T12["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S12 -->|calls| T12
  S13["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T13["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S13 -->|calls| T13
  S14["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T14["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S14 -->|calls| T14
  S15["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T15["method:JobsLog::decodeUnicodeEscapes<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:259"]
  S15 -->|calls| T15
  S16["method:JobsLog::toJSONString<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:272"]
  T16["method:JobsLog::decodeUnicodeEscapes<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:259"]
  S16 -->|calls| T16
  S17["method:JobsLog::toJSONString<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:272"]
  T17["method:JobsLog::decodeUnicodeEscapes<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:259"]
  S17 -->|calls| T17
  S18["method:JobsLog::tryJSONFromContainers<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:295"]
  T18["method:JobsLog::decodeUnicodeEscapes<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:259"]
  S18 -->|calls| T18
  S19["method:JobsLog::tryJSONFromContainers<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:295"]
  T19["method:JobsLog::decodeUnicodeEscapes<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:259"]
  S19 -->|calls| T19
  S20["method:JobsLog::toJSONStringFromObject<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:313"]
  T20["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S20 -->|calls| T20
  S21["method:JobsLog::toJSONStringFromObject<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:313"]
  T21["method:JobsLog::decodeUnicodeEscapes<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:259"]
  S21 -->|calls| T21
  S22["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T22["method:JobsLog::unwrapOptional<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:324"]
  S22 -->|calls| T22
  S23["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T23["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S23 -->|calls| T23
  S24["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T24["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S24 -->|calls| T24
  S25["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T25["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

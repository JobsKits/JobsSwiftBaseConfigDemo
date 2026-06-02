# `calls 符号关系 - 047`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T1["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  S1 -->|calls| T1
  S2["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T2["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S2 -->|calls| T2
  S3["function:fromInt<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:308"]
  T3["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S3 -->|calls| T3
  S4["function:fromInt<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:308"]
  T4["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S4 -->|calls| T4
  S5["function:fromInt<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:308"]
  T5["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S5 -->|calls| T5
  S6["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  T6["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S6 -->|calls| T6
  S7["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  T7["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S7 -->|calls| T7
  S8["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  T8["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S8 -->|calls| T8
  S9["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  T9["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S9 -->|calls| T9
  S10["function:fromBool<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:376"]
  T10["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S10 -->|calls| T10
  S11["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T11["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S11 -->|calls| T11
  S12["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T12["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S12 -->|calls| T12
  S13["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T13["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S13 -->|calls| T13
  S14["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T14["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S14 -->|calls| T14
  S15["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T15["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S15 -->|calls| T15
  S16["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T16["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S16 -->|calls| T16
  S17["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T17["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S17 -->|calls| T17
  S18["method:TextFormatStrategy::apply<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:36"]
  T18["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S18 -->|calls| T18
  S19["method:JobsCallbackable::jobsBySelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:42"]
  T19["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:28"]
  S19 -->|calls| T19
  S20["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:53"]
  T20["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S20 -->|calls| T20
  S21["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:58"]
  T21["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S21 -->|calls| T21
  S22["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:63"]
  T22["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S22 -->|calls| T22
  S23["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:68"]
  T23["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S23 -->|calls| T23
  S24["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:73"]
  T24["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S24 -->|calls| T24
  S25["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:78"]
  T25["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

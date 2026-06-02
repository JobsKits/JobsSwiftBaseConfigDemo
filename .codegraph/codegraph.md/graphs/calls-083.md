# `calls 符号关系 - 083`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:312"]
  T1["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S1 -->|calls| T1
  S2["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:312"]
  T2["method:Period::asDateComponents<br/>TODO/TaskCenterComponent/Schedule/Period.swift:190"]
  S2 -->|calls| T2
  S3["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:334"]
  T3["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  S3 -->|calls| T3
  S4["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:353"]
  T4["method:Plan::isNever<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:492"]
  S4 -->|calls| T4
  S5["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:353"]
  T5["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S5 -->|calls| T5
  S6["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:353"]
  T6["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S6 -->|calls| T6
  S7["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:372"]
  T7["method:Plan::isNever<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:492"]
  S7 -->|calls| T7
  S8["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:372"]
  T8["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:372"]
  S8 -->|calls| T8
  S9["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:386"]
  T9["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:386"]
  S9 -->|calls| T9
  S10["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:396"]
  T10["method:Plan::isNever<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:492"]
  S10 -->|calls| T10
  S11["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:396"]
  T11["method:SnowflakeSwift::time<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:81"]
  S11 -->|calls| T11
  S12["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:396"]
  T12["method:SnowflakeSwift::time<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:81"]
  S12 -->|calls| T12
  S13["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:396"]
  T13["method:SnowflakeSwift::time<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:81"]
  S13 -->|calls| T13
  S14["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:396"]
  T14["method:SnowflakeSwift::time<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:81"]
  S14 -->|calls| T14
  S15["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:396"]
  T15["method:Plan::DateMiddleware::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:396"]
  S15 -->|calls| T15
  S16["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:417"]
  T16["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S16 -->|calls| T16
  S17["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:417"]
  T17["method:Weekday::asDateComponents<br/>TODO/TaskCenterComponent/Schedule/Weekday.swift:18"]
  S17 -->|calls| T17
  S18["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:437"]
  T18["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  S18 -->|calls| T18
  S19["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:442"]
  T19["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:442"]
  S19 -->|calls| T19
  S20["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:442"]
  T20["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S20 -->|calls| T20
  S21["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:442"]
  T21["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S21 -->|calls| T21
  S22["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:442"]
  T22["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  S22 -->|calls| T22
  S23["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:453"]
  T23["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S23 -->|calls| T23
  S24["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:453"]
  T24["method:Monthday::asDateComponents<br/>TODO/TaskCenterComponent/Schedule/Monthday.swift:40"]
  S24 -->|calls| T24
  S25["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:473"]
  T25["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

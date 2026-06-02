# `calls 符号关系 - 082`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:Plan::of<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:151"]
  T1["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S1 -->|calls| T1
  S2["class:Plan<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:100"]
  T2["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S2 -->|calls| T2
  S3["class:Plan<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:100"]
  T3["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S3 -->|calls| T3
  S4["class:Plan<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:171"]
  T4["method:Plan::of<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:88"]
  S4 -->|calls| T4
  S5["class:Plan<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:171"]
  T5["method:Plan::of<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:88"]
  S5 -->|calls| T5
  S6["class:Plan<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:171"]
  T6["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S6 -->|calls| T6
  S7["method:Plan::concat<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:203"]
  T7["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S7 -->|calls| T7
  S8["method:Plan::concat<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:203"]
  T8["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S8 -->|calls| T8
  S9["method:Plan::concat<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:203"]
  T9["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S9 -->|calls| T9
  S10["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  T10["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S10 -->|calls| T10
  S11["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  T11["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S11 -->|calls| T11
  S12["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  T12["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S12 -->|calls| T12
  S13["method:Plan::first<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:259"]
  T13["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S13 -->|calls| T13
  S14["method:Plan::first<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:259"]
  T14["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S14 -->|calls| T14
  S15["method:Plan::first<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:259"]
  T15["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S15 -->|calls| T15
  S16["method:Plan::until<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:272"]
  T16["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S16 -->|calls| T16
  S17["method:Plan::until<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:272"]
  T17["method:Plan::makeIterator<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:24"]
  S17 -->|calls| T17
  S18["method:Plan::until<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:272"]
  T18["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S18 -->|calls| T18
  S19["class:Plan<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:191"]
  T19["method:Plan::of<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:88"]
  S19 -->|calls| T19
  S20["method:Plan::after<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:290"]
  T20["method:Plan::of<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:88"]
  S20 -->|calls| T20
  S21["method:Plan::after<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:295"]
  T21["method:Plan::concat<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:203"]
  S21 -->|calls| T21
  S22["method:Plan::after<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:295"]
  T22["method:Plan::after<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:290"]
  S22 -->|calls| T22
  S23["method:Plan::after<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:295"]
  T23["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  S23 -->|calls| T23
  S24["method:Plan::at<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:300"]
  T24["method:Plan::of<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:88"]
  S24 -->|calls| T24
  S25["method:Plan::every<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:305"]
  T25["method:Plan::make<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:79"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

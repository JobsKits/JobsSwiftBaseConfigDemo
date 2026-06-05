# `calls 符号关系 - 022`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  T1["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S1 -->|calls| T1
  S2["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  T2["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  S2 -->|calls| T2
  S3["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  T3["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S3 -->|calls| T3
  S4["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  T4["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S4 -->|calls| T4
  S5["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  T5["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S5 -->|calls| T5
  S6["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  T6["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S6 -->|calls| T6
  S7["method:TaskCenter::addTag<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:82"]
  T7["method:TaskCenter::addTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:89"]
  S7 -->|calls| T7
  S8["method:TaskCenter::addTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:89"]
  T8["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S8 -->|calls| T8
  S9["method:TaskCenter::addTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:89"]
  T9["method:JobsWorkerBag::insert<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:69"]
  S9 -->|calls| T9
  S10["method:TaskCenter::addTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:89"]
  T10["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S10 -->|calls| T10
  S11["method:TaskCenter::addTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:89"]
  T11["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S11 -->|calls| T11
  S12["method:TaskCenter::addTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:89"]
  T12["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S12 -->|calls| T12
  S13["method:TaskCenter::addTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:89"]
  T13["method:JobsWorkerBag::insert<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:69"]
  S13 -->|calls| T13
  S14["method:TaskCenter::addTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:89"]
  T14["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S14 -->|calls| T14
  S15["method:TaskCenter::removeTag<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:107"]
  T15["method:TaskCenter::removeTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:114"]
  S15 -->|calls| T15
  S16["method:TaskCenter::removeTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:114"]
  T16["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S16 -->|calls| T16
  S17["method:TaskCenter::removeTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:114"]
  T17["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  S17 -->|calls| T17
  S18["method:TaskCenter::removeTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:114"]
  T18["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S18 -->|calls| T18
  S19["method:TaskCenter::removeTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:114"]
  T19["method:TaskCenter::remove<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:62"]
  S19 -->|calls| T19
  S20["method:TaskCenter::removeTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:114"]
  T20["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S20 -->|calls| T20
  S21["method:TaskCenter::removeTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:114"]
  T21["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S21 -->|calls| T21
  S22["method:TaskCenter::removeTags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:114"]
  T22["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S22 -->|calls| T22
  S23["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  T23["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S23 -->|calls| T23
  S24["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  T24["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S24 -->|calls| T24
  S25["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  T25["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

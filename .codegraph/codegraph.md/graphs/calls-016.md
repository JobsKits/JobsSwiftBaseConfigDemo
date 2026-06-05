# `calls 符号关系 - 016`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsSwiftTimerCountdown::reset<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:171"]
  T1["method:JobsSwiftTimerCountdown::resetInternal<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:176"]
  S1 -->|calls| T1
  S2["method:JobsSwiftTimerCountdown::byStartRunning<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:197"]
  T2["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:112"]
  S2 -->|calls| T2
  S3["method:JobsSwiftTimerManager::create<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:33"]
  T3["method:JobsSwiftTimerManager::remove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:101"]
  S3 -->|calls| T3
  S4["method:JobsSwiftTimerManager::create<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:33"]
  T4["method:JobsSwiftTimerManager::register<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:134"]
  S4 -->|calls| T4
  S5["method:JobsSwiftTimerManager::act<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:87"]
  T5["method:JobsSwiftTimerManager::timer<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:81"]
  S5 -->|calls| T5
  S6["method:JobsSwiftTimerManager::act<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:87"]
  T6["method:JobsSwiftTimerManager::remove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:101"]
  S6 -->|calls| T6
  S7["method:JobsSwiftTimerManager::stopAndRemove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:121"]
  T7["method:JobsSwiftTimerManager::act<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:87"]
  S7 -->|calls| T7
  S8["method:JobsSwiftTimerManager::stopAndRemove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:129"]
  T8["method:JobsSwiftTimerManager::stopAndRemove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:129"]
  S8 -->|calls| T8
  S9["method:JobsObservable::combineLatest<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Combine.swift:12"]
  T9["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S9 -->|calls| T9
  S10["method:JobsObservable::combineLatest<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Combine.swift:12"]
  T10["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S10 -->|calls| T10
  S11["method:JobsObservable::map<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:12"]
  T11["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S11 -->|calls| T11
  S12["method:JobsObservable::map<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:12"]
  T12["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S12 -->|calls| T12
  S13["method:JobsObservable::filter<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:21"]
  T13["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S13 -->|calls| T13
  S14["method:JobsObservable::filter<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:21"]
  T14["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S14 -->|calls| T14
  S15["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:32"]
  T15["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S15 -->|calls| T15
  S16["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:32"]
  T16["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S16 -->|calls| T16
  S17["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:44"]
  T17["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:44"]
  S17 -->|calls| T17
  S18["method:JobsValueListenable::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:13"]
  T18["method:JobsWorkerFactory::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:13"]
  S18 -->|calls| T18
  S19["method:JobsValueListenable::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:25"]
  T19["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  S19 -->|calls| T19
  S20["method:JobsValueListenable::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:37"]
  T20["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  S20 -->|calls| T20
  S21["method:JobsValueListenable::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:53"]
  T21["method:JobsWorkerFactory::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:81"]
  S21 -->|calls| T21
  S22["method:JobsValueListenable::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:67"]
  T22["method:JobsWorkerFactory::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:111"]
  S22 -->|calls| T22
  S23["method:JobsValueListenable::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:79"]
  T23["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  S23 -->|calls| T23
  S24["method:Array::everAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:93"]
  T24["method:JobsWorkerFactory::everAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:176"]
  S24 -->|calls| T24
  S25["class:JobsObservable<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:11"]
  T25["method:JobsObservable::_setValue<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:101"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

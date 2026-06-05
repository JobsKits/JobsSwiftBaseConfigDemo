# `calls 符号关系 - 017`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsObservable::acceptSilently<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:63"]
  T1["method:JobsObservable::_setValue<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:101"]
  S1 -->|calls| T1
  S2["method:JobsObservable::observeAny<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:124"]
  T2["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S2 -->|calls| T2
  S3["class:JobsWorker<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:11"]
  T3["method:JobsWorker::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:38"]
  S3 -->|calls| T3
  S4["class:JobsWorkerBag<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:57"]
  T4["method:JobsWorkerBag::removeAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:75"]
  S4 -->|calls| T4
  S5["method:JobsWorkerDisposable::store<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:90"]
  T5["method:JobsWorkerBag::insert<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:69"]
  S5 -->|calls| T5
  S6["method:JobsWorkerFactory::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:13"]
  T6["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S6 -->|calls| T6
  S7["method:JobsWorkerFactory::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:13"]
  T7["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S7 -->|calls| T7
  S8["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T8["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S8 -->|calls| T8
  S9["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T9["method:JobsWorker::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:38"]
  S9 -->|calls| T9
  S10["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T10["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S10 -->|calls| T10
  S11["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T11["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S11 -->|calls| T11
  S12["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  T12["method:JobsWorkerScheduler::schedule<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:21"]
  S12 -->|calls| T12
  S13["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  T13["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S13 -->|calls| T13
  S14["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  T14["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S14 -->|calls| T14
  S15["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  T15["method:JobsWorkerScheduler::cancel<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:51"]
  S15 -->|calls| T15
  S16["method:JobsWorkerFactory::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:81"]
  T16["method:NSLock::jobs_sync<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:199"]
  S16 -->|calls| T16
  S17["method:JobsWorkerFactory::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:81"]
  T17["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S17 -->|calls| T17
  S18["method:JobsWorkerFactory::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:81"]
  T18["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S18 -->|calls| T18
  S19["method:JobsWorkerFactory::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:111"]
  T19["method:NSLock::jobs_sync<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:199"]
  S19 -->|calls| T19
  S20["method:JobsWorkerFactory::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:111"]
  T20["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S20 -->|calls| T20
  S21["method:JobsWorkerFactory::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:111"]
  T21["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S21 -->|calls| T21
  S22["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T22["method:JobsWorker::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:38"]
  S22 -->|calls| T22
  S23["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T23["method:NSLock::jobs_sync<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:199"]
  S23 -->|calls| T23
  S24["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T24["method:NSLock::jobs_sync<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:199"]
  S24 -->|calls| T24
  S25["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T25["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

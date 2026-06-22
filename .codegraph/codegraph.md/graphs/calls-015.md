# `calls 符号关系 - 015`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsObservable::map<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:12"]
  T1["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S1 -->|calls| T1
  S2["method:JobsObservable::filter<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:21"]
  T2["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S2 -->|calls| T2
  S3["method:JobsObservable::filter<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:21"]
  T3["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S3 -->|calls| T3
  S4["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:32"]
  T4["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S4 -->|calls| T4
  S5["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:32"]
  T5["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S5 -->|calls| T5
  S6["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:44"]
  T6["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:44"]
  S6 -->|calls| T6
  S7["method:JobsValueListenable::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:13"]
  T7["method:JobsWorkerFactory::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:13"]
  S7 -->|calls| T7
  S8["method:JobsValueListenable::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:25"]
  T8["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  S8 -->|calls| T8
  S9["method:JobsValueListenable::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:37"]
  T9["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  S9 -->|calls| T9
  S10["method:JobsValueListenable::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:53"]
  T10["method:JobsWorkerFactory::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:81"]
  S10 -->|calls| T10
  S11["method:JobsValueListenable::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:67"]
  T11["method:JobsWorkerFactory::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:111"]
  S11 -->|calls| T11
  S12["method:JobsValueListenable::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:79"]
  T12["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  S12 -->|calls| T12
  S13["method:Array::everAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:93"]
  T13["method:JobsWorkerFactory::everAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:176"]
  S13 -->|calls| T13
  S14["class:JobsObservable<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:11"]
  T14["method:JobsObservable::_setValue<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:101"]
  S14 -->|calls| T14
  S15["method:JobsObservable::acceptSilently<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:63"]
  T15["method:JobsObservable::_setValue<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:101"]
  S15 -->|calls| T15
  S16["method:JobsObservable::observeAny<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:124"]
  T16["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S16 -->|calls| T16
  S17["class:JobsWorker<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:11"]
  T17["method:JobsWorker::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:38"]
  S17 -->|calls| T17
  S18["class:JobsWorkerBag<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:57"]
  T18["method:JobsWorkerBag::removeAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:75"]
  S18 -->|calls| T18
  S19["method:JobsWorkerDisposable::store<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:90"]
  T19["method:JobsWorkerBag::insert<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:69"]
  S19 -->|calls| T19
  S20["method:JobsWorkerFactory::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:13"]
  T20["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S20 -->|calls| T20
  S21["method:JobsWorkerFactory::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:13"]
  T21["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S21 -->|calls| T21
  S22["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T22["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S22 -->|calls| T22
  S23["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T23["method:JobsWorker::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:38"]
  S23 -->|calls| T23
  S24["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T24["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S24 -->|calls| T24
  S25["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T25["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

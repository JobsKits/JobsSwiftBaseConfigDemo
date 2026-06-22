# `calls 符号关系 - 016`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  T1["method:JobsWorkerScheduler::schedule<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:21"]
  S1 -->|calls| T1
  S2["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  T2["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S2 -->|calls| T2
  S3["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  T3["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S3 -->|calls| T3
  S4["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  T4["method:JobsWorkerScheduler::cancel<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:51"]
  S4 -->|calls| T4
  S5["method:JobsWorkerFactory::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:81"]
  T5["method:NSLock::jobs_sync<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:199"]
  S5 -->|calls| T5
  S6["method:JobsWorkerFactory::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:81"]
  T6["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S6 -->|calls| T6
  S7["method:JobsWorkerFactory::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:81"]
  T7["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S7 -->|calls| T7
  S8["method:JobsWorkerFactory::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:111"]
  T8["method:NSLock::jobs_sync<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:199"]
  S8 -->|calls| T8
  S9["method:JobsWorkerFactory::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:111"]
  T9["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S9 -->|calls| T9
  S10["method:JobsWorkerFactory::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:111"]
  T10["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S10 -->|calls| T10
  S11["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T11["method:JobsWorker::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:38"]
  S11 -->|calls| T11
  S12["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T12["method:NSLock::jobs_sync<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:199"]
  S12 -->|calls| T12
  S13["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T13["method:NSLock::jobs_sync<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:199"]
  S13 -->|calls| T13
  S14["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T14["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S14 -->|calls| T14
  S15["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T15["method:JobsWorker::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:38"]
  S15 -->|calls| T15
  S16["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T16["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S16 -->|calls| T16
  S17["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  T17["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S17 -->|calls| T17
  S18["method:JobsWorkerFactory::everAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:176"]
  T18["method:JobsObservable::observeAny<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:124"]
  S18 -->|calls| T18
  S19["method:JobsWorkerFactory::everAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:176"]
  T19["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S19 -->|calls| T19
  S20["method:JobsWorkerFactory::everAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:176"]
  T20["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S20 -->|calls| T20
  S21["method:JobsWorkerScheduler::schedule<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:21"]
  T21["method:JobsWorkerScheduler::cancel<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:51"]
  S21 -->|calls| T21
  S22["method:JobsWorkerScheduler::scheduleRepeating<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:36"]
  T22["method:JobsWorkerScheduler::cancel<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:51"]
  S22 -->|calls| T22
  S23["class:String<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:11"]
  T23["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  S23 -->|calls| T23
  S24["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T24["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S24 -->|calls| T24
  S25["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T25["function:String::normalizeToSupportedLproj::pick<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:53"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

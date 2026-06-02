# `calls 符号关系 - 068`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityManager::setupAutoCloseTimer<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:141"]
  T1["method:UnityManager::unloadUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:133"]
  S1 -->|calls| T1
  S2["method:UnityManager::setupAutoCloseTimer<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:141"]
  T2["method:UnityManager::hideUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:123"]
  S2 -->|calls| T2
  S3["method:UnityManager::setupAutoCloseTimer<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:141"]
  T3["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  S3 -->|calls| T3
  S4["method:UnityManager::attachUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:173"]
  T4["method:UnityManager::showUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:221"]
  S4 -->|calls| T4
  S5["method:UnityManager::detachUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:182"]
  T5["method:UnityManager::unloadUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:230"]
  S5 -->|calls| T5
  S6["method:UnityManager::detachUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:182"]
  T6["method:UnityManager::hideUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:229"]
  S6 -->|calls| T6
  S7["method:UnityManager::unityDidUnload<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:196"]
  T7["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S7 -->|calls| T7
  S8["method:JobsObservable::combineLatest<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Combine.swift:12"]
  T8["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S8 -->|calls| T8
  S9["method:JobsObservable::combineLatest<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Combine.swift:12"]
  T9["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S9 -->|calls| T9
  S10["method:JobsObservable::map<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:12"]
  T10["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S10 -->|calls| T10
  S11["method:JobsObservable::map<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:12"]
  T11["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S11 -->|calls| T11
  S12["method:JobsObservable::filter<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:21"]
  T12["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S12 -->|calls| T12
  S13["method:JobsObservable::filter<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:21"]
  T13["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S13 -->|calls| T13
  S14["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:32"]
  T14["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S14 -->|calls| T14
  S15["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:32"]
  T15["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S15 -->|calls| T15
  S16["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:44"]
  T16["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:44"]
  S16 -->|calls| T16
  S17["method:JobsValueListenable::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:13"]
  T17["method:JobsWorkerFactory::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:13"]
  S17 -->|calls| T17
  S18["method:JobsValueListenable::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:25"]
  T18["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  S18 -->|calls| T18
  S19["method:JobsValueListenable::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:37"]
  T19["method:JobsWorkerFactory::debounce<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:56"]
  S19 -->|calls| T19
  S20["method:JobsValueListenable::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:53"]
  T20["method:JobsWorkerFactory::interval<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:81"]
  S20 -->|calls| T20
  S21["method:JobsValueListenable::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:67"]
  T21["method:JobsWorkerFactory::skip<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:111"]
  S21 -->|calls| T21
  S22["method:JobsValueListenable::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:79"]
  T22["method:JobsWorkerFactory::take<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:137"]
  S22 -->|calls| T22
  S23["method:Array::everAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Workers.swift:93"]
  T23["method:JobsWorkerFactory::everAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:176"]
  S23 -->|calls| T23
  S24["class:JobsObservable<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:11"]
  T24["method:JobsObservable::_setValue<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:101"]
  S24 -->|calls| T24
  S25["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  T25["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

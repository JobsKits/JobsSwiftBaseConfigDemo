# `calls 符号关系 - 069`

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
  S2["method:JobsObservable::mutate<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:69"]
  T2["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S2 -->|calls| T2
  S3["method:JobsObservable::notifyCurrentValue<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:89"]
  T3["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S3 -->|calls| T3
  S4["method:JobsObservable::_setValue<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:101"]
  T4["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S4 -->|calls| T4
  S5["method:JobsObservable::observeAny<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:124"]
  T5["method:JobsObservable::observe<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:42"]
  S5 -->|calls| T5
  S6["class:JobsWorker<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:11"]
  T6["method:JobsWorker::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:38"]
  S6 -->|calls| T6
  S7["method:JobsWorkerBag::removeAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:75"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S7 -->|calls| T7
  S8["class:JobsWorkerBag<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:57"]
  T8["method:JobsWorkerBag::removeAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:75"]
  S8 -->|calls| T8
  S9["method:JobsWorkerDisposable::store<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:90"]
  T9["method:JobsWorkerBag::insert<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:69"]
  S9 -->|calls| T9
  S10["method:JobsWorkerBinder::bindText<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:14"]
  T10["method:JobsWorkerDisposable::store<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:90"]
  S10 -->|calls| T10
  S11["method:JobsWorkerBinder::bindTextField<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:31"]
  T11["method:TextFieldTarget::inputChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:71"]
  S11 -->|calls| T11
  S12["method:JobsWorkerBinder::bindTextField<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:31"]
  T12["method:TextFieldTarget::register<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:56"]
  S12 -->|calls| T12
  S13["method:JobsWorkerBinder::bindTextField<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:31"]
  T13["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S13 -->|calls| T13
  S14["method:JobsWorkerBinder::bindTextField<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:31"]
  T14["method:TextFieldTarget::unregister<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:64"]
  S14 -->|calls| T14
  S15["method:TextFieldTarget::unregister<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:64"]
  T15["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S15 -->|calls| T15
  S16["method:TextFieldTarget::unregister<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:64"]
  T16["method:TextFieldTarget::inputChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:71"]
  S16 -->|calls| T16
  S17["method:TextFieldTarget::inputChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerBinder.swift:71"]
  T17["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:57"]
  S17 -->|calls| T17
  S18["method:JobsWorkerCenter::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerCenter.swift:31"]
  T18["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S18 -->|calls| T18
  S19["method:JobsWorkerCenter::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerCenter.swift:31"]
  T19["method:Bag::removeAll<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:84"]
  S19 -->|calls| T19
  S20["method:JobsWorkerCenter::disposeAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerCenter.swift:39"]
  T20["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S20 -->|calls| T20
  S21["method:JobsWorkerFactory::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:13"]
  T21["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S21 -->|calls| T21
  S22["method:JobsWorkerFactory::ever<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:13"]
  T22["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S22 -->|calls| T22
  S23["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T23["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S23 -->|calls| T23
  S24["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T24["method:JobsWorker::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:38"]
  S24 -->|calls| T24
  S25["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:31"]
  T25["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

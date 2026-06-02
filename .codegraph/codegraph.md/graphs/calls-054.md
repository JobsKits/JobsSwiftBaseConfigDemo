# `calls 符号关系 - 054`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTaskCenterComponent::createAsyncOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:391"]
  T1["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:116"]
  S1 -->|calls| T1
  S2["method:JobsTaskCenterComponent::waitForExecutions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:415"]
  T2["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  S2 -->|calls| T2
  S3["method:JobsTaskCenterComponent::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:420"]
  T3["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  S3 -->|calls| T3
  S4["method:JobsTaskCenterComponent::executions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:426"]
  T4["method:JobsTask::executions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:450"]
  S4 -->|calls| T4
  S5["method:JobsPlan::every<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:87"]
  T5["method:JobsPlan::make<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:83"]
  S5 -->|calls| T5
  S6["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:116"]
  T6["method:JobsPlan::make<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:83"]
  S6 -->|calls| T6
  S7["method:JobsPlan::at<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:129"]
  T7["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:116"]
  S7 -->|calls| T7
  S8["class:JobsPlan<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:81"]
  T8["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:116"]
  S8 -->|calls| T8
  S9["method:JobsPlan::concat<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:144"]
  T9["method:JobsPlan::make<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:83"]
  S9 -->|calls| T9
  S10["method:JobsPlan::concat<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:144"]
  T10["method:JobsPlan::makeIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:140"]
  S10 -->|calls| T10
  S11["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T11["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S11 -->|calls| T11
  S12["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T12["method:JobsTask::addLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:140"]
  S12 -->|calls| T12
  S13["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T13["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S13 -->|calls| T13
  S14["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T14["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S14 -->|calls| T14
  S15["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T15["method:JobsTaskManagerExecutionStream::makeAsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerExecutionStream.swift:26"]
  S15 -->|calls| T15
  S16["method:JobsTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:68"]
  T16["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S16 -->|calls| T16
  S17["method:JobsTaskExecutionSequence::collect<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:107"]
  T17["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S17 -->|calls| T17
  S18["class:JobsTaskItem<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskItem.swift:17"]
  T18["method:JobsPlan::every<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:87"]
  S18 -->|calls| T18
  S19["class:JobsTaskManager<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:17"]
  T19["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S19 -->|calls| T19
  S20["method:JobsTaskManager::mergedExecutions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:49"]
  T20["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S20 -->|calls| T20
  S21["method:JobsTaskManager::mergedExecutions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:49"]
  T21["method:JobsTask::executions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:450"]
  S21 -->|calls| T21
  S22["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  T22["method:JobsTaskManager::bindLifecycle<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:335"]
  S22 -->|calls| T22
  S23["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  T23["method:JobsTaskCenter::add<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:34"]
  S23 -->|calls| T23
  S24["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  T24["method:JobsTaskCenter::addTag<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:62"]
  S24 -->|calls| T24
  S25["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  T25["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

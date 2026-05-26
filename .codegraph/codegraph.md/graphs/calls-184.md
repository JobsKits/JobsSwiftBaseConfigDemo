# `calls 符号关系 - 184`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T1["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S1 -->|calls| T1
  S2["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T2["method:JobsTask::addLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:140"]
  S2 -->|calls| T2
  S3["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T3["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S3 -->|calls| T3
  S4["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T4["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S4 -->|calls| T4
  S5["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T5["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S5 -->|calls| T5
  S6["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T6["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S6 -->|calls| T6
  S7["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T7["method:JobsTaskManagerExecutionStream::makeAsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManagerExecutionStream.swift:26"]
  S7 -->|calls| T7
  S8["method:JobsTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:68"]
  T8["method:JobsDropFirstTaskExecutionSequence::AsyncIterator::next<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsDropFirstTaskExecutionSequence.swift:39"]
  S8 -->|calls| T8
  S9["method:JobsTaskExecutionSequence::collect<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:107"]
  T9["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S9 -->|calls| T9
  S10["class:JobsTaskItem<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskItem.swift:17"]
  T10["method:JobsPlan::every<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:87"]
  S10 -->|calls| T10
  S11["class:JobsTaskManager<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:17"]
  T11["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S11 -->|calls| T11
  S12["method:JobsTaskManager::mergedExecutions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:49"]
  T12["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S12 -->|calls| T12
  S13["method:JobsTaskManager::mergedExecutions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:49"]
  T13["method:JobsTask::executions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:450"]
  S13 -->|calls| T13
  S14["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  T14["method:JobsTaskManager::bindLifecycle<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:335"]
  S14 -->|calls| T14
  S15["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  T15["method:JobsTaskCenter::add<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:34"]
  S15 -->|calls| T15
  S16["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  T16["method:JobsTaskCenter::addTag<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:62"]
  S16 -->|calls| T16
  S17["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  T17["method:JobsTaskManager::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:166"]
  S17 -->|calls| T17
  S18["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  T18["method:JobsTaskManager::status<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:384"]
  S18 -->|calls| T18
  S19["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  T19["method:JobsTaskManager::updateStatus<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:346"]
  S19 -->|calls| T19
  S20["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:88"]
  T20["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:88"]
  S20 -->|calls| T20
  S21["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:93"]
  T21["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S21 -->|calls| T21
  S22["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:93"]
  T22["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S22 -->|calls| T22
  S23["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:93"]
  T23["method:JobsTaskCenter::remove<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:41"]
  S23 -->|calls| T23
  S24["method:JobsTaskManager::removeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:93"]
  T24["method:JobsTaskManager::notifyStatusChange<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:371"]
  S24 -->|calls| T24
  S25["method:JobsTaskManager::removeAllTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:109"]
  T25["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

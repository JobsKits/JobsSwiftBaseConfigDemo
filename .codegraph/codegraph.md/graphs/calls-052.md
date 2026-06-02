# `calls 符号关系 - 052`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T1["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S1 -->|calls| T1
  S2["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T2["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S2 -->|calls| T2
  S3["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T3["method:JobsTask::removeLifecycleObserver<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:149"]
  S3 -->|calls| T3
  S4["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  T4["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S4 -->|calls| T4
  S5["method:JobsTask::executeAndWait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:441"]
  T5["method:JobsTask::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:232"]
  S5 -->|calls| T5
  S6["method:JobsTask::executeAndWait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:441"]
  T6["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  S6 -->|calls| T6
  S7["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T7["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S7 -->|calls| T7
  S8["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T8["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S8 -->|calls| T8
  S9["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T9["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S9 -->|calls| T9
  S10["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T10["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S10 -->|calls| T10
  S11["method:JobsTask::waitForExecutionCount<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:454"]
  T11["method:JobsTaskContinuationBox::markResumed<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:17"]
  S11 -->|calls| T11
  S12["method:JobsTask::waitAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:481"]
  T12["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S12 -->|calls| T12
  S13["method:JobsTask::waitAny<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:496"]
  T13["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S13 -->|calls| T13
  S14["method:JobsTask::cancelAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:515"]
  T14["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S14 -->|calls| T14
  S15["method:JobsTask::suspendAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:521"]
  T15["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S15 -->|calls| T15
  S16["method:JobsTask::resumeAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:527"]
  T16["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S16 -->|calls| T16
  S17["method:JobsTaskCenter::add<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:34"]
  T17["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:233"]
  S17 -->|calls| T17
  S18["method:JobsTaskCenter::remove<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:41"]
  T18["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S18 -->|calls| T18
  S19["method:JobsTaskCenter::remove<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:41"]
  T19["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S19 -->|calls| T19
  S20["method:JobsTaskCenter::remove<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:41"]
  T20["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  S20 -->|calls| T20
  S21["method:JobsTaskCenter::removeAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:50"]
  T21["method:JobsTaskCenter::removeAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:50"]
  S21 -->|calls| T21
  S22["method:JobsTaskCenter::removeAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:50"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S22 -->|calls| T22
  S23["method:JobsTaskCenter::addTag<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:62"]
  T23["method:JobsWorkerBag::insert<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:69"]
  S23 -->|calls| T23
  S24["method:JobsTaskCenterComponent::schedule<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:79"]
  T24["method:JobsTaskCenterComponent::makeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:264"]
  S24 -->|calls| T24
  S25["method:JobsTaskCenterComponent::schedule<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:79"]
  T25["method:JobsPlan::every<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:87"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

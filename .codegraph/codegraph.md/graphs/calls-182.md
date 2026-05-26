# `calls 符号关系 - 182`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTask::waitAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:481"]
  T1["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S1 -->|calls| T1
  S2["method:JobsTask::waitAny<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:496"]
  T2["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:422"]
  S2 -->|calls| T2
  S3["method:JobsTask::cancelAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:515"]
  T3["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S3 -->|calls| T3
  S4["method:JobsTask::suspendAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:521"]
  T4["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S4 -->|calls| T4
  S5["method:JobsTask::resumeAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:527"]
  T5["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S5 -->|calls| T5
  S6["method:JobsTaskCenter::add<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:34"]
  T6["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:233"]
  S6 -->|calls| T6
  S7["method:JobsTaskCenter::remove<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:41"]
  T7["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S7 -->|calls| T7
  S8["method:JobsTaskCenter::remove<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:41"]
  T8["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S8 -->|calls| T8
  S9["method:JobsTaskCenter::remove<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:41"]
  T9["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  S9 -->|calls| T9
  S10["method:JobsTaskCenter::removeAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:50"]
  T10["method:JobsTaskCenter::removeAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:50"]
  S10 -->|calls| T10
  S11["method:JobsTaskCenter::removeAll<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:50"]
  T11["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S11 -->|calls| T11
  S12["method:JobsTaskCenter::addTag<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:62"]
  T12["method:JobsWorkerBag::insert<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:69"]
  S12 -->|calls| T12
  S13["method:JobsTaskCenterComponent::schedule<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:79"]
  T13["method:JobsTaskCenterComponent::makeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:264"]
  S13 -->|calls| T13
  S14["method:JobsTaskCenterComponent::schedule<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:79"]
  T14["method:JobsPlan::every<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:87"]
  S14 -->|calls| T14
  S15["method:JobsTaskCenterComponent::createOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:98"]
  T15["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:116"]
  S15 -->|calls| T15
  S16["method:JobsTaskCenterComponent::createOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:98"]
  T16["method:JobsTaskCenterComponent::makeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:264"]
  S16 -->|calls| T16
  S17["method:JobsTaskCenterComponent::createOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:122"]
  T17["method:JobsTaskCenterComponent::createOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:122"]
  S17 -->|calls| T17
  S18["method:JobsTaskCenterComponent::createRunLoopTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:137"]
  T18["method:JobsTaskCenterComponent::schedule<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:79"]
  S18 -->|calls| T18
  S19["method:JobsTaskCenterComponent::createRunLoopTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:155"]
  T19["method:JobsTaskCenterComponent::createRunLoopTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:155"]
  S19 -->|calls| T19
  S20["method:JobsTaskCenterComponent::createTimerTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:173"]
  T20["method:JobsTaskCenterComponent::schedule<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:79"]
  S20 -->|calls| T20
  S21["method:JobsTaskCenterComponent::createTimerTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:192"]
  T21["method:JobsTaskCenterComponent::createTimerTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:192"]
  S21 -->|calls| T21
  S22["method:JobsTaskCenterComponent::appendTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:210"]
  T22["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S22 -->|calls| T22
  S23["method:JobsTaskCenterComponent::removeAppendedTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:215"]
  T23["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S23 -->|calls| T23
  S24["method:JobsTaskCenterComponent::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:221"]
  T24["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  S24 -->|calls| T24
  S25["method:JobsTaskCenterComponent::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:227"]
  T25["method:JobsTask::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:166"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

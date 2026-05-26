# `calls 符号关系 - 183`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTaskCenterComponent::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:233"]
  T1["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  S1 -->|calls| T1
  S2["method:JobsTaskCenterComponent::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:239"]
  T2["method:JobsTask::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:232"]
  S2 -->|calls| T2
  S3["method:JobsTaskCenterComponent::attach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:245"]
  T3["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  S3 -->|calls| T3
  S4["method:JobsTaskCenterComponent::attach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:245"]
  T4["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  S4 -->|calls| T4
  S5["method:JobsTaskCenterComponent::attach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:245"]
  T5["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  S5 -->|calls| T5
  S6["method:JobsTaskCenterComponent::byAppendTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:293"]
  T6["method:JobsTaskCenterComponent::appendTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:210"]
  S6 -->|calls| T6
  S7["method:JobsTaskCenterComponent::byResume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:300"]
  T7["method:JobsTaskCenterComponent::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:221"]
  S7 -->|calls| T7
  S8["method:JobsTaskCenterComponent::bySuspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:307"]
  T8["method:JobsTaskCenterComponent::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:227"]
  S8 -->|calls| T8
  S9["method:JobsTaskCenterComponent::byCancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:314"]
  T9["method:JobsTaskCenterComponent::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:233"]
  S9 -->|calls| T9
  S10["method:JobsTaskCenterComponent::byExecuteNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:321"]
  T10["method:JobsTaskCenterComponent::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:239"]
  S10 -->|calls| T10
  S11["method:JobsTaskCenterComponent::byAttach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:333"]
  T11["method:JobsTaskCenterComponent::attach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:245"]
  S11 -->|calls| T11
  S12["method:JobsTaskCenterComponent::createAsyncTimerTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:358"]
  T12["method:JobsPlan::doAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:177"]
  S12 -->|calls| T12
  S13["method:JobsTaskCenterComponent::createAsyncTimerTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:358"]
  T13["method:JobsPlan::every<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:87"]
  S13 -->|calls| T13
  S14["method:JobsTaskCenterComponent::createAsyncOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:391"]
  T14["method:JobsPlan::doAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:177"]
  S14 -->|calls| T14
  S15["method:JobsTaskCenterComponent::createAsyncOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:391"]
  T15["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:116"]
  S15 -->|calls| T15
  S16["method:JobsTaskCenterComponent::waitForExecutions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:415"]
  T16["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  S16 -->|calls| T16
  S17["method:JobsTaskCenterComponent::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:420"]
  T17["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:404"]
  S17 -->|calls| T17
  S18["method:JobsTaskCenterComponent::executions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:426"]
  T18["method:JobsTask::executions<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:450"]
  S18 -->|calls| T18
  S19["method:JobsPlan::every<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:87"]
  T19["method:JobsPlan::make<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:83"]
  S19 -->|calls| T19
  S20["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:116"]
  T20["method:JobsPlan::make<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:83"]
  S20 -->|calls| T20
  S21["method:JobsPlan::at<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:129"]
  T21["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:116"]
  S21 -->|calls| T21
  S22["class:JobsPlan<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:81"]
  T22["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:116"]
  S22 -->|calls| T22
  S23["method:JobsPlan::concat<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:144"]
  T23["method:JobsPlan::make<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:83"]
  S23 -->|calls| T23
  S24["method:JobsPlan::concat<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:144"]
  T24["method:JobsPlan::makeIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:140"]
  S24 -->|calls| T24
  S25["struct:JobsTaskExecutionSequence::AsyncIterator<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:27"]
  T25["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

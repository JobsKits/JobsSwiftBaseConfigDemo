# `calls 符号关系 - 053`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTaskCenterComponent::createOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:98"]
  T1["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:116"]
  S1 -->|calls| T1
  S2["method:JobsTaskCenterComponent::createOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:98"]
  T2["method:JobsTaskCenterComponent::makeTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:264"]
  S2 -->|calls| T2
  S3["method:JobsTaskCenterComponent::createOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:122"]
  T3["method:JobsTaskCenterComponent::createOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:122"]
  S3 -->|calls| T3
  S4["method:JobsTaskCenterComponent::createRunLoopTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:137"]
  T4["method:JobsTaskCenterComponent::schedule<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:79"]
  S4 -->|calls| T4
  S5["method:JobsTaskCenterComponent::createRunLoopTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:155"]
  T5["method:JobsTaskCenterComponent::createRunLoopTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:155"]
  S5 -->|calls| T5
  S6["method:JobsTaskCenterComponent::createTimerTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:173"]
  T6["method:JobsTaskCenterComponent::schedule<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:79"]
  S6 -->|calls| T6
  S7["method:JobsTaskCenterComponent::createTimerTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:192"]
  T7["method:JobsTaskCenterComponent::createTimerTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:192"]
  S7 -->|calls| T7
  S8["method:JobsTaskCenterComponent::appendTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:210"]
  T8["method:JobsTask::addAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:125"]
  S8 -->|calls| T8
  S9["method:JobsTaskCenterComponent::removeAppendedTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:215"]
  T9["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S9 -->|calls| T9
  S10["method:JobsTaskCenterComponent::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:221"]
  T10["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  S10 -->|calls| T10
  S11["method:JobsTaskCenterComponent::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:227"]
  T11["method:JobsTask::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:166"]
  S11 -->|calls| T11
  S12["method:JobsTaskCenterComponent::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:233"]
  T12["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  S12 -->|calls| T12
  S13["method:JobsTaskCenterComponent::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:239"]
  T13["method:JobsTask::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:232"]
  S13 -->|calls| T13
  S14["method:JobsTaskCenterComponent::attach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:245"]
  T14["method:JobsTaskManager::addTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:64"]
  S14 -->|calls| T14
  S15["method:JobsTaskCenterComponent::attach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:245"]
  T15["method:JobsTaskManager::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:130"]
  S15 -->|calls| T15
  S16["method:JobsTaskCenterComponent::attach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:245"]
  T16["method:JobsTaskManager::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:148"]
  S16 -->|calls| T16
  S17["method:JobsTaskCenterComponent::byAppendTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:293"]
  T17["method:JobsTaskCenterComponent::appendTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:210"]
  S17 -->|calls| T17
  S18["method:JobsTaskCenterComponent::byResume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:300"]
  T18["method:JobsTaskCenterComponent::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:221"]
  S18 -->|calls| T18
  S19["method:JobsTaskCenterComponent::bySuspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:307"]
  T19["method:JobsTaskCenterComponent::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:227"]
  S19 -->|calls| T19
  S20["method:JobsTaskCenterComponent::byCancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:314"]
  T20["method:JobsTaskCenterComponent::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:233"]
  S20 -->|calls| T20
  S21["method:JobsTaskCenterComponent::byExecuteNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:321"]
  T21["method:JobsTaskCenterComponent::executeNow<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:239"]
  S21 -->|calls| T21
  S22["method:JobsTaskCenterComponent::byAttach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:333"]
  T22["method:JobsTaskCenterComponent::attach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:245"]
  S22 -->|calls| T22
  S23["method:JobsTaskCenterComponent::createAsyncTimerTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:358"]
  T23["method:JobsPlan::doAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:177"]
  S23 -->|calls| T23
  S24["method:JobsTaskCenterComponent::createAsyncTimerTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:358"]
  T24["method:JobsPlan::every<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:87"]
  S24 -->|calls| T24
  S25["method:JobsTaskCenterComponent::createAsyncOneShotTask<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterComponent.swift:391"]
  T25["method:JobsPlan::doAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:177"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

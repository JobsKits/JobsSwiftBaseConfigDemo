# `calls 符号关系 - 007`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T1["method:ASVideoNodeTests::doOnPlayIfVideoIsNotReadyInitializeSpinnerAndAddAsSubnodeWithUrl<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASVideoNodeTests.mm:71"]
  S1 -->|calls| T1
  S2["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T2["method:JobsPlan::every<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:85"]
  S2 -->|calls| T2
  S3["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T3["method:HumanBinding::collect<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:107"]
  S3 -->|calls| T3
  S4["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T4["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S4 -->|calls| T4
  S5["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T5["method:JobsPlan::doAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:171"]
  S5 -->|calls| T5
  S6["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T6["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:110"]
  S6 -->|calls| T6
  S7["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T7["method:Locked::update<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:22"]
  S7 -->|calls| T7
  S8["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T8["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:486"]
  S8 -->|calls| T8
  S9["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T9["method:JobsPlan::doAsync<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:171"]
  S9 -->|calls| T9
  S10["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T10["method:JobsPlan::after<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:110"]
  S10 -->|calls| T10
  S11["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T11["method:Locked::update<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:22"]
  S11 -->|calls| T11
  S12["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T12["method:JobsTask::suspend<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:156"]
  S12 -->|calls| T12
  S13["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T13["method:JobsTask::waitForNextExecution<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:479"]
  S13 -->|calls| T13
  S14["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T14["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:168"]
  S14 -->|calls| T14
  S15["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T15["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:486"]
  S15 -->|calls| T15
  S16["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T16["method:JobsObservable::map<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:11"]
  S16 -->|calls| T16
  S17["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T17["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:32"]
  S17 -->|calls| T17
  S18["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T18["method:Locked::update<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:22"]
  S18 -->|calls| T18
  S19["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T19["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:67"]
  S19 -->|calls| T19
  S20["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T20["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:67"]
  S20 -->|calls| T20
  S21["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T21["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:34"]
  S21 -->|calls| T21
  S22["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T22["method:JobsWorker::dispose<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:48"]
  S22 -->|calls| T22
  S23["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T23["method:JobsWorkerFactory::once<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:32"]
  S23 -->|calls| T23
  S24["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T24["method:Locked::update<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:22"]
  S24 -->|calls| T24
  S25["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T25["method:JobsObservable::accept<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:67"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 008`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T1["method:JobsWorkerScheduler::schedule<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:33"]
  S1 -->|calls| T1
  S2["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T2["method:JobsWorkerScheduler::cancelAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:123"]
  S2 -->|calls| T2
  S3["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T3["method:JobsWorkerScheduler::schedule<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:33"]
  S3 -->|calls| T3
  S4["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T4["method:JobsTask::waitUntilFinished<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:486"]
  S4 -->|calls| T4
  S5["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T5["method:JobsBluetoothMockTransport::byLatency<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothMockTransport/JobsBluetoothMockTransport.swift:20"]
  S5 -->|calls| T5
  S6["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T6["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  S6 -->|calls| T6
  S7["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T7["method:JobsBluetoothMockTransport::advertisements<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothMockTransport/JobsBluetoothMockTransport.swift:32"]
  S7 -->|calls| T7
  S8["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T8["method:JobsBluetoothManager::connect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:274"]
  S8 -->|calls| T8
  S9["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T9["method:BluetoothRegression::send<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:194"]
  S9 -->|calls| T9
  S10["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T10["method:JobsBluetoothCommand::byPayload<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:28"]
  S10 -->|calls| T10
  S11["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T11["method:BluetoothRegression::send<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:194"]
  S11 -->|calls| T11
  S12["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T12["method:JobsBluetoothCommand::byPayload<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:28"]
  S12 -->|calls| T12
  S13["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T13["method:BluetoothRegression::send<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:194"]
  S13 -->|calls| T13
  S14["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T14["method:JobsBluetoothCommand::byPayload<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:28"]
  S14 -->|calls| T14
  S15["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T15["method:JobsBluetoothManager::send<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:438"]
  S15 -->|calls| T15
  S16["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T16["method:JobsBluetoothCommand::byPayload<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:28"]
  S16 -->|calls| T16
  S17["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T17["method:BluetoothRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:97"]
  S17 -->|calls| T17
  S18["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T18["method:JobsBluetoothManager::send<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:438"]
  S18 -->|calls| T18
  S19["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T19["method:JobsBluetoothCommand::byPayload<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:28"]
  S19 -->|calls| T19
  S20["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T20["method:JobsBluetoothManager::disconnect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:342"]
  S20 -->|calls| T20
  S21["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T21["method:JobsBluetoothManager::connect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:274"]
  S21 -->|calls| T21
  S22["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T22["method:BluetoothRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:97"]
  S22 -->|calls| T22
  S23["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T23["method:BluetoothRegression::verifyReentrantResponse<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:142"]
  S23 -->|calls| T23
  S24["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T24["method:BluetoothRegression::verifyReentrantResponse<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:142"]
  S24 -->|calls| T24
  S25["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T25["method:BluetoothRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:97"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

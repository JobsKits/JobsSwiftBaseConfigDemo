# `calls 符号关系 - 009`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T1["method:JobsBluetoothMockTransport::byLatency<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothMockTransport/JobsBluetoothMockTransport.swift:20"]
  S1 -->|calls| T1
  S2["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T2["method:JobsBluetoothManager::connect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:274"]
  S2 -->|calls| T2
  S3["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T3["method:JobsBluetoothManager::send<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:438"]
  S3 -->|calls| T3
  S4["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T4["method:JobsBluetoothCommand::byPayload<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:28"]
  S4 -->|calls| T4
  S5["method:BluetoothRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:13"]
  T5["method:BluetoothRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:97"]
  S5 -->|calls| T5
  S6["method:BluetoothRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:97"]
  T6["method:BluetoothCallbackGate::complete<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:214"]
  S6 -->|calls| T6
  S7["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T7["method:BluetoothRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:97"]
  S7 -->|calls| T7
  S8["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T8["method:JobsBluetoothProfile::byScanTimeout<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothProfile/JobsBluetoothProfile.swift:57"]
  S8 -->|calls| T8
  S9["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T9["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  S9 -->|calls| T9
  S10["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T10["method:JobsBluetoothManager::stopScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:258"]
  S10 -->|calls| T10
  S11["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T11["method:JobsBluetoothProfile::byScanTimeout<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothProfile/JobsBluetoothProfile.swift:57"]
  S11 -->|calls| T11
  S12["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T12["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  S12 -->|calls| T12
  S13["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T13["method:JobsBluetoothManager::stopScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:258"]
  S13 -->|calls| T13
  S14["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T14["method:BluetoothRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:97"]
  S14 -->|calls| T14
  S15["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T15["method:JobsBluetoothProfile::byScanTimeout<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothProfile/JobsBluetoothProfile.swift:57"]
  S15 -->|calls| T15
  S16["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T16["method:JobsBluetoothManager::onStateChanged<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:177"]
  S16 -->|calls| T16
  S17["method:BluetoothRegression::verifyScanRestart<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:114"]
  T17["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  S17 -->|calls| T17
  S18["method:BluetoothRegression::verifyReentrantResponse<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:142"]
  T18["method:JobsBluetoothManager::disconnect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:342"]
  S18 -->|calls| T18
  S19["method:BluetoothRegression::verifyReentrantResponse<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:142"]
  T19["method:JobsBluetoothManager::connect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:274"]
  S19 -->|calls| T19
  S20["method:BluetoothRegression::verifyReentrantResponse<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:142"]
  T20["method:JobsBluetoothManager::sendReliably<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:447"]
  S20 -->|calls| T20
  S21["method:BluetoothRegression::verifyReentrantResponse<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:142"]
  T21["method:JobsBluetoothCommand::byPayload<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:28"]
  S21 -->|calls| T21
  S22["method:BluetoothRegression::verifyReentrantResponse<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:142"]
  T22["method:JobsBluetoothCommand::byPayload<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:28"]
  S22 -->|calls| T22
  S23["method:BluetoothRegression::verifyReentrantResponse<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:142"]
  T23["method:JobsBluetoothManager::sendReliably<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:447"]
  S23 -->|calls| T23
  S24["method:BluetoothRegression::send<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:194"]
  T24["method:JobsBluetoothManager::sendReliably<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:447"]
  S24 -->|calls| T24
  S25["property:BluetoothCallbackGate::isCompleted<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:206"]
  T25["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

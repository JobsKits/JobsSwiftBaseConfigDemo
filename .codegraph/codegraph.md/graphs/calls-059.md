# `calls 符号关系 - 059`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBluetoothManager::send<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:438"]
  T1["method:JobsBluetoothManager::sendReliably<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:447"]
  S1 -->|calls| T1
  S2["method:JobsBluetoothManager::send<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:438"]
  T2["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S2 -->|calls| T2
  S3["method:JobsBluetoothManager::sendReliably<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:447"]
  T3["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S3 -->|calls| T3
  S4["method:JobsBluetoothManager::sendReliably<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:447"]
  T4["method:JobsBluetoothManager::callback<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:705"]
  S4 -->|calls| T4
  S5["method:JobsBluetoothManager::sendReliably<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:447"]
  T5["method:JobsBluetoothManager::callback<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:705"]
  S5 -->|calls| T5
  S6["method:JobsBluetoothManager::sendReliably<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:447"]
  T6["method:JobsBluetoothManager::callback<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:705"]
  S6 -->|calls| T6
  S7["method:JobsBluetoothManager::sendReliably<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:447"]
  T7["method:JobsBluetoothManager::startNextCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:480"]
  S7 -->|calls| T7
  S8["method:JobsBluetoothManager::startNextCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:480"]
  T8["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  S8 -->|calls| T8
  S9["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T9["method:JobsAudioRecorderEngine::cancel<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:109"]
  S9 -->|calls| T9
  S10["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T10["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  S10 -->|calls| T10
  S11["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T11["method:JobsBluetoothManager::retryOrFinish<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:622"]
  S11 -->|calls| T11
  S12["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T12["method:JobsBluetoothManager::retryOrFinish<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:622"]
  S12 -->|calls| T12
  S13["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T13["method:JobsBluetoothMockTransport::echo<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothMockTransport/JobsBluetoothMockTransport.swift:40"]
  S13 -->|calls| T13
  S14["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T14["method:JobsBluetoothManager::receive<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:585"]
  S14 -->|calls| T14
  S15["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T15["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  S15 -->|calls| T15
  S16["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T16["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  S16 -->|calls| T16
  S17["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T17["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  S17 -->|calls| T17
  S18["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T18["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  S18 -->|calls| T18
  S19["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T19["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S19 -->|calls| T19
  S20["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  T20["method:JobsBluetoothManager::pumpWrites<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:558"]
  S20 -->|calls| T20
  S21["method:JobsBluetoothManager::pumpWrites<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:558"]
  T21["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  S21 -->|calls| T21
  S22["method:JobsBluetoothManager::pumpWrites<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:558"]
  T22["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  S22 -->|calls| T22
  S23["method:JobsBluetoothManager::receive<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:585"]
  T23["method:JobsBluetoothManager::report<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:698"]
  S23 -->|calls| T23
  S24["method:JobsBluetoothManager::receive<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:585"]
  T24["method:JobsBluetoothManager::callback<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:705"]
  S24 -->|calls| T24
  S25["method:JobsBluetoothManager::receive<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:585"]
  T25["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

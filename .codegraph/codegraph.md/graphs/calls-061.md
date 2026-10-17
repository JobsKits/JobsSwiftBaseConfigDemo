# `calls 符号关系 - 061`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBluetoothManager::centralManager<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:763"]
  T1["method:JobsBluetoothManager::callback<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:705"]
  S1 -->|calls| T1
  S2["method:JobsBluetoothManager::centralManager<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:787"]
  T2["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S2 -->|calls| T2
  S3["method:JobsBluetoothManager::centralManager<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:795"]
  T3["method:JobsBluetoothManager::connectionEnded<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:805"]
  S3 -->|calls| T3
  S4["method:JobsBluetoothManager::centralManager<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:799"]
  T4["method:JobsBluetoothManager::connectionEnded<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:805"]
  S4 -->|calls| T4
  S5["method:JobsBluetoothManager::connectionEnded<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:805"]
  T5["method:JobsBluetoothManager::beginConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:304"]
  S5 -->|calls| T5
  S6["method:JobsBluetoothManager::connectionEnded<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:805"]
  T6["method:JobsBluetoothManager::scheduleReconnect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:392"]
  S6 -->|calls| T6
  S7["method:JobsBluetoothManager::connectionEnded<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:805"]
  T7["method:JobsBluetoothManager::clearConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:364"]
  S7 -->|calls| T7
  S8["method:JobsBluetoothManager::connectionEnded<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:805"]
  T8["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S8 -->|calls| T8
  S9["method:JobsBluetoothManager::connectionEnded<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:805"]
  T9["method:JobsBluetoothManager::scheduleReconnect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:392"]
  S9 -->|calls| T9
  S10["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:825"]
  T10["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  S10 -->|calls| T10
  S11["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:825"]
  T11["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S11 -->|calls| T11
  S12["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:825"]
  T12["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  S12 -->|calls| T12
  S13["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:825"]
  T13["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S13 -->|calls| T13
  S14["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:850"]
  T14["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  S14 -->|calls| T14
  S15["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:850"]
  T15["method:JobsBluetoothManager::readyIfComplete<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:663"]
  S15 -->|calls| T15
  S16["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:880"]
  T16["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  S16 -->|calls| T16
  S17["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:880"]
  T17["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  S17 -->|calls| T17
  S18["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:880"]
  T18["method:JobsBluetoothManager::readyIfComplete<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:663"]
  S18 -->|calls| T18
  S19["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:897"]
  T19["method:JobsBluetoothManager::report<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:698"]
  S19 -->|calls| T19
  S20["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:897"]
  T20["method:JobsBluetoothManager::receive<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:585"]
  S20 -->|calls| T20
  S21["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:914"]
  T21["method:JobsBluetoothManager::retryOrFinish<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:622"]
  S21 -->|calls| T21
  S22["method:JobsBluetoothManager::peripheral<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:914"]
  T22["method:JobsBluetoothManager::pumpWrites<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:558"]
  S22 -->|calls| T22
  S23["method:JobsBluetoothManager::peripheralIsReady<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:929"]
  T23["method:JobsBluetoothManager::pumpWrites<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:558"]
  S23 -->|calls| T23
  S24["method:JobsBluetoothMockTransport::echo<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothMockTransport/JobsBluetoothMockTransport.swift:40"]
  T24["field:JobsBluetoothMockTransport::responseTransform<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothMockTransport/JobsBluetoothMockTransport.swift:15"]
  S24 -->|calls| T24
  S25["method:JobsBluetoothProfile::byServiceUUIDStrings<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothProfile/JobsBluetoothProfile.swift:33"]
  T25["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

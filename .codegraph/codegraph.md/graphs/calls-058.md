# `calls 符号关系 - 058`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBluetoothManager::connect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:274"]
  T1["method:JobsBluetoothManager::beginConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:304"]
  S1 -->|calls| T1
  S2["method:JobsBluetoothManager::beginConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:304"]
  T2["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S2 -->|calls| T2
  S3["method:JobsBluetoothManager::beginConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:304"]
  T3["method:JobsBluetoothMockTransport::advertisements<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothMockTransport/JobsBluetoothMockTransport.swift:32"]
  S3 -->|calls| T3
  S4["method:JobsBluetoothManager::beginConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:304"]
  T4["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S4 -->|calls| T4
  S5["method:JobsBluetoothManager::beginConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:304"]
  T5["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S5 -->|calls| T5
  S6["method:JobsBluetoothManager::beginConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:304"]
  T6["field:JobsBluetoothManager::nativePeripherals<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:120"]
  S6 -->|calls| T6
  S7["method:JobsBluetoothManager::beginConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:304"]
  T7["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S7 -->|calls| T7
  S8["method:JobsBluetoothManager::beginConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:304"]
  T8["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  S8 -->|calls| T8
  S9["method:JobsBluetoothManager::disconnect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:342"]
  T9["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S9 -->|calls| T9
  S10["method:JobsBluetoothManager::disconnect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:342"]
  T10["method:JobsBluetoothManager::disconnectInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:348"]
  S10 -->|calls| T10
  S11["method:JobsBluetoothManager::disconnectInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:348"]
  T11["method:JobsBluetoothManager::stopScanInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:264"]
  S11 -->|calls| T11
  S12["method:JobsBluetoothManager::disconnectInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:348"]
  T12["method:JobsBluetoothManager::clearConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:364"]
  S12 -->|calls| T12
  S13["method:JobsBluetoothManager::disconnectInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:348"]
  T13["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S13 -->|calls| T13
  S14["method:JobsBluetoothManager::clearConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:364"]
  T14["method:JobsBluetoothManager::failCommands<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:647"]
  S14 -->|calls| T14
  S15["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  T15["method:JobsBluetoothManager::clearConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:364"]
  S15 -->|calls| T15
  S16["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  T16["method:JobsBluetoothManager::report<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:698"]
  S16 -->|calls| T16
  S17["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  T17["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S17 -->|calls| T17
  S18["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  T18["method:JobsBluetoothManager::scheduleReconnect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:392"]
  S18 -->|calls| T18
  S19["method:JobsBluetoothManager::scheduleReconnect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:392"]
  T19["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S19 -->|calls| T19
  S20["method:JobsBluetoothManager::scheduleReconnect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:392"]
  T20["method:JobsBluetoothManager::beginConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:304"]
  S20 -->|calls| T20
  S21["method:JobsBluetoothManager::read<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:411"]
  T21["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S21 -->|calls| T21
  S22["method:JobsBluetoothManager::read<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:411"]
  T22["method:JobsBluetoothManager::report<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:698"]
  S22 -->|calls| T22
  S23["method:JobsBluetoothManager::setNotifyEnabled<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:423"]
  T23["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S23 -->|calls| T23
  S24["method:JobsBluetoothManager::setNotifyEnabled<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:423"]
  T24["method:JobsBluetoothManager::report<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:698"]
  S24 -->|calls| T24
  S25["method:JobsBluetoothManager::setNotifyEnabled<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:423"]
  T25["method:JobsBluetoothManager::failCommands<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:647"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

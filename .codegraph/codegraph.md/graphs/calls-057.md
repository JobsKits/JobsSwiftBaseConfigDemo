# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBluetoothManager::byCallbackQueue<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:151"]
  T1["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S1 -->|calls| T1
  S2["method:JobsBluetoothManager::byProfile<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:159"]
  T2["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S2 -->|calls| T2
  S3["method:JobsBluetoothManager::byProfile<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:159"]
  T3["method:JobsBluetoothManager::disconnectInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:348"]
  S3 -->|calls| T3
  S4["method:JobsBluetoothManager::byMockTransport<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:168"]
  T4["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S4 -->|calls| T4
  S5["method:JobsBluetoothManager::byMockTransport<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:168"]
  T5["method:JobsBluetoothManager::disconnectInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:348"]
  S5 -->|calls| T5
  S6["method:JobsBluetoothManager::onStateChanged<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:177"]
  T6["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S6 -->|calls| T6
  S7["method:JobsBluetoothManager::onPeripheralDiscovered<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:185"]
  T7["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S7 -->|calls| T7
  S8["method:JobsBluetoothManager::onDataReceived<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:193"]
  T8["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S8 -->|calls| T8
  S9["method:JobsBluetoothManager::onLog<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:201"]
  T9["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S9 -->|calls| T9
  S10["method:JobsBluetoothManager::onError<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:209"]
  T10["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S10 -->|calls| T10
  S11["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  T11["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S11 -->|calls| T11
  S12["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  T12["method:JobsBluetoothManager::disconnectInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:348"]
  S12 -->|calls| T12
  S13["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  T13["method:JobsBluetoothManager::stopScanInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:264"]
  S13 -->|calls| T13
  S14["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  T14["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S14 -->|calls| T14
  S15["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  T15["method:JobsBluetoothMockTransport::advertisements<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothMockTransport/JobsBluetoothMockTransport.swift:32"]
  S15 -->|calls| T15
  S16["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  T16["method:JobsBluetoothManager::callback<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:705"]
  S16 -->|calls| T16
  S17["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  T17["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S17 -->|calls| T17
  S18["method:JobsBluetoothManager::startScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:217"]
  T18["method:JobsBluetoothManager::stopScanInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:264"]
  S18 -->|calls| T18
  S19["method:JobsBluetoothManager::stopScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:258"]
  T19["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S19 -->|calls| T19
  S20["method:JobsBluetoothManager::stopScan<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:258"]
  T20["method:JobsBluetoothManager::stopScanInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:264"]
  S20 -->|calls| T20
  S21["method:JobsBluetoothManager::stopScanInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:264"]
  T21["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S21 -->|calls| T21
  S22["method:JobsBluetoothManager::connect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:274"]
  T22["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S22 -->|calls| T22
  S23["method:JobsBluetoothManager::connect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:274"]
  T23["method:JobsBluetoothManager::stopScanInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:264"]
  S23 -->|calls| T23
  S24["method:JobsBluetoothManager::connect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:274"]
  T24["method:JobsBluetoothManager::clearConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:364"]
  S24 -->|calls| T24
  S25["method:JobsBluetoothManager::connect<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:274"]
  T25["method:JobsBluetoothManager::clearConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:364"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

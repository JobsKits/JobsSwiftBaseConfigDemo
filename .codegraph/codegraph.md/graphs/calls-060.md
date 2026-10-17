# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBluetoothManager::retryOrFinish<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:622"]
  T1["method:JobsBluetoothManager::beginCommandAttempt<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:488"]
  S1 -->|calls| T1
  S2["method:JobsBluetoothManager::retryOrFinish<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:622"]
  T2["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  S2 -->|calls| T2
  S3["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  T3["method:JobsAudioRecorderEngine::cancel<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:109"]
  S3 -->|calls| T3
  S4["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  T4["method:JobsBluetoothManager::callback<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:705"]
  S4 -->|calls| T4
  S5["method:JobsBluetoothManager::finishCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:634"]
  T5["method:JobsBluetoothManager::startNextCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:480"]
  S5 -->|calls| T5
  S6["method:JobsBluetoothManager::failCommands<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:647"]
  T6["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S6 -->|calls| T6
  S7["method:JobsBluetoothManager::failCommands<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:647"]
  T7["method:JobsAudioRecorderEngine::cancel<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:109"]
  S7 -->|calls| T7
  S8["method:JobsBluetoothManager::failCommands<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:647"]
  T8["method:JobsBluetoothManager::callback<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:705"]
  S8 -->|calls| T8
  S9["method:JobsBluetoothManager::readyIfComplete<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:663"]
  T9["method:JobsBluetoothManager::failConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:379"]
  S9 -->|calls| T9
  S10["method:JobsBluetoothManager::readyIfComplete<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:663"]
  T10["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S10 -->|calls| T10
  S11["method:JobsBluetoothManager::readyIfComplete<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:663"]
  T11["method:JobsBluetoothManager::startNextCommand<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:480"]
  S11 -->|calls| T11
  S12["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  T12["method:JobsBluetoothManager::callback<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:705"]
  S12 -->|calls| T12
  S13["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  T13["function:log<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:431"]
  S13 -->|calls| T13
  S14["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  T14["property:JobsBluetoothManager::state<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:15"]
  S14 -->|calls| T14
  S15["method:JobsBluetoothManager::report<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:698"]
  T15["method:JobsBluetoothManager::callback<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:705"]
  S15 -->|calls| T15
  S16["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  T16["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S16 -->|calls| T16
  S17["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  T17["method:UITextViewDemoVC::sync<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@输入文本.swift:436"]
  S17 -->|calls| T17
  S18["class:JobsBluetoothManager<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:12"]
  T18["method:JobsAudioRecorderEngine::cancel<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:109"]
  S18 -->|calls| T18
  S19["class:JobsBluetoothManager<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:12"]
  T19["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S19 -->|calls| T19
  S20["class:JobsBluetoothManager<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:12"]
  T20["method:JobsAudioRecorderEngine::cancel<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:109"]
  S20 -->|calls| T20
  S21["method:JobsBluetoothManager::centralManagerDidUpdateState<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:745"]
  T21["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S21 -->|calls| T21
  S22["method:JobsBluetoothManager::centralManagerDidUpdateState<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:745"]
  T22["method:JobsBluetoothManager::stopScanInternal<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:264"]
  S22 -->|calls| T22
  S23["method:JobsBluetoothManager::centralManagerDidUpdateState<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:745"]
  T23["method:JobsBluetoothManager::clearConnection<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:364"]
  S23 -->|calls| T23
  S24["method:JobsBluetoothManager::centralManagerDidUpdateState<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:745"]
  T24["method:JobsBluetoothManager::transition<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:688"]
  S24 -->|calls| T24
  S25["method:JobsBluetoothManager::centralManager<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:763"]
  T25["field:JobsBluetoothManager::nativePeripherals<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:120"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

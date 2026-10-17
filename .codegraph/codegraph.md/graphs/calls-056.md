# `calls 符号关系 - 056`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAudioRecorderEngine::audioRecorderEncodeErrorDidOccur<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:151"]
  T1["method:JobsAudioRecorderEngine::failure<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:119"]
  S1 -->|calls| T1
  S2["method:JobsAudioRecordingStore::makeURL<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordingStore.swift:25"]
  T2["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:17"]
  S2 -->|calls| T2
  S3["method:JobsAudioRecordingStore::makeURL<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordingStore.swift:25"]
  T3["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:48"]
  S3 -->|calls| T3
  S4["method:JobsAudioRecordingStore::preparedURL<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordingStore.swift:31"]
  T4["method:JobsAudioRecordingStore::makeURL<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordingStore.swift:25"]
  S4 -->|calls| T4
  S5["method:JobsAudioRecordingStore::recordings<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordingStore.swift:37"]
  T5["method:JobsAudioRecordingStore::recordingsThrowing<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordingStore.swift:41"]
  S5 -->|calls| T5
  S6["method:JobsAudioRecordingStore::recordingsThrowing<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordingStore.swift:41"]
  T6["method:OrderedDictionary::sorted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:468"]
  S6 -->|calls| T6
  S7["method:JobsAudioRecordingStore::delete<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordingStore.swift:58"]
  T7["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S7 -->|calls| T7
  S8["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  T8["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S8 -->|calls| T8
  S9["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  T9["method:UITextViewDemoVC::sync<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@输入文本.swift:436"]
  S9 -->|calls| T9
  S10["method:JobsAudioSessionCoordinator::acquire<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:24"]
  T10["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S10 -->|calls| T10
  S11["property:JobsBluetoothManager::state<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:15"]
  T11["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S11 -->|calls| T11
  S12["property:JobsBluetoothManager::discoveredPeripherals<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:20"]
  T12["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S12 -->|calls| T12
  S13["property:JobsBluetoothManager::profile<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:28"]
  T13["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S13 -->|calls| T13
  S14["property:JobsBluetoothManager::mockTransport<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:33"]
  T14["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S14 -->|calls| T14
  S15["property:JobsBluetoothManager::callbackQueue<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:38"]
  T15["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S15 -->|calls| T15
  S16["property:JobsBluetoothManager::stateChanged<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:44"]
  T16["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S16 -->|calls| T16
  S17["property:JobsBluetoothManager::stateChanged<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:44"]
  T17["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S17 -->|calls| T17
  S18["property:JobsBluetoothManager::peripheralDiscovered<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:57"]
  T18["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S18 -->|calls| T18
  S19["property:JobsBluetoothManager::peripheralDiscovered<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:57"]
  T19["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S19 -->|calls| T19
  S20["property:JobsBluetoothManager::dataReceived<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:70"]
  T20["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S20 -->|calls| T20
  S21["property:JobsBluetoothManager::dataReceived<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:70"]
  T21["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S21 -->|calls| T21
  S22["property:JobsBluetoothManager::logReceived<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:83"]
  T22["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S22 -->|calls| T22
  S23["property:JobsBluetoothManager::logReceived<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:83"]
  T23["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S23 -->|calls| T23
  S24["property:JobsBluetoothManager::errorReceived<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:96"]
  T24["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S24 -->|calls| T24
  S25["property:JobsBluetoothManager::errorReceived<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:96"]
  T25["method:JobsBluetoothManager::onMain<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:709"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 067`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T1["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S1 -->|calls| T1
  S2["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T2["method:BluetoothProxy::request<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:231"]
  S2 -->|calls| T2
  S3["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T3["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S3 -->|calls| T3
  S4["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T4["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S4 -->|calls| T4
  S5["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T5["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S5 -->|calls| T5
  S6["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T6["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S6 -->|calls| T6
  S7["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T7["method:BluetoothProxy::request<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:231"]
  S7 -->|calls| T7
  S8["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T8["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S8 -->|calls| T8
  S9["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T9["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S9 -->|calls| T9
  S10["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  T10["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S10 -->|calls| T10
  S11["method:LocationProxy::locationManagerDidChangeAuthorization<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:200"]
  T11["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  S11 -->|calls| T11
  S12["method:LocationProxy::locationManagerDidChangeAuthorization<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:200"]
  T12["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  S12 -->|calls| T12
  S13["method:LocationProxy::locationManager<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:208"]
  T13["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  S13 -->|calls| T13
  S14["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  T14["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S14 -->|calls| T14
  S15["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  T15["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S15 -->|calls| T15
  S16["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  T16["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S16 -->|calls| T16
  S17["method:BluetoothProxy::centralManagerDidUpdateState<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:237"]
  T17["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S17 -->|calls| T17
  S18["method:UnityManager::loadUnityFramework<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:40"]
  T18["method:UnityFramework::getInstance<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:27"]
  S18 -->|calls| T18
  S19["method:UnityManager::loadUnityFramework<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:40"]
  T19["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S19 -->|calls| T19
  S20["method:UnityManager::showUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:100"]
  T20["method:UnityManager::loadUnityFramework<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:40"]
  S20 -->|calls| T20
  S21["method:UnityManager::showUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:100"]
  T21["method:UnityManager::setupAutoCloseTimer<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:141"]
  S21 -->|calls| T21
  S22["method:UnityManager::showUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:115"]
  T22["method:UnityManager::showUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:115"]
  S22 -->|calls| T22
  S23["method:UnityManager::hideUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:123"]
  T23["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S23 -->|calls| T23
  S24["method:UnityManager::unloadUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:133"]
  T24["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S24 -->|calls| T24
  S25["method:UnityManager::setupAutoCloseTimer<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:141"]
  T25["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

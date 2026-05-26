# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T1["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S1 -->|calls| T1
  S2["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T2["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S2 -->|calls| T2
  S3["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T3["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S3 -->|calls| T3
  S4["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T4["method:BluetoothProxy::request<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:231"]
  S4 -->|calls| T4
  S5["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T5["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S5 -->|calls| T5
  S6["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T6["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S6 -->|calls| T6
  S7["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  T7["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S7 -->|calls| T7
  S8["method:LocationProxy::locationManagerDidChangeAuthorization<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:200"]
  T8["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  S8 -->|calls| T8
  S9["method:LocationProxy::locationManagerDidChangeAuthorization<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:200"]
  T9["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  S9 -->|calls| T9
  S10["method:LocationProxy::locationManager<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:208"]
  T10["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  S10 -->|calls| T10
  S11["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  T11["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S11 -->|calls| T11
  S12["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  T12["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S12 -->|calls| T12
  S13["method:LocationProxy::handle<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:214"]
  T13["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S13 -->|calls| T13
  S14["method:BluetoothProxy::centralManagerDidUpdateState<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:237"]
  T14["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S14 -->|calls| T14
  S15["method:UnityManager::loadUnityFramework<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:40"]
  T15["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:33"]
  S15 -->|calls| T15
  S16["method:UnityManager::loadUnityFramework<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:40"]
  T16["method:UnityFramework::getInstance<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:27"]
  S16 -->|calls| T16
  S17["method:UnityManager::loadUnityFramework<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:40"]
  T17["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S17 -->|calls| T17
  S18["method:UnityManager::showUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:100"]
  T18["method:UnityManager::loadUnityFramework<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:40"]
  S18 -->|calls| T18
  S19["method:UnityManager::showUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:100"]
  T19["method:UnityManager::setupAutoCloseTimer<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:141"]
  S19 -->|calls| T19
  S20["method:UnityManager::showUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:115"]
  T20["method:UnityManager::showUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:115"]
  S20 -->|calls| T20
  S21["method:UnityManager::hideUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:123"]
  T21["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S21 -->|calls| T21
  S22["method:UnityManager::unloadUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:133"]
  T22["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S22 -->|calls| T22
  S23["method:UnityManager::setupAutoCloseTimer<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:141"]
  T23["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S23 -->|calls| T23
  S24["method:UnityManager::setupAutoCloseTimer<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:141"]
  T24["method:UnityManager::unloadUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:133"]
  S24 -->|calls| T24
  S25["method:UnityManager::setupAutoCloseTimer<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:141"]
  T25["method:UnityManager::hideUnity<br/>JobsByPods/JobsSwiftTools@Pods/UnityManager.swift:123"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

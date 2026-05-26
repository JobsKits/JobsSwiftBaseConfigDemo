# `calls 符号关系 - 193`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CrashCatcher::handleSignal<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:246"]
  T1["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  S1 -->|calls| T1
  S2["method:CrashCatcher::handleTerminate<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:261"]
  T2["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  S2 -->|calls| T2
  S3["function:jobs_terminate_handler<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:276"]
  T3["method:CrashCatcher::handleTerminate<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:261"]
  S3 -->|calls| T3
  S4["function:jobs_signal_handler<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:287"]
  T4["method:CrashCatcher::handleSignal<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:246"]
  S4 -->|calls| T4
  S5["method:FlutterBridge::setup<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:45"]
  T5["method:FlutterBridge::runEngineIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:158"]
  S5 -->|calls| T5
  S6["method:FlutterBridge::setup<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:45"]
  T6["method:FlutterBridge::registerPluginsIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:166"]
  S6 -->|calls| T6
  S7["method:FlutterBridge::setup<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:45"]
  T7["method:FlutterBridge::installChannelIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:173"]
  S7 -->|calls| T7
  S8["method:FlutterBridge::presentFlutter<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:52"]
  T8["method:FlutterBridge::normalizedRequestId<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:232"]
  S8 -->|calls| T8
  S9["method:FlutterBridge::presentFlutter<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:52"]
  T9["method:FlutterBridge::makeFlutterVC<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:115"]
  S9 -->|calls| T9
  S10["method:FlutterBridge::presentFlutter<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:52"]
  T10["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S10 -->|calls| T10
  S11["method:FlutterBridge::pushFlutter<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:83"]
  T11["method:FlutterBridge::normalizedRequestId<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:232"]
  S11 -->|calls| T11
  S12["method:FlutterBridge::pushFlutter<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:83"]
  T12["method:FlutterBridge::makeFlutterVC<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:115"]
  S12 -->|calls| T12
  S13["method:FlutterBridge::pushFlutter<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:83"]
  T13["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S13 -->|calls| T13
  S14["method:FlutterBridge::makeFlutterVC<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:115"]
  T14["method:FlutterBridge::ensureEngineReady<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:144"]
  S14 -->|calls| T14
  S15["method:FlutterBridge::makeFlutterVC<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:115"]
  T15["method:FlutterBridge::installChannelIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:173"]
  S15 -->|calls| T15
  S16["method:FlutterBridge::makeFlutterVC<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:115"]
  T16["method:JobsLottieConfig::configure<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshEnums.swift:115"]
  S16 -->|calls| T16
  S17["method:FlutterBridge::makeFlutterVC<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:115"]
  T17["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S17 -->|calls| T17
  S18["method:FlutterBridge::ensureEngineReady<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:144"]
  T18["method:FlutterBridge::runEngineIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:158"]
  S18 -->|calls| T18
  S19["method:FlutterBridge::ensureEngineReady<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:144"]
  T19["method:FlutterBridge::registerPluginsIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:166"]
  S19 -->|calls| T19
  S20["method:FlutterBridge::ensureEngineReady<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:144"]
  T20["method:FlutterBridge::runEngineIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:158"]
  S20 -->|calls| T20
  S21["method:FlutterBridge::ensureEngineReady<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:144"]
  T21["method:FlutterBridge::registerPluginsIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:166"]
  S21 -->|calls| T21
  S22["method:FlutterBridge::registerPluginsIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:166"]
  T22["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S22 -->|calls| T22
  S23["method:FlutterBridge::installChannelIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:173"]
  T23["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S23 -->|calls| T23
  S24["method:FlutterBridge::installChannelIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:173"]
  T24["method:FlutterBridge::closeFlutterPage<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:205"]
  S24 -->|calls| T24
  S25["method:FlutterBridge::installChannelIfNeeded<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:173"]
  T25["method:FlutterBridge::closeFlutterPage<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:205"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

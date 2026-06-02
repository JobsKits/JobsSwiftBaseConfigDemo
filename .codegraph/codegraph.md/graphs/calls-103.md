# `calls 符号关系 - 103`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  T1["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S1 -->|calls| T1
  S2["method:DisplayConnection::createView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:93"]
  T2["method:DisplayConnection::createView:showRightAway:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:98"]
  S2 -->|calls| T2
  S3["method:DisplayConnection::createView:showRightAway:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:98"]
  T3["function:UnityScreenScaleFactor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:706"]
  S3 -->|calls| T3
  S4["method:DisplayConnection::createView:showRightAway:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:98"]
  T4["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S4 -->|calls| T4
  S5["method:DisplayConnection::createView:showRightAway:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:98"]
  T5["method:DisplayConnection::createWithWindow:andView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:84"]
  S5 -->|calls| T5
  S6["method:DisplayConnection::initRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:134"]
  T6["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S6 -->|calls| T6
  S7["method:DisplayConnection::initRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:134"]
  T7["function:UnityGetMetalDevice<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:193"]
  S7 -->|calls| T7
  S8["method:DisplayConnection::initRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:134"]
  T8["function:UnityCommandQueueMaxCommandBufferCountMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:390"]
  S8 -->|calls| T8
  S9["method:DisplayConnection::recreateSurface:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:156"]
  T9["method:DisplayConnection::initRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:134"]
  S9 -->|calls| T9
  S10["method:DisplayConnection::recreateSurface:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:156"]
  T10["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S10 -->|calls| T10
  S11["method:DisplayConnection::recreateSurface:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:156"]
  T11["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S11 -->|calls| T11
  S12["method:DisplayConnection::destroySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:231"]
  T12["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S12 -->|calls| T12
  S13["method:DisplayManager::registerScreen:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:308"]
  T13["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:313"]
  S13 -->|calls| T13
  S14["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:313"]
  T14["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:313"]
  S14 -->|calls| T14
  S15["method:DisplayManager::dealloc<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:342"]
  T15["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S15 -->|calls| T15
  S16["method:DisplayManager::screenDidConnect:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:430"]
  T16["method:DisplayManager::updateDisplayListCacheInUnity<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:363"]
  S16 -->|calls| T16
  S17["method:DisplayManager::screenDidDisconnect:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:436"]
  T17["method:DisplayConnection::destroySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:231"]
  S17 -->|calls| T17
  S18["method:DisplayManager::screenDidDisconnect:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:436"]
  T18["method:DisplayManager::updateDisplayListCacheInUnity<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:363"]
  S18 -->|calls| T18
  S19["method:DisplayManager::Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:451"]
  T19["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S19 -->|calls| T19
  S20["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  T20["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S20 -->|calls| T20
  S21["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  T21["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S21 -->|calls| T21
  S22["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  T22["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S22 -->|calls| T22
  S23["method:DisplayManager::present<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:511"]
  T23["method:DisplayConnection::present<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:260"]
  S23 -->|calls| T23
  S24["method:DisplayManager::Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:516"]
  T24["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S24 -->|calls| T24
  S25["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:523"]
  T25["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

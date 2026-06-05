# `calls 符号关系 - 037`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:DisplayManager::screenDidConnect:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:430"]
  T1["method:DisplayManager::updateDisplayListCacheInUnity<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:363"]
  S1 -->|calls| T1
  S2["method:DisplayManager::screenDidDisconnect:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:436"]
  T2["method:DisplayConnection::destroySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:231"]
  S2 -->|calls| T2
  S3["method:DisplayManager::screenDidDisconnect:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:436"]
  T3["method:DisplayManager::updateDisplayListCacheInUnity<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:363"]
  S3 -->|calls| T3
  S4["method:DisplayManager::Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:451"]
  T4["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S4 -->|calls| T4
  S5["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  T5["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S5 -->|calls| T5
  S6["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  T6["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S6 -->|calls| T6
  S7["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  T7["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S7 -->|calls| T7
  S8["method:DisplayManager::present<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:511"]
  T8["method:DisplayConnection::present<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:260"]
  S8 -->|calls| T8
  S9["method:DisplayManager::Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:516"]
  T9["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S9 -->|calls| T9
  S10["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:523"]
  T10["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:483"]
  S10 -->|calls| T10
  S11["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  T11["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S11 -->|calls| T11
  S12["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  T12["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S12 -->|calls| T12
  S13["function:UnityDisplayManager_DisplayCount<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:580"]
  T13["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S13 -->|calls| T13
  S14["function:UnityDisplayManager_DisplayAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:585"]
  T14["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S14 -->|calls| T14
  S15["function:UnityDisplayManager_DisplayActive<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:597"]
  T15["function:UnityDisplayManager_DisplayAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:585"]
  S15 -->|calls| T15
  S16["function:UnityDisplayManager_DisplaySystemResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:606"]
  T16["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S16 -->|calls| T16
  S17["function:UnityDisplayManager_DisplaySystemResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:606"]
  T17["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  S17 -->|calls| T17
  S18["function:UnityDisplayManager_DisplayRenderingResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:632"]
  T18["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S18 -->|calls| T18
  S19["function:UnityDisplayManager_DisplayRenderingResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:632"]
  T19["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S19 -->|calls| T19
  S20["function:UnityDisplayManager_DisplayRenderingResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:632"]
  T20["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  S20 -->|calls| T20
  S21["function:UnityDisplayManager_DisplayRenderingBuffers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:648"]
  T21["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S21 -->|calls| T21
  S22["function:UnityDisplayManager_DisplayRenderingBuffers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:648"]
  T22["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S22 -->|calls| T22
  S23["function:UnityDisplayManager_DisplayRenderingBuffers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:648"]
  T23["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  S23 -->|calls| T23
  S24["function:UnityDisplayManager_SetRenderingResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:666"]
  T24["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S24 -->|calls| T24
  S25["function:UnityDisplayManager_SetRenderingResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:666"]
  T25["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

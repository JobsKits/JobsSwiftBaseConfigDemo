# `calls 符号关系 - 104`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  T1["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S1 -->|calls| T1
  S2["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  T2["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S2 -->|calls| T2
  S3["function:UnityDisplayManager_DisplayCount<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:580"]
  T3["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S3 -->|calls| T3
  S4["function:UnityDisplayManager_DisplayAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:585"]
  T4["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S4 -->|calls| T4
  S5["function:UnityDisplayManager_DisplayActive<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:597"]
  T5["function:UnityDisplayManager_DisplayAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:585"]
  S5 -->|calls| T5
  S6["function:UnityDisplayManager_DisplaySystemResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:606"]
  T6["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S6 -->|calls| T6
  S7["function:UnityDisplayManager_DisplaySystemResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:606"]
  T7["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  S7 -->|calls| T7
  S8["function:UnityDisplayManager_DisplayRenderingResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:632"]
  T8["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S8 -->|calls| T8
  S9["function:UnityDisplayManager_DisplayRenderingResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:632"]
  T9["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S9 -->|calls| T9
  S10["function:UnityDisplayManager_DisplayRenderingResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:632"]
  T10["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  S10 -->|calls| T10
  S11["function:UnityDisplayManager_DisplayRenderingBuffers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:648"]
  T11["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S11 -->|calls| T11
  S12["function:UnityDisplayManager_DisplayRenderingBuffers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:648"]
  T12["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S12 -->|calls| T12
  S13["function:UnityDisplayManager_DisplayRenderingBuffers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:648"]
  T13["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  S13 -->|calls| T13
  S14["function:UnityDisplayManager_SetRenderingResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:666"]
  T14["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S14 -->|calls| T14
  S15["function:UnityDisplayManager_SetRenderingResolution<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:666"]
  T15["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  S15 -->|calls| T15
  S16["function:UnityActivateScreenForRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:690"]
  T16["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S16 -->|calls| T16
  S17["function:UnityActivateScreenForRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:690"]
  T17["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S17 -->|calls| T17
  S18["function:UnityActivateScreenForRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:690"]
  T18["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  S18 -->|calls| T18
  S19["function:UnityStartFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:737"]
  T19["method:DisplayManager::startFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:409"]
  S19 -->|calls| T19
  S20["function:UnityStartFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:737"]
  T20["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S20 -->|calls| T20
  S21["function:UnityDestroyUnityRenderSurfaces<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:742"]
  T21["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S21 -->|calls| T21
  S22["function:UnityDestroyUnityRenderSurfaces<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:742"]
  T22["method:DisplayConnection::destroySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:231"]
  S22 -->|calls| T22
  S23["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T23["property:DisplayConnection::screen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:28"]
  S23 -->|calls| T23
  S24["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T24["property:DisplayManager::mainDisplay<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:57"]
  S24 -->|calls| T24
  S25["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T25["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

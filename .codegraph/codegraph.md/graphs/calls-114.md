# `calls 符号关系 - 114`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T1["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S1 -->|calls| T1
  S2["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T2["function:PreparePresentNonMainScreenMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:452"]
  S2 -->|calls| T2
  S3["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T3["method:DisplayConnection::present<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:260"]
  S3 -->|calls| T3
  S4["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T4["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S4 -->|calls| T4
  S5["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T5["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  S5 -->|calls| T5
  S6["method:UnityAppController::callbackFramerateChange:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:98"]
  T6["function:UnityDeviceCPUCount<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:208"]
  S6 -->|calls| T6
  S7["method:UnityAppController::selectRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:128"]
  T7["function:SelectRenderingAPIImpl<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:176"]
  S7 -->|calls| T7
  S8["function:UnityGfxInitedCallback<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:143"]
  T8["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S8 -->|calls| T8
  S9["function:UnityPresentContextCallback<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:148"]
  T9["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S9 -->|calls| T9
  S10["function:UnityFramerateChangeCallback<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:153"]
  T10["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S10 -->|calls| T10
  S11["function:SelectRenderingAPIImpl<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:176"]
  T11["function:IsMetalSupported<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:161"]
  S11 -->|calls| T11
  S12["function:UnityGetMetalCommandQueue<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:194"]
  T12["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S12 -->|calls| T12
  S13["function:UnityGetMetalDrawableCommandQueue<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:198"]
  T13["function:UnityGetMetalCommandQueue<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:194"]
  S13 -->|calls| T13
  S14["function:UnityBackbufferColor<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:201"]
  T14["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S14 -->|calls| T14
  S15["function:UnityBackbufferDepth<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:202"]
  T15["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S15 -->|calls| T15
  S16["function:DisplayManagerEndFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:204"]
  T16["method:DisplayManager::endFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:416"]
  S16 -->|calls| T16
  S17["function:DisplayManagerEndFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:204"]
  T17["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S17 -->|calls| T17
  S18["function:UnityPrepareScreenshot<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:206"]
  T18["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S18 -->|calls| T18
  S19["function:UnityPrepareScreenshot<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:206"]
  T19["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S19 -->|calls| T19
  S20["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  T20["function:Profiler_FrameStart<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:125"]
  S20 -->|calls| T20
  S21["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  T21["function:Profiler_FrameEnd<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:137"]
  S21 -->|calls| T21
  S22["method:UnityAppController::init<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:90"]
  T22["method:UnityAppController::init<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:90"]
  S22 -->|calls| T22
  S23["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T23["method:DisplayManager::updateDisplayListCacheInUnity<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:363"]
  S23 -->|calls| T23
  S24["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T24["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S24 -->|calls| T24
  S25["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T25["function:Profiler_InitProfiler<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:111"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 047`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T1["function:CMVideoSampling_Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:8"]
  S1 -->|calls| T1
  S2["method:UnityAppController::repaintDisplayLink<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:38"]
  T2["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  S2 -->|calls| T2
  S3["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  T3["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  S3 -->|calls| T3
  S4["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  T4["method:UnityView::recreateRenderingSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:106"]
  S4 -->|calls| T4
  S5["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  T5["method:UnityView::processKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:244"]
  S5 -->|calls| T5
  S6["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  T6["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  S6 -->|calls| T6
  S7["method:UnityAppController::callbackGfxInited<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:63"]
  T7["method:UnityAppController::shouldAttachRenderDelegate<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:114"]
  S7 -->|calls| T7
  S8["method:UnityAppController::callbackGfxInited<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:63"]
  T8["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  S8 -->|calls| T8
  S9["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T9["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S9 -->|calls| T9
  S10["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T10["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S10 -->|calls| T10
  S11["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T11["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S11 -->|calls| T11
  S12["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T12["function:PreparePresentNonMainScreenMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:452"]
  S12 -->|calls| T12
  S13["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T13["method:DisplayConnection::present<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:260"]
  S13 -->|calls| T13
  S14["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T14["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S14 -->|calls| T14
  S15["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T15["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  S15 -->|calls| T15
  S16["method:UnityAppController::callbackFramerateChange:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:98"]
  T16["function:UnityDeviceCPUCount<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:208"]
  S16 -->|calls| T16
  S17["method:UnityAppController::selectRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:128"]
  T17["function:SelectRenderingAPIImpl<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:176"]
  S17 -->|calls| T17
  S18["function:UnityGfxInitedCallback<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:143"]
  T18["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S18 -->|calls| T18
  S19["function:UnityPresentContextCallback<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:148"]
  T19["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S19 -->|calls| T19
  S20["function:UnityFramerateChangeCallback<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:153"]
  T20["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S20 -->|calls| T20
  S21["function:SelectRenderingAPIImpl<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:176"]
  T21["function:IsMetalSupported<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:161"]
  S21 -->|calls| T21
  S22["function:UnityGetMetalCommandQueue<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:194"]
  T22["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S22 -->|calls| T22
  S23["function:UnityGetMetalDrawableCommandQueue<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:198"]
  T23["function:UnityGetMetalCommandQueue<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:194"]
  S23 -->|calls| T23
  S24["function:UnityBackbufferColor<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:201"]
  T24["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S24 -->|calls| T24
  S25["function:UnityBackbufferDepth<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:202"]
  T25["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

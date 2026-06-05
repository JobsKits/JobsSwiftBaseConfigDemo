# `calls 符号关系 - 048`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:DisplayManagerEndFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:204"]
  T1["method:DisplayManager::endFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:416"]
  S1 -->|calls| T1
  S2["function:DisplayManagerEndFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:204"]
  T2["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S2 -->|calls| T2
  S3["function:UnityPrepareScreenshot<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:206"]
  T3["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S3 -->|calls| T3
  S4["function:UnityPrepareScreenshot<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:206"]
  T4["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S4 -->|calls| T4
  S5["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  T5["function:Profiler_FrameStart<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:125"]
  S5 -->|calls| T5
  S6["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  T6["function:Profiler_FrameEnd<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:137"]
  S6 -->|calls| T6
  S7["method:UnityAppController::init<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:90"]
  T7["method:UnityAppController::init<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:90"]
  S7 -->|calls| T7
  S8["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T8["method:DisplayManager::updateDisplayListCacheInUnity<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:363"]
  S8 -->|calls| T8
  S9["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T9["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S9 -->|calls| T9
  S10["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T10["function:Profiler_InitProfiler<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:111"]
  S10 -->|calls| T10
  S11["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T11["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  S11 -->|calls| T11
  S12["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T12["method:UnityAppController::createDisplayLink<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:25"]
  S12 -->|calls| T12
  S13["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T13["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S13 -->|calls| T13
  S14["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T14["function:InitUnityReplayKit<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:563"]
  S14 -->|calls| T14
  S15["function:UnityAppController::UnityDestroyDisplayLink<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:155"]
  T15["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S15 -->|calls| T15
  S16["function:UnityAppController::UnityRequestQuit<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:166"]
  T16["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S16 -->|calls| T16
  S17["function:UnityAppController::UnityRequestQuit<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:166"]
  T17["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S17 -->|calls| T17
  S18["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  T18["method:KeyboardDelegate::Destroy<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:273"]
  S18 -->|calls| T18
  S19["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  T19["function:SensorsCleanup<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:161"]
  S19 -->|calls| T19
  S20["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  T20["function:Profiler_UninitProfiler<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:120"]
  S20 -->|calls| T20
  S21["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  T21["method:DisplayManager::Destroy<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:466"]
  S21 -->|calls| T21
  S22["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  T22["function:UnityAppController::UnityDestroyDisplayLink<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:155"]
  S22 -->|calls| T22
  S23["method:UnityAppController::application:supportedInterfaceOrientationsForWindow:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:202"]
  T23["method:UnityDefaultViewController::supportedInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:141"]
  S23 -->|calls| T23
  S24["method:UnityAppController::application:supportedInterfaceOrientationsForWindow:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:202"]
  T24["method:UnityDefaultViewController::supportedInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:141"]
  S24 -->|calls| T24
  S25["method:UnityAppController::application:didRegisterForRemoteNotificationsWithDeviceToken:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:231"]
  T25["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

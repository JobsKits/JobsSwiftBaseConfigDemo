# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T1["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  S1 -->|calls| T1
  S2["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T2["method:UnityAppController::createDisplayLink<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:25"]
  S2 -->|calls| T2
  S3["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T3["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S3 -->|calls| T3
  S4["method:UnityAppController::startUnity:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:118"]
  T4["function:InitUnityReplayKit<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:563"]
  S4 -->|calls| T4
  S5["function:UnityAppController::UnityDestroyDisplayLink<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:155"]
  T5["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S5 -->|calls| T5
  S6["function:UnityAppController::UnityRequestQuit<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:166"]
  T6["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S6 -->|calls| T6
  S7["function:UnityAppController::UnityRequestQuit<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:166"]
  T7["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S7 -->|calls| T7
  S8["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  T8["method:KeyboardDelegate::Destroy<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:273"]
  S8 -->|calls| T8
  S9["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  T9["function:SensorsCleanup<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:161"]
  S9 -->|calls| T9
  S10["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  T10["function:Profiler_UninitProfiler<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:120"]
  S10 -->|calls| T10
  S11["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  T11["method:DisplayManager::Destroy<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:466"]
  S11 -->|calls| T11
  S12["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  T12["function:UnityAppController::UnityDestroyDisplayLink<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:155"]
  S12 -->|calls| T12
  S13["method:UnityAppController::application:supportedInterfaceOrientationsForWindow:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:202"]
  T13["method:UnityDefaultViewController::supportedInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:141"]
  S13 -->|calls| T13
  S14["method:UnityAppController::application:supportedInterfaceOrientationsForWindow:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:202"]
  T14["method:UnityDefaultViewController::supportedInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:141"]
  S14 -->|calls| T14
  S15["method:UnityAppController::application:didRegisterForRemoteNotificationsWithDeviceToken:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:231"]
  T15["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S15 -->|calls| T15
  S16["method:UnityAppController::application:didReceiveRemoteNotification:fetchCompletionHandler:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:237"]
  T16["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S16 -->|calls| T16
  S17["method:UnityAppController::application:didFailToRegisterForRemoteNotificationsWithError:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:249"]
  T17["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S17 -->|calls| T17
  S18["method:UnityAppController::application:openURL:options:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:260"]
  T18["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S18 -->|calls| T18
  S19["method:UnityAppController::application:willFinishLaunchingWithOptions:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:285"]
  T19["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S19 -->|calls| T19
  S20["method:UnityAppController::application:willFinishLaunchingWithOptions:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:285"]
  T20["method:UnityAppController::initUnityApplicationNoGraphics<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:366"]
  S20 -->|calls| T20
  S21["method:UnityAppController::initUnityApplicationNoGraphics<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:366"]
  T21["function:UnityDataBundleDir<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:12"]
  S21 -->|calls| T21
  S22["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T22["method:UnityAppController::initUnityApplicationNoGraphics<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:366"]
  S22 -->|calls| T22
  S23["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T23["method:UnityAppController::selectRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:128"]
  S23 -->|calls| T23
  S24["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T24["method:UnityAppController::init<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:90"]
  S24 -->|calls| T24
  S25["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T25["method:UnityAppController::createUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:43"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

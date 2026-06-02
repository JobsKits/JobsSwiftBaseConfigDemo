# `calls 符号关系 - 116`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T1["method:DisplayManager::Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:451"]
  S1 -->|calls| T1
  S2["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T2["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S2 -->|calls| T2
  S3["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T3["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  S3 -->|calls| T3
  S4["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T4["method:UnityAppController::preStartUnity<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:115"]
  S4 -->|calls| T4
  S5["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T5["method:KeyboardDelegate::Initialize<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:258"]
  S5 -->|calls| T5
  S6["method:UnityAppController::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:416"]
  T6["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S6 -->|calls| T6
  S7["method:UnityAppController::applicationWillEnterForeground:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:429"]
  T7["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S7 -->|calls| T7
  S8["method:UnityAppController::applicationDidBecomeActive:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:441"]
  T8["method:UnityAppController::removeSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:496"]
  S8 -->|calls| T8
  S9["method:UnityAppController::applicationDidBecomeActive:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:441"]
  T9["function:UnityIsFullScreenPlaying<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:259"]
  S9 -->|calls| T9
  S10["method:UnityAppController::applicationDidBecomeActive:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:441"]
  T10["function:TryResumeFullScreenVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:264"]
  S10 -->|calls| T10
  S11["method:UnityAppController::updateUnityAudioOutput<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:471"]
  T11["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S11 -->|calls| T11
  S12["method:UnityAppController::addSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:476"]
  T12["method:UnityAppController::createSnapshotView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:127"]
  S12 -->|calls| T12
  S13["method:UnityAppController::addSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:476"]
  T13["function:AllocUnityViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:79"]
  S13 -->|calls| T13
  S14["method:UnityAppController::removeSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:496"]
  T14["method:KeyboardDelegate::becomeFirstResponder<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:119"]
  S14 -->|calls| T14
  S15["method:UnityAppController::removeSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:496"]
  T15["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S15 -->|calls| T15
  S16["method:UnityAppController::applicationWillResignActive:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:519"]
  T16["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  S16 -->|calls| T16
  S17["method:UnityAppController::applicationWillResignActive:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:519"]
  T17["method:UnityAppController::addSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:476"]
  S17 -->|calls| T17
  S18["method:UnityAppController::applicationWillTerminate:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:560"]
  T18["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  S18 -->|calls| T18
  S19["method:UnityAppController::application:handleEventsForBackgroundURLSession:completionHandler:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:579"]
  T19["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S19 -->|calls| T19
  S20["function:AppController_SendNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:588"]
  T20["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S20 -->|calls| T20
  S21["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  T21["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S21 -->|calls| T21
  S22["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  T22["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S22 -->|calls| T22
  S23["function:UnityGetMainWindow<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:603"]
  T23["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S23 -->|calls| T23
  S24["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  T24["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S24 -->|calls| T24
  S25["function:UnityGetUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:605"]
  T25["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

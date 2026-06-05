# `calls 符号关系 - 049`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityAppController::application:didReceiveRemoteNotification:fetchCompletionHandler:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:237"]
  T1["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S1 -->|calls| T1
  S2["method:UnityAppController::application:didFailToRegisterForRemoteNotificationsWithError:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:249"]
  T2["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S2 -->|calls| T2
  S3["method:UnityAppController::application:openURL:options:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:260"]
  T3["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S3 -->|calls| T3
  S4["method:UnityAppController::application:willFinishLaunchingWithOptions:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:285"]
  T4["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S4 -->|calls| T4
  S5["method:UnityAppController::application:willFinishLaunchingWithOptions:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:285"]
  T5["method:UnityAppController::initUnityApplicationNoGraphics<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:366"]
  S5 -->|calls| T5
  S6["method:UnityAppController::initUnityApplicationNoGraphics<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:366"]
  T6["function:UnityDataBundleDir<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:12"]
  S6 -->|calls| T6
  S7["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T7["method:UnityAppController::initUnityApplicationNoGraphics<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:366"]
  S7 -->|calls| T7
  S8["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T8["method:UnityAppController::selectRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:128"]
  S8 -->|calls| T8
  S9["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T9["method:UnityAppController::init<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:90"]
  S9 -->|calls| T9
  S10["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T10["method:UnityAppController::createUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:43"]
  S10 -->|calls| T10
  S11["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T11["method:DisplayManager::Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:451"]
  S11 -->|calls| T11
  S12["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T12["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S12 -->|calls| T12
  S13["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T13["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  S13 -->|calls| T13
  S14["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T14["method:UnityAppController::preStartUnity<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:115"]
  S14 -->|calls| T14
  S15["method:UnityAppController::initUnityWithApplication:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:374"]
  T15["method:KeyboardDelegate::Initialize<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:258"]
  S15 -->|calls| T15
  S16["method:UnityAppController::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:416"]
  T16["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S16 -->|calls| T16
  S17["method:UnityAppController::applicationWillEnterForeground:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:429"]
  T17["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S17 -->|calls| T17
  S18["method:UnityAppController::applicationDidBecomeActive:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:441"]
  T18["method:UnityAppController::removeSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:496"]
  S18 -->|calls| T18
  S19["method:UnityAppController::applicationDidBecomeActive:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:441"]
  T19["function:UnityIsFullScreenPlaying<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:259"]
  S19 -->|calls| T19
  S20["method:UnityAppController::applicationDidBecomeActive:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:441"]
  T20["function:TryResumeFullScreenVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:264"]
  S20 -->|calls| T20
  S21["method:UnityAppController::updateUnityAudioOutput<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:471"]
  T21["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S21 -->|calls| T21
  S22["method:UnityAppController::addSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:476"]
  T22["method:UnityAppController::createSnapshotView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:127"]
  S22 -->|calls| T22
  S23["method:UnityAppController::addSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:476"]
  T23["function:AllocUnityViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:79"]
  S23 -->|calls| T23
  S24["method:UnityAppController::removeSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:496"]
  T24["method:KeyboardDelegate::becomeFirstResponder<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:119"]
  S24 -->|calls| T24
  S25["method:UnityAppController::removeSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:496"]
  T25["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

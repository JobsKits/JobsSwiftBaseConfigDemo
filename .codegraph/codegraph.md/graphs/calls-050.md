# `calls 符号关系 - 050`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityAppController::applicationWillResignActive:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:519"]
  T1["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  S1 -->|calls| T1
  S2["method:UnityAppController::applicationWillResignActive:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:519"]
  T2["method:UnityAppController::addSnapshotViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:476"]
  S2 -->|calls| T2
  S3["method:UnityAppController::applicationWillTerminate:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:560"]
  T3["function:UnityAppController::UnityCleanupTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:176"]
  S3 -->|calls| T3
  S4["method:UnityAppController::application:handleEventsForBackgroundURLSession:completionHandler:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:579"]
  T4["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  S4 -->|calls| T4
  S5["function:AppController_SendNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:588"]
  T5["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S5 -->|calls| T5
  S6["function:AppController_SendNotificationWithArg<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:593"]
  T6["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S6 -->|calls| T6
  S7["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  T7["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S7 -->|calls| T7
  S8["function:UnityGetMainWindow<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:603"]
  T8["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S8 -->|calls| T8
  S9["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  T9["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S9 -->|calls| T9
  S10["function:UnityGetUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:605"]
  T10["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S10 -->|calls| T10
  S11["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  T11["function:UnityGetUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:605"]
  S11 -->|calls| T11
  S12["function:UnityCurrentOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:609"]
  T12["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S12 -->|calls| T12
  S13["function:UnityInitTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:656"]
  T13["function:InitCrashHandling<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:99"]
  S13 -->|calls| T13
  S14["function:UnityInitTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:656"]
  T14["function:AddNewAPIImplIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:697"]
  S14 -->|calls| T14
  S15["function:UnityInitTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:656"]
  T15["function:isDebuggerAttachedToConsole<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:621"]
  S15 -->|calls| T15
  S16["function:VecMagnitude<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:13"]
  T16["function:VecDotProduct<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:8"]
  S16 -->|calls| T16
  S17["function:VecCrossProduct<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:24"]
  T17["function:VecMake<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:18"]
  S17 -->|calls| T17
  S18["function:VecScale<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:32"]
  T18["function:VecMake<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:18"]
  S18 -->|calls| T18
  S19["function:VecNormalize<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:37"]
  T19["function:VecScale<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:32"]
  S19 -->|calls| T19
  S20["function:VecNormalize<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:37"]
  T20["function:VecMagnitude<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:13"]
  S20 -->|calls| T20
  S21["function:UnityReorientHeading<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:58"]
  T21["function:IsCompensatingSensors<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:55"]
  S21 -->|calls| T21
  S22["function:UnityReorientHeading<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:58"]
  T22["function:UnityCurrentOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:609"]
  S22 -->|calls| T22
  S23["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  T23["function:IsCompensatingSensors<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:55"]
  S23 -->|calls| T23
  S24["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  T24["function:UnityCurrentOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:609"]
  S24 -->|calls| T24
  S25["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  T25["function:IsCompensatingSensors<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:55"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

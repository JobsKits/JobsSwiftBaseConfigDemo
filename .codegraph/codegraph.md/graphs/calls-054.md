# `calls 符号关系 - 054`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:SetHeadingUpdatesEnabled<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:925"]
  T1["function:IsHeadingAvailable<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:977"]
  S1 -->|calls| T1
  S2["method:LocationServiceDelegate::locationManager:didUpdateHeading:<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1002"]
  T2["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S2 -->|calls| T2
  S3["method:LocationServiceDelegate::locationManager:didUpdateHeading:<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1002"]
  T3["function:UnityReorientHeading<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:58"]
  S3 -->|calls| T3
  S4["method:LocationServiceDelegate::locationManager:didUpdateHeading:<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1002"]
  T4["function:UnityReorientHeading<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:58"]
  S4 -->|calls| T4
  S5["function:QueryMicroController<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1033"]
  T5["function:QueryControllerCollection<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:428"]
  S5 -->|calls| T5
  S6["function:UnityGetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1060"]
  T6["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S6 -->|calls| T6
  S7["function:UnitySetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1071"]
  T7["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S7 -->|calls| T7
  S8["function:UnitySetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1071"]
  T8["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S8 -->|calls| T8
  S9["function:UnityGetAppleTVRemoteAllowRotation<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1087"]
  T9["function:QueryMicroController<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1033"]
  S9 -->|calls| T9
  S10["function:UnitySetAppleTVRemoteAllowRotation<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1096"]
  T10["function:QueryMicroController<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1033"]
  S10 -->|calls| T10
  S11["function:UnityGetAppleTVRemoteReportAbsoluteDpadValues<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1105"]
  T11["function:QueryMicroController<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1033"]
  S11 -->|calls| T11
  S12["function:UnitySetAppleTVRemoteReportAbsoluteDpadValues<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1114"]
  T12["function:QueryControllerCollection<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:428"]
  S12 -->|calls| T12
  S13["function:ReportSimulatedRemoteButtonPress<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1142"]
  T13["function:FakeRemoteStateSetButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1129"]
  S13 -->|calls| T13
  S14["function:ReportSimulatedRemoteButtonRelease<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1147"]
  T14["function:FakeRemoteStateSetButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1129"]
  S14 -->|calls| T14
  S15["function:ReportSimulatedRemoteTouchesBegan<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1158"]
  T15["function:ReportSimulatedRemoteTouchesMoved<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1163"]
  S15 -->|calls| T15
  S16["function:ReportSimulatedRemoteTouchesMoved<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1163"]
  T16["function:FakeRemoteMapTouchToAxis<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1152"]
  S16 -->|calls| T16
  S17["function:ReportSimulatedRemoteTouchesMoved<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1163"]
  T17["function:FakeRemoteMapTouchToAxis<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1152"]
  S17 -->|calls| T17
  S18["method:UnityFramework::getInstance<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:27"]
  T18["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S18 -->|calls| T18
  S19["method:UnityFramework::appController<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:36"]
  T19["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S19 -->|calls| T19
  S20["method:UnityFramework::setExecuteHeader:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:46"]
  T20["function:UnitySetExecuteMachHeader<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:13"]
  S20 -->|calls| T20
  S21["method:UnityFramework::frameworkWarmup:argv:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:74"]
  T21["function:UnityInitTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:656"]
  S21 -->|calls| T21
  S22["method:UnityFramework::frameworkWarmup:argv:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:74"]
  T22["function:RegisterFeatures<br/>TODO/Unity/xcode_effectTest/Libraries/RegisterFeatures.cpp:7"]
  S22 -->|calls| T22
  S23["method:UnityFramework::setDataBundleId:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:93"]
  T23["function:UnitySetDataBundleDirWithBundleId<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:6"]
  S23 -->|calls| T23
  S24["method:UnityFramework::runUIApplicationMainWithArgc:argv:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:98"]
  T24["method:UnityFramework::frameworkWarmup:argv:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:74"]
  S24 -->|calls| T24
  S25["method:UnityFramework::runEmbeddedWithArgc:argv:appLaunchOpts:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:105"]
  T25["method:CameraCaptureController::pause<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:373"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

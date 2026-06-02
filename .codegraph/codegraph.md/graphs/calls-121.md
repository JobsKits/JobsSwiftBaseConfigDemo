# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityGetAppleTVRemoteReportAbsoluteDpadValues<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1105"]
  T1["function:QueryMicroController<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1033"]
  S1 -->|calls| T1
  S2["function:UnitySetAppleTVRemoteReportAbsoluteDpadValues<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1114"]
  T2["function:QueryControllerCollection<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:428"]
  S2 -->|calls| T2
  S3["function:ReportSimulatedRemoteButtonPress<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1142"]
  T3["function:FakeRemoteStateSetButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1129"]
  S3 -->|calls| T3
  S4["function:ReportSimulatedRemoteButtonRelease<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1147"]
  T4["function:FakeRemoteStateSetButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1129"]
  S4 -->|calls| T4
  S5["function:ReportSimulatedRemoteTouchesBegan<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1158"]
  T5["function:ReportSimulatedRemoteTouchesMoved<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1163"]
  S5 -->|calls| T5
  S6["function:ReportSimulatedRemoteTouchesMoved<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1163"]
  T6["function:FakeRemoteMapTouchToAxis<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1152"]
  S6 -->|calls| T6
  S7["function:ReportSimulatedRemoteTouchesMoved<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1163"]
  T7["function:FakeRemoteMapTouchToAxis<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1152"]
  S7 -->|calls| T7
  S8["method:UnityFramework::getInstance<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:27"]
  T8["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S8 -->|calls| T8
  S9["method:UnityFramework::appController<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:36"]
  T9["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S9 -->|calls| T9
  S10["method:UnityFramework::setExecuteHeader:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:46"]
  T10["function:UnitySetExecuteMachHeader<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:13"]
  S10 -->|calls| T10
  S11["method:UnityFramework::frameworkWarmup:argv:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:74"]
  T11["function:UnityInitTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:656"]
  S11 -->|calls| T11
  S12["method:UnityFramework::frameworkWarmup:argv:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:74"]
  T12["function:RegisterFeatures<br/>TODO/Unity/xcode_effectTest/Libraries/RegisterFeatures.cpp:7"]
  S12 -->|calls| T12
  S13["method:UnityFramework::setDataBundleId:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:93"]
  T13["function:UnitySetDataBundleDirWithBundleId<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:6"]
  S13 -->|calls| T13
  S14["method:UnityFramework::runUIApplicationMainWithArgc:argv:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:98"]
  T14["method:UnityFramework::frameworkWarmup:argv:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:74"]
  S14 -->|calls| T14
  S15["method:UnityFramework::runEmbeddedWithArgc:argv:appLaunchOpts:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:105"]
  T15["method:CameraCaptureController::pause<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:373"]
  S15 -->|calls| T15
  S16["method:UnityFramework::runEmbeddedWithArgc:argv:appLaunchOpts:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:105"]
  T16["method:UnityFramework::showUnityWindow<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:148"]
  S16 -->|calls| T16
  S17["method:UnityFramework::runEmbeddedWithArgc:argv:appLaunchOpts:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:105"]
  T17["method:UnityFramework::frameworkWarmup:argv:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:74"]
  S17 -->|calls| T17
  S18["method:UnityFramework::runEmbeddedWithArgc:argv:appLaunchOpts:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:105"]
  T18["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S18 -->|calls| T18
  S19["method:UnityFramework::runEmbeddedWithArgc:argv:appLaunchOpts:<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:105"]
  T19["method:AppDelegate::application<br/>my_flutter/ios/Runner/AppDelegate.swift:6"]
  S19 -->|calls| T19
  S20["method:UnityFramework::showUnityWindow<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:148"]
  T20["method:UnityAppController::window<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:111"]
  S20 -->|calls| T20
  S21["method:UnityFramework::showUnityWindow<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:148"]
  T21["method:UnityFramework::appController<br/>TODO/Unity/xcode_effectTest/Classes/main.mm:36"]
  S21 -->|calls| T21
  S22["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CappedSemaphore.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CappedSemaphore.h:1"]
  T22["function:Baselib_CappedSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:143"]
  S22 -->|calls| T22
  S23["function:Baselib_CountdownTimer_StartMs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:23"]
  T23["function:Detail_MillisecondsToTicks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:12"]
  S23 -->|calls| T23
  S24["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  T24["function:Baselib_CountdownTimer_GetTimeLeftInTicks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:39"]
  S24 -->|calls| T24
  S25["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  T25["function:Detail_TicksToMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

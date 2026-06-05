# `calls 符号关系 - 043`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityReplayKit::startBroadcastingWithCallback:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:353"]
  T1["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S1 -->|calls| T1
  S2["method:UnityReplayKit::startBroadcastingWithCallback:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:353"]
  T2["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S2 -->|calls| T2
  S3["method:UnityReplayKit::startBroadcastingWithCallback:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:353"]
  T3["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S3 -->|calls| T3
  S4["method:UnityReplayKit::isCameraEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:455"]
  T4["method:UnityReplayKit::apiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:133"]
  S4 -->|calls| T4
  S5["method:UnityReplayKit::setCameraEnabled:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:471"]
  T5["method:UnityReplayKit::apiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:133"]
  S5 -->|calls| T5
  S6["method:UnityReplayKit::isMicrophoneEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:487"]
  T6["method:UnityReplayKit::apiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:133"]
  S6 -->|calls| T6
  S7["method:UnityReplayKit::setMicrophoneEnabled:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:503"]
  T7["method:UnityReplayKit::apiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:133"]
  S7 -->|calls| T7
  S8["method:UnityReplayKit::showCameraPreviewAt:width:height:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:519"]
  T8["method:UnityReplayKit::apiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:133"]
  S8 -->|calls| T8
  S9["method:UnityReplayKit::showCameraPreviewAt:width:height:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:519"]
  T9["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S9 -->|calls| T9
  S10["function:InitUnityReplayKit<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:563"]
  T10["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S10 -->|calls| T10
  S11["function:UnityReplayKitAPIAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:12"]
  T11["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S11 -->|calls| T11
  S12["function:UnityReplayKitRecordingAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:17"]
  T12["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S12 -->|calls| T12
  S13["function:UnityReplayKitIsCameraEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:22"]
  T13["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S13 -->|calls| T13
  S14["function:UnityReplayKitSetCameraEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:27"]
  T14["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S14 -->|calls| T14
  S15["function:UnityReplayKitSetCameraEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:27"]
  T15["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S15 -->|calls| T15
  S16["function:UnityReplayKitIsMicrophoneEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:34"]
  T16["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S16 -->|calls| T16
  S17["function:UnityReplayKitSetMicrophoneEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:39"]
  T17["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S17 -->|calls| T17
  S18["function:UnityReplayKitSetMicrophoneEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:39"]
  T18["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S18 -->|calls| T18
  S19["function:UnityReplayKitSetMicrophoneEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:39"]
  T19["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S19 -->|calls| T19
  S20["function:UnityReplayKitLastError<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:52"]
  T20["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S20 -->|calls| T20
  S21["function:UnityReplayKitLastError<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:52"]
  T21["function:strdup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:520"]
  S21 -->|calls| T21
  S22["function:UnityReplayKitStartRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:67"]
  T22["method:UnityReplayKit::startRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:143"]
  S22 -->|calls| T22
  S23["function:UnityReplayKitStartRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:67"]
  T23["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S23 -->|calls| T23
  S24["function:UnityReplayKitIsRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:72"]
  T24["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S24 -->|calls| T24
  S25["function:UnityReplayKitShowCameraPreviewAt<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:77"]
  T25["function:UnityScreenScaleFactor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:706"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

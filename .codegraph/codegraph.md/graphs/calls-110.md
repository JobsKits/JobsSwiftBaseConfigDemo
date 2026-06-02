# `calls 符号关系 - 110`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityReplayKitAPIAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:12"]
  T1["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S1 -->|calls| T1
  S2["function:UnityReplayKitRecordingAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:17"]
  T2["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S2 -->|calls| T2
  S3["function:UnityReplayKitIsCameraEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:22"]
  T3["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S3 -->|calls| T3
  S4["function:UnityReplayKitSetCameraEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:27"]
  T4["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S4 -->|calls| T4
  S5["function:UnityReplayKitSetCameraEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:27"]
  T5["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S5 -->|calls| T5
  S6["function:UnityReplayKitIsMicrophoneEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:34"]
  T6["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S6 -->|calls| T6
  S7["function:UnityReplayKitSetMicrophoneEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:39"]
  T7["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S7 -->|calls| T7
  S8["function:UnityReplayKitSetMicrophoneEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:39"]
  T8["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S8 -->|calls| T8
  S9["function:UnityReplayKitSetMicrophoneEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:39"]
  T9["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S9 -->|calls| T9
  S10["function:UnityReplayKitLastError<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:52"]
  T10["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S10 -->|calls| T10
  S11["function:UnityReplayKitLastError<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:52"]
  T11["function:strdup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:520"]
  S11 -->|calls| T11
  S12["function:UnityReplayKitStartRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:67"]
  T12["method:UnityReplayKit::startRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:143"]
  S12 -->|calls| T12
  S13["function:UnityReplayKitStartRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:67"]
  T13["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S13 -->|calls| T13
  S14["function:UnityReplayKitIsRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:72"]
  T14["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S14 -->|calls| T14
  S15["function:UnityReplayKitShowCameraPreviewAt<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:77"]
  T15["function:UnityScreenScaleFactor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:706"]
  S15 -->|calls| T15
  S16["function:UnityReplayKitShowCameraPreviewAt<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:77"]
  T16["method:UnityReplayKit::showCameraPreviewAt:width:height:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:519"]
  S16 -->|calls| T16
  S17["function:UnityReplayKitShowCameraPreviewAt<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:77"]
  T17["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S17 -->|calls| T17
  S18["function:UnityReplayKitHideCameraPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:88"]
  T18["method:UnityReplayKit::hideCameraPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:551"]
  S18 -->|calls| T18
  S19["function:UnityReplayKitHideCameraPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:88"]
  T19["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S19 -->|calls| T19
  S20["function:UnityReplayKitStopRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:93"]
  T20["function:UnityReplayKitHideCameraPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:88"]
  S20 -->|calls| T20
  S21["function:UnityReplayKitStopRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:93"]
  T21["function:UnityReplayKitSetCameraEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:27"]
  S21 -->|calls| T21
  S22["function:UnityReplayKitStopRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:93"]
  T22["method:UnityReplayKit::stopRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:180"]
  S22 -->|calls| T22
  S23["function:UnityReplayKitStopRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:93"]
  T23["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S23 -->|calls| T23
  S24["function:UnityReplayKitDiscard<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:102"]
  T24["method:UnityReplayKit::discardPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:237"]
  S24 -->|calls| T24
  S25["function:UnityReplayKitDiscard<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:102"]
  T25["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

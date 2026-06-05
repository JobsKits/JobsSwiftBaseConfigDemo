# `calls 符号关系 - 044`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityReplayKitShowCameraPreviewAt<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:77"]
  T1["method:UnityReplayKit::showCameraPreviewAt:width:height:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:519"]
  S1 -->|calls| T1
  S2["function:UnityReplayKitShowCameraPreviewAt<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:77"]
  T2["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S2 -->|calls| T2
  S3["function:UnityReplayKitHideCameraPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:88"]
  T3["method:UnityReplayKit::hideCameraPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:551"]
  S3 -->|calls| T3
  S4["function:UnityReplayKitHideCameraPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:88"]
  T4["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S4 -->|calls| T4
  S5["function:UnityReplayKitStopRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:93"]
  T5["function:UnityReplayKitHideCameraPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:88"]
  S5 -->|calls| T5
  S6["function:UnityReplayKitStopRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:93"]
  T6["function:UnityReplayKitSetCameraEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:27"]
  S6 -->|calls| T6
  S7["function:UnityReplayKitStopRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:93"]
  T7["method:UnityReplayKit::stopRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:180"]
  S7 -->|calls| T7
  S8["function:UnityReplayKitStopRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:93"]
  T8["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S8 -->|calls| T8
  S9["function:UnityReplayKitDiscard<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:102"]
  T9["method:UnityReplayKit::discardPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:237"]
  S9 -->|calls| T9
  S10["function:UnityReplayKitDiscard<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:102"]
  T10["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S10 -->|calls| T10
  S11["function:UnityReplayKitPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:107"]
  T11["method:UnityReplayKit::showPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:218"]
  S11 -->|calls| T11
  S12["function:UnityReplayKitPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:107"]
  T12["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S12 -->|calls| T12
  S13["function:UnityReplayKitBroadcastingAPIAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:112"]
  T13["method:UnityReplayKit::broadcastingApiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:282"]
  S13 -->|calls| T13
  S14["function:UnityReplayKitBroadcastingAPIAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:112"]
  T14["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S14 -->|calls| T14
  S15["function:UnityReplayKitStartBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:117"]
  T15["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S15 -->|calls| T15
  S16["function:UnityReplayKitStopBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:122"]
  T16["function:UnityReplayKitHideCameraPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:88"]
  S16 -->|calls| T16
  S17["function:UnityReplayKitStopBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:122"]
  T17["method:UnityReplayKit::stopBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:416"]
  S17 -->|calls| T17
  S18["function:UnityReplayKitStopBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:122"]
  T18["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S18 -->|calls| T18
  S19["function:UnityReplayKitPauseBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:130"]
  T19["method:UnityReplayKit::pauseBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:435"]
  S19 -->|calls| T19
  S20["function:UnityReplayKitPauseBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:130"]
  T20["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S20 -->|calls| T20
  S21["function:UnityReplayKitResumeBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:135"]
  T21["method:UnityReplayKit::resumeBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:445"]
  S21 -->|calls| T21
  S22["function:UnityReplayKitResumeBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:135"]
  T22["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S22 -->|calls| T22
  S23["function:UnityReplayKitIsBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:140"]
  T23["method:UnityReplayKit::isBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:297"]
  S23 -->|calls| T23
  S24["function:UnityReplayKitIsBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:140"]
  T24["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S24 -->|calls| T24
  S25["function:UnityReplayKitIsBroadcastingPaused<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:145"]
  T25["method:UnityReplayKit::isBroadcastingPaused<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:306"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 109`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T1["function:CreateReadableRTFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:77"]
  S1 -->|calls| T1
  S2["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T2["function:GetCVPixelFormatForSurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:51"]
  S2 -->|calls| T2
  S3["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T3["function:GetMetalTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:51"]
  S3 -->|calls| T3
  S4["function:CreateSharedDepthbufferMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:235"]
  T4["function:DestroySharedDepthbufferMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:264"]
  S4 -->|calls| T4
  S5["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  T5["function:strdup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:520"]
  S5 -->|calls| T5
  S6["method:UnityReplayKit::createOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:115"]
  T6["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S6 -->|calls| T6
  S7["method:UnityReplayKit::startRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:143"]
  T7["method:UnityReplayKit::shouldCreateOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:110"]
  S7 -->|calls| T7
  S8["method:UnityReplayKit::showPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:218"]
  T8["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S8 -->|calls| T8
  S9["method:UnityReplayKit::broadcastURL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:288"]
  T9["method:UnityReplayKit::broadcastURL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:288"]
  S9 -->|calls| T9
  S10["method:UnityReplayKit::isBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:297"]
  T10["method:UnityReplayKit::isBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:297"]
  S10 -->|calls| T10
  S11["method:UnityReplayKit::isBroadcastingPaused<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:306"]
  T11["method:UnityReplayKit::isBroadcastingPaused<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:306"]
  S11 -->|calls| T11
  S12["method:UnityReplayKit::broadcastActivityViewController:didFinishWithBroadcastController:error:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:315"]
  T12["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S12 -->|calls| T12
  S13["method:UnityReplayKit::broadcastActivityViewController:didFinishWithBroadcastController:error:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:315"]
  T13["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S13 -->|calls| T13
  S14["method:UnityReplayKit::startBroadcastingWithCallback:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:353"]
  T14["method:UnityReplayKit::shouldCreateOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:110"]
  S14 -->|calls| T14
  S15["method:UnityReplayKit::startBroadcastingWithCallback:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:353"]
  T15["function:UnityiOS130orNewer<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:690"]
  S15 -->|calls| T15
  S16["method:UnityReplayKit::startBroadcastingWithCallback:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:353"]
  T16["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S16 -->|calls| T16
  S17["method:UnityReplayKit::startBroadcastingWithCallback:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:353"]
  T17["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S17 -->|calls| T17
  S18["method:UnityReplayKit::startBroadcastingWithCallback:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:353"]
  T18["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S18 -->|calls| T18
  S19["method:UnityReplayKit::isCameraEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:455"]
  T19["method:UnityReplayKit::apiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:133"]
  S19 -->|calls| T19
  S20["method:UnityReplayKit::setCameraEnabled:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:471"]
  T20["method:UnityReplayKit::apiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:133"]
  S20 -->|calls| T20
  S21["method:UnityReplayKit::isMicrophoneEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:487"]
  T21["method:UnityReplayKit::apiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:133"]
  S21 -->|calls| T21
  S22["method:UnityReplayKit::setMicrophoneEnabled:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:503"]
  T22["method:UnityReplayKit::apiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:133"]
  S22 -->|calls| T22
  S23["method:UnityReplayKit::showCameraPreviewAt:width:height:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:519"]
  T23["method:UnityReplayKit::apiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:133"]
  S23 -->|calls| T23
  S24["method:UnityReplayKit::showCameraPreviewAt:width:height:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:519"]
  T24["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S24 -->|calls| T24
  S25["function:InitUnityReplayKit<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:563"]
  T25["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 042`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T1["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S1 -->|calls| T1
  S2["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T2["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S2 -->|calls| T2
  S3["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T3["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S3 -->|calls| T3
  S4["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T4["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S4 -->|calls| T4
  S5["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T5["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S5 -->|calls| T5
  S6["function:CreateSystemRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:63"]
  T6["function:DestroySystemRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:314"]
  S6 -->|calls| T6
  S7["function:CreateSystemRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:63"]
  T7["function:GetColorFormatForSurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:20"]
  S7 -->|calls| T7
  S8["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T8["function:DestroyRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:219"]
  S8 -->|calls| T8
  S9["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T9["function:GetColorFormatForSurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:20"]
  S9 -->|calls| T9
  S10["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T10["function:CreateCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:7"]
  S10 -->|calls| T10
  S11["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T11["function:CreateReadableRTFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:77"]
  S11 -->|calls| T11
  S12["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T12["function:GetCVPixelFormatForSurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:51"]
  S12 -->|calls| T12
  S13["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T13["function:GetMetalTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:51"]
  S13 -->|calls| T13
  S14["function:CreateSharedDepthbufferMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:235"]
  T14["function:DestroySharedDepthbufferMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:264"]
  S14 -->|calls| T14
  S15["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  T15["function:strdup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:520"]
  S15 -->|calls| T15
  S16["method:UnityReplayKit::createOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:115"]
  T16["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S16 -->|calls| T16
  S17["method:UnityReplayKit::startRecording<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:143"]
  T17["method:UnityReplayKit::shouldCreateOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:110"]
  S17 -->|calls| T17
  S18["method:UnityReplayKit::showPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:218"]
  T18["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S18 -->|calls| T18
  S19["method:UnityReplayKit::broadcastURL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:288"]
  T19["method:UnityReplayKit::broadcastURL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:288"]
  S19 -->|calls| T19
  S20["method:UnityReplayKit::isBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:297"]
  T20["method:UnityReplayKit::isBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:297"]
  S20 -->|calls| T20
  S21["method:UnityReplayKit::isBroadcastingPaused<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:306"]
  T21["method:UnityReplayKit::isBroadcastingPaused<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:306"]
  S21 -->|calls| T21
  S22["method:UnityReplayKit::broadcastActivityViewController:didFinishWithBroadcastController:error:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:315"]
  T22["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S22 -->|calls| T22
  S23["method:UnityReplayKit::broadcastActivityViewController:didFinishWithBroadcastController:error:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:315"]
  T23["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S23 -->|calls| T23
  S24["method:UnityReplayKit::startBroadcastingWithCallback:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:353"]
  T24["method:UnityReplayKit::shouldCreateOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:110"]
  S24 -->|calls| T24
  S25["method:UnityReplayKit::startBroadcastingWithCallback:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:353"]
  T25["function:UnityiOS130orNewer<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:690"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

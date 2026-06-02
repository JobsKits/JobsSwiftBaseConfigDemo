# `calls 符号关系 - 106`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:AVKitVideoPlayback::animationControllerForDismissedController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:171"]
  T1["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S1 -->|calls| T1
  S2["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  T2["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S2 -->|calls| T2
  S3["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  T3["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S3 -->|calls| T3
  S4["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  T4["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S4 -->|calls| T4
  S5["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  T5["method:VideoPlayer::unloadPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:160"]
  S5 -->|calls| T5
  S6["function:UnityPlayFullScreenVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:220"]
  T6["function:UnityDataBundleDir<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:12"]
  S6 -->|calls| T6
  S7["function:UnityPlayFullScreenVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:220"]
  T7["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S7 -->|calls| T7
  S8["function:UnityPlayFullScreenVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:220"]
  T8["method:AVKitVideoPlayback::initAndPlay:bgColor:showControls:videoGravity:cancelOnTouch:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:69"]
  S8 -->|calls| T8
  S9["function:UnityStopFullScreenVideoIfPlaying<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:253"]
  T9["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S9 -->|calls| T9
  S10["function:TryResumeFullScreenVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:264"]
  T10["method:AVKitVideoPlayback::onPlayerTryResume<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:160"]
  S10 -->|calls| T10
  S11["function:(IUnityGraphics)<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityGraphics.h:45"]
  T11["enum:UnityGfxRenderer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityGraphics.h:11"]
  S11 -->|calls| T11
  S12["function:(IUnityGraphicsMetalV2)<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityGraphicsMetal.h:25"]
  T12["type_alias:UnityRenderBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:205"]
  S12 -->|calls| T12
  S13["function:(IUnityGraphicsMetalV1)<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityGraphicsMetal.h:68"]
  T13["type_alias:UnityRenderBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:205"]
  S13 -->|calls| T13
  S14["function:(IUnityGraphicsMetal)<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityGraphicsMetal.h:101"]
  T14["type_alias:UnityRenderBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:205"]
  S14 -->|calls| T14
  S15["function:operator==<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:73"]
  T15["method:UnityInterfaceGUID::Equals<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:66"]
  S15 -->|calls| T15
  S16["function:operator!=<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:74"]
  T16["method:UnityInterfaceGUID::Equals<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:66"]
  S16 -->|calls| T16
  S17["function:operator<<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:75"]
  T17["method:UnityInterfaceGUID::LessThan<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:67"]
  S17 -->|calls| T17
  S18["function:operator><br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:76"]
  T18["method:UnityInterfaceGUID::LessThan<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:67"]
  S18 -->|calls| T18
  S19["function:Profiler_InitProfiler<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:111"]
  T19["function:Profiler_SetupScriptingProfile<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:368"]
  S19 -->|calls| T19
  S20["function:Profiler_InitProfiler<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:111"]
  T20["function:ProfilerInit<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:20"]
  S20 -->|calls| T20
  S21["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T21["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S21 -->|calls| T21
  S22["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T22["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S22 -->|calls| T22
  S23["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T23["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S23 -->|calls| T23
  S24["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T24["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S24 -->|calls| T24
  S25["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T25["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

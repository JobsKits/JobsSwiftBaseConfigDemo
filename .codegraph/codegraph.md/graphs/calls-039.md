# `calls 符号关系 - 039`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:AVKitVideoPlayback::actuallyStartTheMovie:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:90"]
  T1["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S1 -->|calls| T1
  S2["method:AVKitVideoPlayback::handleTap:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:128"]
  T2["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S2 -->|calls| T2
  S3["method:AVKitVideoPlayback::onPlayerReady<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:134"]
  T3["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S3 -->|calls| T3
  S4["method:AVKitVideoPlayback::onPlayerReady<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:134"]
  T4["method:VideoPlayer::playVideoPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:216"]
  S4 -->|calls| T4
  S5["method:AVKitVideoPlayback::onPlayerReady<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:134"]
  T5["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S5 -->|calls| T5
  S6["method:AVKitVideoPlayback::onPlayerReady<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:134"]
  T6["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S6 -->|calls| T6
  S7["method:AVKitVideoPlayback::onPlayerDidFinishPlayingVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:155"]
  T7["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S7 -->|calls| T7
  S8["method:AVKitVideoPlayback::onPlayerTryResume<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:160"]
  T8["method:VideoPlayer::isPlaying<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:221"]
  S8 -->|calls| T8
  S9["method:AVKitVideoPlayback::onPlayerTryResume<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:160"]
  T9["method:VideoPlayer::resume<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:228"]
  S9 -->|calls| T9
  S10["method:AVKitVideoPlayback::onPlayerError:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:166"]
  T10["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S10 -->|calls| T10
  S11["method:AVKitVideoPlayback::animationControllerForDismissedController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:171"]
  T11["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S11 -->|calls| T11
  S12["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  T12["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S12 -->|calls| T12
  S13["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  T13["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S13 -->|calls| T13
  S14["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  T14["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S14 -->|calls| T14
  S15["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  T15["method:VideoPlayer::unloadPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:160"]
  S15 -->|calls| T15
  S16["function:UnityPlayFullScreenVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:220"]
  T16["function:UnityDataBundleDir<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:12"]
  S16 -->|calls| T16
  S17["function:UnityPlayFullScreenVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:220"]
  T17["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S17 -->|calls| T17
  S18["function:UnityPlayFullScreenVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:220"]
  T18["method:AVKitVideoPlayback::initAndPlay:bgColor:showControls:videoGravity:cancelOnTouch:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:69"]
  S18 -->|calls| T18
  S19["function:UnityStopFullScreenVideoIfPlaying<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:253"]
  T19["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S19 -->|calls| T19
  S20["function:TryResumeFullScreenVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:264"]
  T20["method:AVKitVideoPlayback::onPlayerTryResume<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:160"]
  S20 -->|calls| T20
  S21["function:(IUnityGraphics)<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityGraphics.h:45"]
  T21["enum:UnityGfxRenderer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityGraphics.h:11"]
  S21 -->|calls| T21
  S22["function:(IUnityGraphicsMetalV2)<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityGraphicsMetal.h:25"]
  T22["type_alias:UnityRenderBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:205"]
  S22 -->|calls| T22
  S23["function:(IUnityGraphicsMetalV1)<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityGraphicsMetal.h:68"]
  T23["type_alias:UnityRenderBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:205"]
  S23 -->|calls| T23
  S24["function:(IUnityGraphicsMetal)<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityGraphicsMetal.h:101"]
  T24["type_alias:UnityRenderBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:205"]
  S24 -->|calls| T24
  S25["function:operator==<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:73"]
  T25["method:UnityInterfaceGUID::Equals<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:66"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

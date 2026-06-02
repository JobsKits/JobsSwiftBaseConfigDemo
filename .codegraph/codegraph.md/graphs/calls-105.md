# `calls 符号关系 - 105`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T1["property:DisplayConnection::view<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:31"]
  S1 -->|calls| T1
  S2["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T2["property:DisplayManager::mainDisplay<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:57"]
  S2 -->|calls| T2
  S3["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T3["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S3 -->|calls| T3
  S4["function:UnityStartFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:782"]
  T4["method:DisplayManager::startFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:409"]
  S4 -->|calls| T4
  S5["function:UnityStartFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:782"]
  T5["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S5 -->|calls| T5
  S6["function:UnityDestroyUnityRenderSurfaces<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:787"]
  T6["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S6 -->|calls| T6
  S7["function:UnityDataBundleDir<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:12"]
  T7["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S7 -->|calls| T7
  S8["function:UnityDataBundleDir<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:12"]
  T8["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S8 -->|calls| T8
  S9["function:UnityFontFallbacks<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:65"]
  T9["function:UnitySystemLanguage<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:229"]
  S9 -->|calls| T9
  S10["function:AVKitVideoPlayback::supportedInterfaceOrientations_DefaultImpl<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:43"]
  T10["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S10 -->|calls| T10
  S11["function:AVKitVideoPlayback::prefersStatusBarHidden_DefaultImpl<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:48"]
  T11["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S11 -->|calls| T11
  S12["method:AVKitVideoPlayback::initAndPlay:bgColor:showControls:videoGravity:cancelOnTouch:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:69"]
  T12["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S12 -->|calls| T12
  S13["method:AVKitVideoPlayback::dealloc<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:85"]
  T13["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S13 -->|calls| T13
  S14["method:AVKitVideoPlayback::actuallyStartTheMovie:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:90"]
  T14["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S14 -->|calls| T14
  S15["method:AVKitVideoPlayback::actuallyStartTheMovie:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:90"]
  T15["function:UnityGetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1060"]
  S15 -->|calls| T15
  S16["method:AVKitVideoPlayback::actuallyStartTheMovie:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:90"]
  T16["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S16 -->|calls| T16
  S17["method:AVKitVideoPlayback::handleTap:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:128"]
  T17["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S17 -->|calls| T17
  S18["method:AVKitVideoPlayback::onPlayerReady<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:134"]
  T18["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S18 -->|calls| T18
  S19["method:AVKitVideoPlayback::onPlayerReady<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:134"]
  T19["method:VideoPlayer::playVideoPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:216"]
  S19 -->|calls| T19
  S20["method:AVKitVideoPlayback::onPlayerReady<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:134"]
  T20["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S20 -->|calls| T20
  S21["method:AVKitVideoPlayback::onPlayerReady<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:134"]
  T21["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S21 -->|calls| T21
  S22["method:AVKitVideoPlayback::onPlayerDidFinishPlayingVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:155"]
  T22["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S22 -->|calls| T22
  S23["method:AVKitVideoPlayback::onPlayerTryResume<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:160"]
  T23["method:VideoPlayer::isPlaying<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:221"]
  S23 -->|calls| T23
  S24["method:AVKitVideoPlayback::onPlayerTryResume<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:160"]
  T24["method:VideoPlayer::resume<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:228"]
  S24 -->|calls| T24
  S25["method:AVKitVideoPlayback::onPlayerError:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:166"]
  T25["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

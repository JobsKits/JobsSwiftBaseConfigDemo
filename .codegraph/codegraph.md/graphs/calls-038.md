# `calls 符号关系 - 038`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityActivateScreenForRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:690"]
  T1["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S1 -->|calls| T1
  S2["function:UnityActivateScreenForRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:690"]
  T2["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S2 -->|calls| T2
  S3["function:UnityActivateScreenForRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:690"]
  T3["function:EnsureDisplayIsInited<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:538"]
  S3 -->|calls| T3
  S4["function:UnityStartFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:737"]
  T4["method:DisplayManager::startFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:409"]
  S4 -->|calls| T4
  S5["function:UnityStartFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:737"]
  T5["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S5 -->|calls| T5
  S6["function:UnityDestroyUnityRenderSurfaces<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:742"]
  T6["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S6 -->|calls| T6
  S7["function:UnityDestroyUnityRenderSurfaces<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:742"]
  T7["method:DisplayConnection::destroySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:231"]
  S7 -->|calls| T7
  S8["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T8["property:DisplayConnection::screen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:28"]
  S8 -->|calls| T8
  S9["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T9["property:DisplayManager::mainDisplay<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:57"]
  S9 -->|calls| T9
  S10["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T10["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S10 -->|calls| T10
  S11["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T11["property:DisplayConnection::view<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:31"]
  S11 -->|calls| T11
  S12["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T12["property:DisplayManager::mainDisplay<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:57"]
  S12 -->|calls| T12
  S13["function:UnityIsFullscreen<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:768"]
  T13["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S13 -->|calls| T13
  S14["function:UnityStartFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:782"]
  T14["method:DisplayManager::startFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:409"]
  S14 -->|calls| T14
  S15["function:UnityStartFrameRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:782"]
  T15["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S15 -->|calls| T15
  S16["function:UnityDestroyUnityRenderSurfaces<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:787"]
  T16["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S16 -->|calls| T16
  S17["function:UnityDataBundleDir<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:12"]
  T17["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S17 -->|calls| T17
  S18["function:UnityDataBundleDir<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:12"]
  T18["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S18 -->|calls| T18
  S19["function:UnityFontFallbacks<br/>TODO/Unity/xcode_effectTest/Classes/Unity/Filesystem.mm:65"]
  T19["function:UnitySystemLanguage<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:229"]
  S19 -->|calls| T19
  S20["function:AVKitVideoPlayback::supportedInterfaceOrientations_DefaultImpl<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:43"]
  T20["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S20 -->|calls| T20
  S21["function:AVKitVideoPlayback::prefersStatusBarHidden_DefaultImpl<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:48"]
  T21["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S21 -->|calls| T21
  S22["method:AVKitVideoPlayback::initAndPlay:bgColor:showControls:videoGravity:cancelOnTouch:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:69"]
  T22["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S22 -->|calls| T22
  S23["method:AVKitVideoPlayback::dealloc<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:85"]
  T23["method:AVKitVideoPlayback::finish<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:181"]
  S23 -->|calls| T23
  S24["method:AVKitVideoPlayback::actuallyStartTheMovie:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:90"]
  T24["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S24 -->|calls| T24
  S25["method:AVKitVideoPlayback::actuallyStartTheMovie:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:90"]
  T25["function:UnityGetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1060"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

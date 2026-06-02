# `calls 符号关系 - 113`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:VideoPlayer::curFrameTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:245"]
  T1["function:CMVideoSampling_SampleBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:71"]
  S1 -->|calls| T1
  S2["method:VideoPlayer::playerItemDidReachEnd:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:317"]
  T2["method:AVKitVideoPlayback::onPlayerDidFinishPlayingVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:155"]
  S2 -->|calls| T2
  S3["method:VideoPlayer::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:328"]
  T3["method:VideoPlayer::duration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:66"]
  S3 -->|calls| T3
  S4["method:VideoPlayer::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:328"]
  T4["method:VideoPlayer::reportError:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:100"]
  S4 -->|calls| T4
  S5["method:VideoPlayer::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:328"]
  T5["method:VideoPlayer::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:328"]
  S5 -->|calls| T5
  S6["method:VideoPlayer::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:328"]
  T6["method:AVKitVideoPlayback::onPlayerReady<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:134"]
  S6 -->|calls| T6
  S7["method:VideoPlayer::prepareAsset:withKeys:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:381"]
  T7["method:VideoPlayer::reportError:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:100"]
  S7 -->|calls| T7
  S8["method:VideoPlayer::prepareAsset:withKeys:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:381"]
  T8["method:VideoPlayer::reportErrorWithString:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:107"]
  S8 -->|calls| T8
  S9["method:VideoPlayer::prepareAsset:withKeys:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:381"]
  T9["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S9 -->|calls| T9
  S10["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T10["method:VideoPlayer::cleanupAssetReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:133"]
  S10 -->|calls| T10
  S11["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T11["method:VideoPlayer::reportErrorWithString:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:107"]
  S11 -->|calls| T11
  S12["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T12["method:VideoPlayer::reportError:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:100"]
  S12 -->|calls| T12
  S13["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T13["method:VideoPlayer::reportErrorWithString:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:107"]
  S13 -->|calls| T13
  S14["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T14["method:VideoPlayer::reportError:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:100"]
  S14 -->|calls| T14
  S15["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T15["method:VideoPlayer::cleanupCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:123"]
  S15 -->|calls| T15
  S16["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T16["function:CMVideoSampling_Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:8"]
  S16 -->|calls| T16
  S17["method:UnityAppController::repaintDisplayLink<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:38"]
  T17["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  S17 -->|calls| T17
  S18["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  T18["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  S18 -->|calls| T18
  S19["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  T19["method:UnityView::recreateRenderingSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:106"]
  S19 -->|calls| T19
  S20["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  T20["method:UnityView::processKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:244"]
  S20 -->|calls| T20
  S21["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  T21["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  S21 -->|calls| T21
  S22["method:UnityAppController::callbackGfxInited<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:63"]
  T22["method:UnityAppController::shouldAttachRenderDelegate<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:114"]
  S22 -->|calls| T22
  S23["method:UnityAppController::callbackGfxInited<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:63"]
  T23["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  S23 -->|calls| T23
  S24["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T24["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S24 -->|calls| T24
  S25["method:UnityAppController::callbackPresent:<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:75"]
  T25["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

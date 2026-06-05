# `calls 符号关系 - 046`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:VideoPlayer::cleanupCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:123"]
  T1["function:CMVideoSampling_Uninitialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:14"]
  S1 -->|calls| T1
  S2["method:VideoPlayer::cleanupPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:142"]
  T2["method:VideoPlayer::pause<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:222"]
  S2 -->|calls| T2
  S3["method:VideoPlayer::unloadPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:160"]
  T3["method:VideoPlayer::cleanupCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:123"]
  S3 -->|calls| T3
  S4["method:VideoPlayer::unloadPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:160"]
  T4["method:VideoPlayer::cleanupAssetReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:133"]
  S4 -->|calls| T4
  S5["method:VideoPlayer::unloadPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:160"]
  T5["method:VideoPlayer::cleanupPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:142"]
  S5 -->|calls| T5
  S6["method:VideoPlayer::loadVideo:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:173"]
  T6["method:VideoPlayer::prepareAsset:withKeys:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:381"]
  S6 -->|calls| T6
  S7["method:VideoPlayer::playToTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:209"]
  T7["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  S7 -->|calls| T7
  S8["method:VideoPlayer::pause<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:222"]
  T8["method:VideoPlayer::pause<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:222"]
  S8 -->|calls| T8
  S9["method:VideoPlayer::curFrameTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:245"]
  T9["function:CMVideoSampling_LastSampledTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:76"]
  S9 -->|calls| T9
  S10["method:VideoPlayer::curFrameTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:245"]
  T10["method:VideoPlayer::cleanupCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:123"]
  S10 -->|calls| T10
  S11["method:VideoPlayer::curFrameTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:245"]
  T11["function:CMVideoSampling_SampleBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:71"]
  S11 -->|calls| T11
  S12["method:VideoPlayer::playerItemDidReachEnd:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:317"]
  T12["method:AVKitVideoPlayback::onPlayerDidFinishPlayingVideo<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:155"]
  S12 -->|calls| T12
  S13["method:VideoPlayer::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:328"]
  T13["method:VideoPlayer::duration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:66"]
  S13 -->|calls| T13
  S14["method:VideoPlayer::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:328"]
  T14["method:VideoPlayer::reportError:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:100"]
  S14 -->|calls| T14
  S15["method:VideoPlayer::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:328"]
  T15["method:VideoPlayer::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:328"]
  S15 -->|calls| T15
  S16["method:VideoPlayer::observeValueForKeyPath:ofObject:change:context:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:328"]
  T16["method:AVKitVideoPlayback::onPlayerReady<br/>TODO/Unity/xcode_effectTest/Classes/Unity/FullScreenVideoPlayer.mm:134"]
  S16 -->|calls| T16
  S17["method:VideoPlayer::prepareAsset:withKeys:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:381"]
  T17["method:VideoPlayer::reportError:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:100"]
  S17 -->|calls| T17
  S18["method:VideoPlayer::prepareAsset:withKeys:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:381"]
  T18["method:VideoPlayer::reportErrorWithString:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:107"]
  S18 -->|calls| T18
  S19["method:VideoPlayer::prepareAsset:withKeys:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:381"]
  T19["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S19 -->|calls| T19
  S20["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T20["method:VideoPlayer::cleanupAssetReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:133"]
  S20 -->|calls| T20
  S21["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T21["method:VideoPlayer::reportErrorWithString:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:107"]
  S21 -->|calls| T21
  S22["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T22["method:VideoPlayer::reportError:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:100"]
  S22 -->|calls| T22
  S23["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T23["method:VideoPlayer::reportErrorWithString:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:107"]
  S23 -->|calls| T23
  S24["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T24["method:VideoPlayer::reportError:category:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:100"]
  S24 -->|calls| T24
  S25["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  T25["method:VideoPlayer::cleanupCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:123"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

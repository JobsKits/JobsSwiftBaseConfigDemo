# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityWebRequestDelegate::handleResponse:task:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:126"]
  T1["method:UnityWebRequestDelegate::handleResponse:urequest:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:155"]
  S1 -->|calls| T1
  S2["method:UnityWebRequestDelegate::handleHTTPResponse:task:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:137"]
  T2["method:UnityWebRequestDelegate::handleHTTPResponse:urequest:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:145"]
  S2 -->|calls| T2
  S3["method:UnityWebRequestDelegate::handleHTTPResponse:urequest:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:145"]
  T3["method:UnityWebRequestDelegate::handleResponse:urequest:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:155"]
  S3 -->|calls| T3
  S4["method:UnityWebRequestDelegate::URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:172"]
  T4["method:UnityWebRequestDelegate::handleHTTPResponse:task:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:137"]
  S4 -->|calls| T4
  S5["method:UnityWebRequestDelegate::URLSession:task:didCompleteWithError:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:256"]
  T5["method:UnityURLRequest::markDone<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:90"]
  S5 -->|calls| T5
  S6["method:UnityWebRequestUploadStream::createForRequest:totalBytes:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:288"]
  T6["method:UnityWebRequestUploadStream::initWithRequest:totalBytes:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:293"]
  S6 -->|calls| T6
  S7["method:UnityWebRequestUploadStream::initWithRequest:totalBytes:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:293"]
  T7["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S7 -->|calls| T7
  S8["function:UnityWebRequestAddCustomHeader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:369"]
  T8["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S8 -->|calls| T8
  S9["function:UnityCreateWebRequestBackend<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:384"]
  T9["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S9 -->|calls| T9
  S10["function:UnityCreateWebRequestBackend<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:384"]
  T10["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S10 -->|calls| T10
  S11["function:UnityCreateWebRequestBackend<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:384"]
  T11["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S11 -->|calls| T11
  S12["function:UnitySendWebRequest<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:426"]
  T12["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S12 -->|calls| T12
  S13["function:UnitySendWebRequest<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:426"]
  T13["method:VideoPlayer::resume<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:228"]
  S13 -->|calls| T13
  S14["function:UnityWebRequestClearCookieCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:521"]
  T14["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S14 -->|calls| T14
  S15["method:VideoPlayer::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:113"]
  T15["method:VideoPlayer::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:113"]
  S15 -->|calls| T15
  S16["method:VideoPlayer::cleanupCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:123"]
  T16["function:CMVideoSampling_Uninitialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:14"]
  S16 -->|calls| T16
  S17["method:VideoPlayer::cleanupPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:142"]
  T17["method:VideoPlayer::pause<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:222"]
  S17 -->|calls| T17
  S18["method:VideoPlayer::unloadPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:160"]
  T18["method:VideoPlayer::cleanupCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:123"]
  S18 -->|calls| T18
  S19["method:VideoPlayer::unloadPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:160"]
  T19["method:VideoPlayer::cleanupAssetReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:133"]
  S19 -->|calls| T19
  S20["method:VideoPlayer::unloadPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:160"]
  T20["method:VideoPlayer::cleanupPlayer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:142"]
  S20 -->|calls| T20
  S21["method:VideoPlayer::loadVideo:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:173"]
  T21["method:VideoPlayer::prepareAsset:withKeys:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:381"]
  S21 -->|calls| T21
  S22["method:VideoPlayer::playToTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:209"]
  T22["method:VideoPlayer::prepareReader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:444"]
  S22 -->|calls| T22
  S23["method:VideoPlayer::pause<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:222"]
  T23["method:VideoPlayer::pause<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:222"]
  S23 -->|calls| T23
  S24["method:VideoPlayer::curFrameTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:245"]
  T24["function:CMVideoSampling_LastSampledTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:76"]
  S24 -->|calls| T24
  S25["method:VideoPlayer::curFrameTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:245"]
  T25["method:VideoPlayer::cleanupCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:123"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 045`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityReplayKitIsBroadcastingPaused<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:145"]
  T1["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S1 -->|calls| T1
  S2["function:UnityReplayKitIsPreviewControllerActive<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:150"]
  T2["method:UnityReplayKit::isPreviewControllerActive<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:273"]
  S2 -->|calls| T2
  S3["function:UnityReplayKitIsPreviewControllerActive<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:150"]
  T3["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S3 -->|calls| T3
  S4["function:UnityReplayKitGetBroadcastURL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:155"]
  T4["method:UnityReplayKit::broadcastURL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:288"]
  S4 -->|calls| T4
  S5["function:UnityReplayKitGetBroadcastURL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:155"]
  T5["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S5 -->|calls| T5
  S6["function:UnityReplayKitCreateOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:165"]
  T6["method:UnityReplayKit::createOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:115"]
  S6 -->|calls| T6
  S7["function:UnityReplayKitCreateOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:165"]
  T7["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S7 -->|calls| T7
  S8["method:UnityURLRequest::init:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:64"]
  T8["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S8 -->|calls| T8
  S9["method:UnityWebRequestDelegate::URLSession:dataTask:didReceiveResponse:completionHandler:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:120"]
  T9["method:UnityWebRequestDelegate::handleResponse:task:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:126"]
  S9 -->|calls| T9
  S10["method:UnityWebRequestDelegate::handleResponse:task:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:126"]
  T10["method:UnityWebRequestDelegate::handleHTTPResponse:urequest:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:145"]
  S10 -->|calls| T10
  S11["method:UnityWebRequestDelegate::handleResponse:task:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:126"]
  T11["method:UnityWebRequestDelegate::handleResponse:urequest:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:155"]
  S11 -->|calls| T11
  S12["method:UnityWebRequestDelegate::handleHTTPResponse:task:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:137"]
  T12["method:UnityWebRequestDelegate::handleHTTPResponse:urequest:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:145"]
  S12 -->|calls| T12
  S13["method:UnityWebRequestDelegate::handleHTTPResponse:urequest:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:145"]
  T13["method:UnityWebRequestDelegate::handleResponse:urequest:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:155"]
  S13 -->|calls| T13
  S14["method:UnityWebRequestDelegate::URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:172"]
  T14["method:UnityWebRequestDelegate::handleHTTPResponse:task:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:137"]
  S14 -->|calls| T14
  S15["method:UnityWebRequestDelegate::URLSession:task:didCompleteWithError:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:256"]
  T15["method:UnityURLRequest::markDone<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:90"]
  S15 -->|calls| T15
  S16["method:UnityWebRequestUploadStream::createForRequest:totalBytes:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:288"]
  T16["method:UnityWebRequestUploadStream::initWithRequest:totalBytes:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:293"]
  S16 -->|calls| T16
  S17["method:UnityWebRequestUploadStream::initWithRequest:totalBytes:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:293"]
  T17["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S17 -->|calls| T17
  S18["function:UnityWebRequestAddCustomHeader<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:369"]
  T18["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S18 -->|calls| T18
  S19["function:UnityCreateWebRequestBackend<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:384"]
  T19["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S19 -->|calls| T19
  S20["function:UnityCreateWebRequestBackend<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:384"]
  T20["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S20 -->|calls| T20
  S21["function:UnityCreateWebRequestBackend<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:384"]
  T21["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S21 -->|calls| T21
  S22["function:UnitySendWebRequest<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:426"]
  T22["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S22 -->|calls| T22
  S23["function:UnitySendWebRequest<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:426"]
  T23["method:VideoPlayer::resume<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:228"]
  S23 -->|calls| T23
  S24["function:UnityWebRequestClearCookieCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:521"]
  T24["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S24 -->|calls| T24
  S25["method:VideoPlayer::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:113"]
  T25["method:VideoPlayer::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:113"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

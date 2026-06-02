# `calls 符号关系 - 111`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityReplayKitPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:107"]
  T1["method:UnityReplayKit::showPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:218"]
  S1 -->|calls| T1
  S2["function:UnityReplayKitPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:107"]
  T2["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S2 -->|calls| T2
  S3["function:UnityReplayKitBroadcastingAPIAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:112"]
  T3["method:UnityReplayKit::broadcastingApiAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:282"]
  S3 -->|calls| T3
  S4["function:UnityReplayKitBroadcastingAPIAvailable<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:112"]
  T4["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S4 -->|calls| T4
  S5["function:UnityReplayKitStartBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:117"]
  T5["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S5 -->|calls| T5
  S6["function:UnityReplayKitStopBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:122"]
  T6["function:UnityReplayKitHideCameraPreview<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:88"]
  S6 -->|calls| T6
  S7["function:UnityReplayKitStopBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:122"]
  T7["method:UnityReplayKit::stopBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:416"]
  S7 -->|calls| T7
  S8["function:UnityReplayKitStopBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:122"]
  T8["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S8 -->|calls| T8
  S9["function:UnityReplayKitPauseBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:130"]
  T9["method:UnityReplayKit::pauseBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:435"]
  S9 -->|calls| T9
  S10["function:UnityReplayKitPauseBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:130"]
  T10["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S10 -->|calls| T10
  S11["function:UnityReplayKitResumeBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:135"]
  T11["method:UnityReplayKit::resumeBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:445"]
  S11 -->|calls| T11
  S12["function:UnityReplayKitResumeBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:135"]
  T12["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S12 -->|calls| T12
  S13["function:UnityReplayKitIsBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:140"]
  T13["method:UnityReplayKit::isBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:297"]
  S13 -->|calls| T13
  S14["function:UnityReplayKitIsBroadcasting<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:140"]
  T14["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S14 -->|calls| T14
  S15["function:UnityReplayKitIsBroadcastingPaused<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:145"]
  T15["method:UnityReplayKit::isBroadcastingPaused<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:306"]
  S15 -->|calls| T15
  S16["function:UnityReplayKitIsBroadcastingPaused<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:145"]
  T16["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S16 -->|calls| T16
  S17["function:UnityReplayKitIsPreviewControllerActive<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:150"]
  T17["method:UnityReplayKit::isPreviewControllerActive<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:273"]
  S17 -->|calls| T17
  S18["function:UnityReplayKitIsPreviewControllerActive<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:150"]
  T18["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S18 -->|calls| T18
  S19["function:UnityReplayKitGetBroadcastURL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:155"]
  T19["method:UnityReplayKit::broadcastURL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:288"]
  S19 -->|calls| T19
  S20["function:UnityReplayKitGetBroadcastURL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:155"]
  T20["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S20 -->|calls| T20
  S21["function:UnityReplayKitCreateOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:165"]
  T21["method:UnityReplayKit::createOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:115"]
  S21 -->|calls| T21
  S22["function:UnityReplayKitCreateOverlayWindow<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit_Scripting.mm:165"]
  T22["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S22 -->|calls| T22
  S23["method:UnityURLRequest::init:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:64"]
  T23["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S23 -->|calls| T23
  S24["method:UnityWebRequestDelegate::URLSession:dataTask:didReceiveResponse:completionHandler:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:120"]
  T24["method:UnityWebRequestDelegate::handleResponse:task:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:126"]
  S24 -->|calls| T24
  S25["method:UnityWebRequestDelegate::handleResponse:task:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:126"]
  T25["method:UnityWebRequestDelegate::handleHTTPResponse:urequest:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:145"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

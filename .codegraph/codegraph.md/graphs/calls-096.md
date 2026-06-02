# `calls 符号关系 - 096`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityView::processKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:244"]
  T1["function:UnityView::GetKeyMap<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:22"]
  S1 -->|calls| T1
  S2["method:UnityView::processKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:244"]
  T2["function:UnityView::GetTimeInSeconds<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:28"]
  S2 -->|calls| T2
  S3["method:UnityView::willRotateToOrientation:fromOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:12"]
  T3["function:ConvertToUnityScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:46"]
  S3 -->|calls| T3
  S4["method:UnityView::willRotateToOrientation:fromOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:12"]
  T4["function:ConvertToUnityScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:46"]
  S4 -->|calls| T4
  S5["method:UnityView::willRotateToOrientation:fromOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:12"]
  T5["function:OrientationAfterTransform<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:104"]
  S5 -->|calls| T5
  S6["method:UnityView::willRotateToOrientation:fromOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:12"]
  T6["function:TransformBetweenOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:18"]
  S6 -->|calls| T6
  S7["method:UnityView::didRotate<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:30"]
  T7["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  S7 -->|calls| T7
  S8["method:UnityView::touchesBegan:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:8"]
  T8["function:ReportSimulatedRemoteTouchesBegan<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1158"]
  S8 -->|calls| T8
  S9["method:UnityView::touchesBegan:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:8"]
  T9["function:UnityGetAppleTVRemoteTouchesEnabled<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1045"]
  S9 -->|calls| T9
  S10["method:UnityView::touchesEnded:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:18"]
  T10["function:ReportSimulatedRemoteTouchesEnded<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1174"]
  S10 -->|calls| T10
  S11["method:UnityView::touchesEnded:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:18"]
  T11["function:UnityGetAppleTVRemoteTouchesEnabled<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1045"]
  S11 -->|calls| T11
  S12["method:UnityView::touchesCancelled:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:28"]
  T12["function:ReportSimulatedRemoteTouchesEnded<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1174"]
  S12 -->|calls| T12
  S13["method:UnityView::touchesCancelled:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:28"]
  T13["function:UnityGetAppleTVRemoteTouchesEnabled<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1045"]
  S13 -->|calls| T13
  S14["method:UnityView::touchesMoved:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:38"]
  T14["function:ReportSimulatedRemoteTouchesMoved<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1163"]
  S14 -->|calls| T14
  S15["method:UnityView::touchesMoved:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:38"]
  T15["function:UnityGetAppleTVRemoteTouchesEnabled<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1045"]
  S15 -->|calls| T15
  S16["method:UnityView::pressesBegan:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:49"]
  T16["function:ReportSimulatedRemoteButtonPress<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1142"]
  S16 -->|calls| T16
  S17["method:UnityView::pressesEnded:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:55"]
  T17["function:ReportSimulatedRemoteButtonRelease<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1147"]
  S17 -->|calls| T17
  S18["method:UnityView::onUpdateSurfaceSize:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:20"]
  T18["function:ReportSafeAreaChangeForView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:235"]
  S18 -->|calls| T18
  S19["method:UnityView::initWithFrame:scaleFactor:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:54"]
  T19["method:UnityView::initImpl:scaleFactor:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:34"]
  S19 -->|calls| T19
  S20["method:UnityView::initWithFrame:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:60"]
  T20["method:UnityView::initImpl:scaleFactor:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:34"]
  S20 -->|calls| T20
  S21["method:UnityView::initFromMainScreen<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:67"]
  T21["function:UnityScreenScaleFactor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:706"]
  S21 -->|calls| T21
  S22["method:UnityView::initFromMainScreen<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:67"]
  T22["method:UnityView::initImpl:scaleFactor:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:34"]
  S22 -->|calls| T22
  S23["method:UnityView::layoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:86"]
  T23["method:UnityView::layoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:86"]
  S23 -->|calls| T23
  S24["method:UnityView::safeAreaInsetsDidChange<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:101"]
  T24["function:ReportSafeAreaChangeForView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:235"]
  S24 -->|calls| T24
  S25["method:UnityView::recreateRenderingSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:106"]
  T25["function:UnityScreenScaleFactor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:706"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

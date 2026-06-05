# `calls 符号关系 - 029`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T1["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S1 -->|calls| T1
  S2["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T2["method:KeyboardDelegate::hasExternalKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:733"]
  S2 -->|calls| T2
  S3["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T3["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S3 -->|calls| T3
  S4["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T4["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S4 -->|calls| T4
  S5["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T5["method:UnityView::createKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:36"]
  S5 -->|calls| T5
  S6["method:UnityView::handleCommand:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:129"]
  T6["function:UnityView::GetKeyMap<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:22"]
  S6 -->|calls| T6
  S7["method:UnityView::handleCommand:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:129"]
  T7["function:UnityView::GetKeyMap<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:22"]
  S7 -->|calls| T7
  S8["method:UnityView::handleCommand:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:129"]
  T8["function:UnityView::GetKeyMap<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:22"]
  S8 -->|calls| T8
  S9["method:UnityView::handleCommand:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:129"]
  T9["function:UnityView::GetTimeInSeconds<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:28"]
  S9 -->|calls| T9
  S10["method:UnityView::handleCommand:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:129"]
  T10["function:UnityView::GetTimeInSeconds<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:28"]
  S10 -->|calls| T10
  S11["method:UnityView::processKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:244"]
  T11["function:UnityView::GetKeyMap<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:22"]
  S11 -->|calls| T11
  S12["method:UnityView::processKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:244"]
  T12["function:UnityView::GetTimeInSeconds<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:28"]
  S12 -->|calls| T12
  S13["method:UnityView::willRotateToOrientation:fromOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:12"]
  T13["function:ConvertToUnityScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:46"]
  S13 -->|calls| T13
  S14["method:UnityView::willRotateToOrientation:fromOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:12"]
  T14["function:ConvertToUnityScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:46"]
  S14 -->|calls| T14
  S15["method:UnityView::willRotateToOrientation:fromOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:12"]
  T15["function:OrientationAfterTransform<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:104"]
  S15 -->|calls| T15
  S16["method:UnityView::willRotateToOrientation:fromOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:12"]
  T16["function:TransformBetweenOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:18"]
  S16 -->|calls| T16
  S17["method:UnityView::didRotate<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:30"]
  T17["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  S17 -->|calls| T17
  S18["method:UnityView::touchesBegan:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:8"]
  T18["function:ReportSimulatedRemoteTouchesBegan<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1158"]
  S18 -->|calls| T18
  S19["method:UnityView::touchesBegan:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:8"]
  T19["function:UnityGetAppleTVRemoteTouchesEnabled<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1045"]
  S19 -->|calls| T19
  S20["method:UnityView::touchesEnded:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:18"]
  T20["function:ReportSimulatedRemoteTouchesEnded<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1174"]
  S20 -->|calls| T20
  S21["method:UnityView::touchesEnded:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:18"]
  T21["function:UnityGetAppleTVRemoteTouchesEnabled<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1045"]
  S21 -->|calls| T21
  S22["method:UnityView::touchesCancelled:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:28"]
  T22["function:ReportSimulatedRemoteTouchesEnded<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1174"]
  S22 -->|calls| T22
  S23["method:UnityView::touchesCancelled:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:28"]
  T23["function:UnityGetAppleTVRemoteTouchesEnabled<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1045"]
  S23 -->|calls| T23
  S24["method:UnityView::touchesMoved:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:38"]
  T24["function:ReportSimulatedRemoteTouchesMoved<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1163"]
  S24 -->|calls| T24
  S25["method:UnityView::touchesMoved:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:38"]
  T25["function:UnityGetAppleTVRemoteTouchesEnabled<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1045"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

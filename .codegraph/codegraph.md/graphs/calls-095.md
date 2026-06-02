# `calls 符号关系 - 095`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  T1["method:UnityAppController::willTransitionToViewController:fromViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:109"]
  S1 -->|calls| T1
  S2["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  T2["method:UnityView::layoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:86"]
  S2 -->|calls| T2
  S3["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  T3["function:UIViewControllerInterfaceOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:67"]
  S3 -->|calls| T3
  S4["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  T4["function:UnityiOS160orNewer<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:693"]
  S4 -->|calls| T4
  S5["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  T5["method:UnityAppController::didTransitionToViewController:fromViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:113"]
  S5 -->|calls| T5
  S6["method:UnityAppController::interfaceDidChangeOrientationFrom:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:279"]
  T6["method:UnityView::didRotate<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:30"]
  S6 -->|calls| T6
  S7["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  T7["function:UIViewControllerInterfaceOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:67"]
  S7 -->|calls| T7
  S8["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  T8["function:EnabledAutorotationInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:288"]
  S8 -->|calls| T8
  S9["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  T9["method:UnityAppController::createUnityViewControllerDefault<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:48"]
  S9 -->|calls| T9
  S10["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  T10["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S10 -->|calls| T10
  S11["method:UnityAppController::orientInterface:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:413"]
  T11["method:KeyboardDelegate::StartReorientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:667"]
  S11 -->|calls| T11
  S12["method:UnityAppController::orientInterface:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:413"]
  T12["method:KeyboardDelegate::FinishReorientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:673"]
  S12 -->|calls| T12
  S13["function:UnityNotifyHideHomeButtonChange<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:451"]
  T13["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S13 -->|calls| T13
  S14["function:UnityNotifyDeferSystemGesturesChange<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:456"]
  T14["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S14 -->|calls| T14
  S15["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T15["property:KeyboardDelegate::status<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.h:63"]
  S15 -->|calls| T15
  S16["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T16["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S16 -->|calls| T16
  S17["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T17["method:KeyboardDelegate::hasExternalKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:733"]
  S17 -->|calls| T17
  S18["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T18["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S18 -->|calls| T18
  S19["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T19["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S19 -->|calls| T19
  S20["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T20["method:UnityView::createKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:36"]
  S20 -->|calls| T20
  S21["method:UnityView::handleCommand:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:129"]
  T21["function:UnityView::GetKeyMap<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:22"]
  S21 -->|calls| T21
  S22["method:UnityView::handleCommand:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:129"]
  T22["function:UnityView::GetKeyMap<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:22"]
  S22 -->|calls| T22
  S23["method:UnityView::handleCommand:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:129"]
  T23["function:UnityView::GetKeyMap<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:22"]
  S23 -->|calls| T23
  S24["method:UnityView::handleCommand:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:129"]
  T24["function:UnityView::GetTimeInSeconds<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:28"]
  S24 -->|calls| T24
  S25["method:UnityView::handleCommand:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:129"]
  T25["function:UnityView::GetTimeInSeconds<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

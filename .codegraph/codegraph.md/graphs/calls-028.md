# `calls 符号关系 - 028`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T1["variable:objectForKey<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-threads-mach-helper.c:32"]
  S1 -->|calls| T1
  S2["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T2["function:ShowActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:5"]
  S2 -->|calls| T2
  S3["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T3["variable:objectForKey<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-threads-mach-helper.c:32"]
  S3 -->|calls| T3
  S4["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T4["function:HideActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:31"]
  S4 -->|calls| T4
  S5["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T5["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  S5 -->|calls| T5
  S6["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T6["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  S6 -->|calls| T6
  S7["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T7["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S7 -->|calls| T7
  S8["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T8["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  S8 -->|calls| T8
  S9["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T9["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  S9 -->|calls| T9
  S10["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T10["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  S10 -->|calls| T10
  S11["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  T11["method:UnityAppController::willTransitionToViewController:fromViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:109"]
  S11 -->|calls| T11
  S12["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  T12["method:UnityView::layoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:86"]
  S12 -->|calls| T12
  S13["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  T13["function:UIViewControllerInterfaceOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:67"]
  S13 -->|calls| T13
  S14["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  T14["function:UnityiOS160orNewer<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:693"]
  S14 -->|calls| T14
  S15["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  T15["method:UnityAppController::didTransitionToViewController:fromViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:113"]
  S15 -->|calls| T15
  S16["method:UnityAppController::interfaceDidChangeOrientationFrom:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:279"]
  T16["method:UnityView::didRotate<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:30"]
  S16 -->|calls| T16
  S17["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  T17["function:UIViewControllerInterfaceOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:67"]
  S17 -->|calls| T17
  S18["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  T18["function:EnabledAutorotationInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:288"]
  S18 -->|calls| T18
  S19["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  T19["method:UnityAppController::createUnityViewControllerDefault<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:48"]
  S19 -->|calls| T19
  S20["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  T20["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S20 -->|calls| T20
  S21["method:UnityAppController::orientInterface:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:413"]
  T21["method:KeyboardDelegate::StartReorientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:667"]
  S21 -->|calls| T21
  S22["method:UnityAppController::orientInterface:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:413"]
  T22["method:KeyboardDelegate::FinishReorientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:673"]
  S22 -->|calls| T22
  S23["function:UnityNotifyHideHomeButtonChange<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:451"]
  T23["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S23 -->|calls| T23
  S24["function:UnityNotifyDeferSystemGesturesChange<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:456"]
  T24["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S24 -->|calls| T24
  S25["method:UnityView::keyCommands<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+Keyboard.mm:97"]
  T25["property:KeyboardDelegate::status<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.h:63"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

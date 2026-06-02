# `calls 符号关系 - 094`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityAppController::updateAppOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:28"]
  T1["method:UnityView::boundsUpdated<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:29"]
  S1 -->|calls| T1
  S2["method:UnityAppController::createUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:43"]
  T2["method:UnityView::initFromMainScreen<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:67"]
  S2 -->|calls| T2
  S3["method:UnityAppController::createUnityViewControllerDefault<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:48"]
  T3["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S3 -->|calls| T3
  S4["method:UnityAppController::createUnityViewControllerDefault<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:48"]
  T4["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S4 -->|calls| T4
  S5["method:UnityAppController::createUnityViewControllerForOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:66"]
  T5["function:AllocUnitySingleOrientationViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:63"]
  S5 -->|calls| T5
  S6["method:UnityAppController::createUnityViewControllerForOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:66"]
  T6["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S6 -->|calls| T6
  S7["method:UnityAppController::createRootViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:75"]
  T7["method:UnityAppController::createUnityViewControllerDefault<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:48"]
  S7 -->|calls| T7
  S8["method:UnityAppController::createRootViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:75"]
  T8["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S8 -->|calls| T8
  S9["method:UnityAppController::willStartWithViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:97"]
  T9["function:UnityScreenScaleFactor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:706"]
  S9 -->|calls| T9
  S10["method:UnityAppController::didTransitionToViewController:fromViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:113"]
  T10["function:UIViewControllerInterfaceOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:67"]
  S10 -->|calls| T10
  S11["method:UnityAppController::didTransitionToViewController:fromViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:113"]
  T11["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S11 -->|calls| T11
  S12["method:UnityAppController::didTransitionToViewController:fromViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:113"]
  T12["method:UnityView::didRotate<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:30"]
  S12 -->|calls| T12
  S13["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T13["method:UnityAppController::createRootViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:75"]
  S13 -->|calls| T13
  S14["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T14["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S14 -->|calls| T14
  S15["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T15["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  S15 -->|calls| T15
  S16["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T16["variable:objectForKey<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-threads-mach-helper.c:32"]
  S16 -->|calls| T16
  S17["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T17["function:ShowActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:5"]
  S17 -->|calls| T17
  S18["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T18["variable:objectForKey<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-threads-mach-helper.c:32"]
  S18 -->|calls| T18
  S19["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T19["function:HideActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:31"]
  S19 -->|calls| T19
  S20["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T20["method:UnityAppController::checkOrientationRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:314"]
  S20 -->|calls| T20
  S21["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T21["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  S21 -->|calls| T21
  S22["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T22["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S22 -->|calls| T22
  S23["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T23["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  S23 -->|calls| T23
  S24["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T24["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  S24 -->|calls| T24
  S25["method:UnityAppController::showGameUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:180"]
  T25["method:UnityAppController::repaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:47"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

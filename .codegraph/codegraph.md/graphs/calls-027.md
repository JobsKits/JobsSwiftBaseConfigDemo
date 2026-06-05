# `calls 符号关系 - 027`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityKeyboard_GetRect<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:960"]
  T1["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S1 -->|calls| T1
  S2["function:UnityKeyboard_GetRect<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:960"]
  T2["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S2 -->|calls| T2
  S3["function:UnityKeyboard_SetCharacterLimit<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:975"]
  T3["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S3 -->|calls| T3
  S4["function:TransformBetweenOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:18"]
  T4["function:TransformForOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:4"]
  S4 -->|calls| T4
  S5["function:TransformBetweenOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:18"]
  T5["function:TransformForOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:4"]
  S5 -->|calls| T5
  S6["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  T6["function:ConvertToUnityScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:46"]
  S6 -->|calls| T6
  S7["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  T7["function:UIViewControllerInterfaceOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:67"]
  S7 -->|calls| T7
  S8["function:OrientView<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:151"]
  T8["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  S8 -->|calls| T8
  S9["function:OrientView<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:151"]
  T9["function:TransformBetweenOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:18"]
  S9 -->|calls| T9
  S10["method:UnityAppController::updateAppOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:28"]
  T10["method:UnityView::didRotate<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:30"]
  S10 -->|calls| T10
  S11["method:UnityAppController::updateAppOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:28"]
  T11["method:UnityView::boundsUpdated<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:29"]
  S11 -->|calls| T11
  S12["method:UnityAppController::createUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:43"]
  T12["method:UnityView::initFromMainScreen<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:67"]
  S12 -->|calls| T12
  S13["method:UnityAppController::createUnityViewControllerDefault<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:48"]
  T13["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S13 -->|calls| T13
  S14["method:UnityAppController::createUnityViewControllerDefault<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:48"]
  T14["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S14 -->|calls| T14
  S15["method:UnityAppController::createUnityViewControllerForOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:66"]
  T15["function:AllocUnitySingleOrientationViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:63"]
  S15 -->|calls| T15
  S16["method:UnityAppController::createUnityViewControllerForOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:66"]
  T16["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S16 -->|calls| T16
  S17["method:UnityAppController::createRootViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:75"]
  T17["method:UnityAppController::createUnityViewControllerDefault<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:48"]
  S17 -->|calls| T17
  S18["method:UnityAppController::createRootViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:75"]
  T18["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S18 -->|calls| T18
  S19["method:UnityAppController::willStartWithViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:97"]
  T19["function:UnityScreenScaleFactor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:706"]
  S19 -->|calls| T19
  S20["method:UnityAppController::didTransitionToViewController:fromViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:113"]
  T20["function:UIViewControllerInterfaceOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:67"]
  S20 -->|calls| T20
  S21["method:UnityAppController::didTransitionToViewController:fromViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:113"]
  T21["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S21 -->|calls| T21
  S22["method:UnityAppController::didTransitionToViewController:fromViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:113"]
  T22["method:UnityView::didRotate<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:30"]
  S22 -->|calls| T22
  S23["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T23["method:UnityAppController::createRootViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:75"]
  S23 -->|calls| T23
  S24["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T24["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S24 -->|calls| T24
  S25["method:UnityAppController::createUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:134"]
  T25["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

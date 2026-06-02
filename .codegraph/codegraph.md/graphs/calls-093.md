# `calls 符号关系 - 093`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:KeyboardDelegate::textField:shouldChangeCharactersInRange:replacementString:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:748"]
  T1["function:StringContainsEmoji<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:1018"]
  S1 -->|calls| T1
  S2["method:KeyboardDelegate::textField:shouldChangeCharactersInRange:replacementString:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:748"]
  T2["method:KeyboardDelegate::currentText:shouldChangeInRange:replacementText:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:776"]
  S2 -->|calls| T2
  S3["method:KeyboardDelegate::textView:shouldChangeTextInRange:replacementText:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:762"]
  T3["function:StringContainsEmoji<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:1018"]
  S3 -->|calls| T3
  S4["method:KeyboardDelegate::textView:shouldChangeTextInRange:replacementText:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:762"]
  T4["method:KeyboardDelegate::currentText:shouldChangeInRange:replacementText:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:776"]
  S4 -->|calls| T4
  S5["method:KeyboardDelegate::currentText:shouldChangeInRange:replacementText:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:776"]
  T5["function:StringContainsEmoji<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:1018"]
  S5 -->|calls| T5
  S6["function:UnityKeyboard_Create<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:844"]
  T6["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S6 -->|calls| T6
  S7["function:UnityKeyboard_Show<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:905"]
  T7["method:KeyboardDelegate::show<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:555"]
  S7 -->|calls| T7
  S8["function:UnityKeyboard_Show<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:905"]
  T8["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S8 -->|calls| T8
  S9["function:UnityKeyboard_Hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:915"]
  T9["method:KeyboardDelegate::textInputLostFocus<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:134"]
  S9 -->|calls| T9
  S10["function:UnityKeyboard_Hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:915"]
  T10["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S10 -->|calls| T10
  S11["function:UnityKeyboard_SetText<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:925"]
  T11["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S11 -->|calls| T11
  S12["function:UnityKeyboard_GetText<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:930"]
  T12["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S12 -->|calls| T12
  S13["function:UnityKeyboard_SetInputHidden<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:945"]
  T13["method:KeyboardDelegate::updateInputHidden<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:565"]
  S13 -->|calls| T13
  S14["function:UnityKeyboard_GetRect<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:960"]
  T14["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S14 -->|calls| T14
  S15["function:UnityKeyboard_GetRect<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:960"]
  T15["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S15 -->|calls| T15
  S16["function:UnityKeyboard_GetRect<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:960"]
  T16["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S16 -->|calls| T16
  S17["function:UnityKeyboard_GetRect<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:960"]
  T17["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S17 -->|calls| T17
  S18["function:UnityKeyboard_SetCharacterLimit<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:975"]
  T18["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S18 -->|calls| T18
  S19["function:TransformBetweenOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:18"]
  T19["function:TransformForOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:4"]
  S19 -->|calls| T19
  S20["function:TransformBetweenOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:18"]
  T20["function:TransformForOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:4"]
  S20 -->|calls| T20
  S21["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  T21["function:ConvertToUnityScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:46"]
  S21 -->|calls| T21
  S22["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  T22["function:UIViewControllerInterfaceOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:67"]
  S22 -->|calls| T22
  S23["function:OrientView<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:151"]
  T23["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  S23 -->|calls| T23
  S24["function:OrientView<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:151"]
  T24["function:TransformBetweenOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:18"]
  S24 -->|calls| T24
  S25["method:UnityAppController::updateAppOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:28"]
  T25["method:UnityView::didRotate<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+iOS.mm:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

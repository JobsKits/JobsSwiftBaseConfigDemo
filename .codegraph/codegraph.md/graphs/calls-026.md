# `calls 符号关系 - 026`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:KeyboardDelegate::showUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:488"]
  T1["function:UnitySetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1071"]
  S1 -->|calls| T1
  S2["method:KeyboardDelegate::hideUIDelayed<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:520"]
  T2["function:UnitySetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1071"]
  S2 -->|calls| T2
  S3["method:KeyboardDelegate::hideUIDelayed<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:520"]
  T3["function:UnityGetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1060"]
  S3 -->|calls| T3
  S4["method:KeyboardDelegate::show<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:555"]
  T4["method:KeyboardDelegate::showUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:488"]
  S4 -->|calls| T4
  S5["method:KeyboardDelegate::hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:560"]
  T5["method:KeyboardDelegate::hideUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:514"]
  S5 -->|calls| T5
  S6["method:KeyboardDelegate::updateInputHidden<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:565"]
  T6["method:KeyboardDelegate::setTextInputTraits:withParam:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:379"]
  S6 -->|calls| T6
  S7["method:KeyboardDelegate::positionInput:x:y:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:584"]
  T7["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S7 -->|calls| T7
  S8["method:KeyboardDelegate::positionInput:x:y:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:584"]
  T8["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S8 -->|calls| T8
  S9["method:KeyboardDelegate::positionInput:x:y:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:584"]
  T9["function:UnityDeviceDPI<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:480"]
  S9 -->|calls| T9
  S10["method:KeyboardDelegate::positionInput:x:y:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:584"]
  T10["method:KeyboardDelegate::updateInputHidden<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:565"]
  S10 -->|calls| T10
  S11["method:KeyboardDelegate::textField:shouldChangeCharactersInRange:replacementString:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:748"]
  T11["function:StringContainsEmoji<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:1018"]
  S11 -->|calls| T11
  S12["method:KeyboardDelegate::textField:shouldChangeCharactersInRange:replacementString:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:748"]
  T12["method:KeyboardDelegate::currentText:shouldChangeInRange:replacementText:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:776"]
  S12 -->|calls| T12
  S13["method:KeyboardDelegate::textView:shouldChangeTextInRange:replacementText:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:762"]
  T13["function:StringContainsEmoji<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:1018"]
  S13 -->|calls| T13
  S14["method:KeyboardDelegate::textView:shouldChangeTextInRange:replacementText:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:762"]
  T14["method:KeyboardDelegate::currentText:shouldChangeInRange:replacementText:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:776"]
  S14 -->|calls| T14
  S15["method:KeyboardDelegate::currentText:shouldChangeInRange:replacementText:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:776"]
  T15["function:StringContainsEmoji<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:1018"]
  S15 -->|calls| T15
  S16["function:UnityKeyboard_Create<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:844"]
  T16["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S16 -->|calls| T16
  S17["function:UnityKeyboard_Show<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:905"]
  T17["method:KeyboardDelegate::show<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:555"]
  S17 -->|calls| T17
  S18["function:UnityKeyboard_Show<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:905"]
  T18["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S18 -->|calls| T18
  S19["function:UnityKeyboard_Hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:915"]
  T19["method:KeyboardDelegate::textInputLostFocus<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:134"]
  S19 -->|calls| T19
  S20["function:UnityKeyboard_Hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:915"]
  T20["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S20 -->|calls| T20
  S21["function:UnityKeyboard_SetText<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:925"]
  T21["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S21 -->|calls| T21
  S22["function:UnityKeyboard_GetText<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:930"]
  T22["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S22 -->|calls| T22
  S23["function:UnityKeyboard_SetInputHidden<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:945"]
  T23["method:KeyboardDelegate::updateInputHidden<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:565"]
  S23 -->|calls| T23
  S24["function:UnityKeyboard_GetRect<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:960"]
  T24["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S24 -->|calls| T24
  S25["function:UnityKeyboard_GetRect<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:960"]
  T25["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

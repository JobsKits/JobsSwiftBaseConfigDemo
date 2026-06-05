# `calls 符号关系 - 025`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:KeyboardDelegate::textInputCancel:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:127"]
  T1["method:KeyboardDelegate::hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:560"]
  S1 -->|calls| T1
  S2["method:KeyboardDelegate::textInputLostFocus<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:134"]
  T2["method:KeyboardDelegate::hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:560"]
  S2 -->|calls| T2
  S3["method:KeyboardDelegate::keyboardWillShow:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:174"]
  T3["method:KeyboardDelegate::setPendingSelectionRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:80"]
  S3 -->|calls| T3
  S4["method:KeyboardDelegate::keyboardWillShow:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:174"]
  T4["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S4 -->|calls| T4
  S5["method:KeyboardDelegate::keyboardWillShow:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:174"]
  T5["method:KeyboardDelegate::positionInput:x:y:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:584"]
  S5 -->|calls| T5
  S6["method:KeyboardDelegate::keyboardDidShow:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:186"]
  T6["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S6 -->|calls| T6
  S7["method:KeyboardDelegate::keyboardWillHide:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:203"]
  T7["method:KeyboardDelegate::systemHideKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:538"]
  S7 -->|calls| T7
  S8["method:KeyboardDelegate::keyboardDidHide:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:218"]
  T8["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S8 -->|calls| T8
  S9["method:KeyboardDelegate::keyboardDidChangeFrame:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:232"]
  T9["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S9 -->|calls| T9
  S10["method:KeyboardDelegate::keyboardDidChangeFrame:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:232"]
  T10["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S10 -->|calls| T10
  S11["method:KeyboardDelegate::keyboardDidChangeFrame:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:232"]
  T11["method:KeyboardDelegate::systemHideKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:538"]
  S11 -->|calls| T11
  S12["method:KeyboardDelegate::keyboardDidChangeFrame:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:232"]
  T12["method:KeyboardDelegate::positionInput:x:y:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:584"]
  S12 -->|calls| T12
  S13["method:KeyboardDelegate::Initialize<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:258"]
  T13["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S13 -->|calls| T13
  S14["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  T14["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S14 -->|calls| T14
  S15["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  T15["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S15 -->|calls| T15
  S16["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  T16["method:KeyboardDelegate::createToolbars<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:288"]
  S16 -->|calls| T16
  S17["method:KeyboardDelegate::setKeyboardParams:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:422"]
  T17["method:KeyboardDelegate::hideUIDelayed<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:520"]
  S17 -->|calls| T17
  S18["method:KeyboardDelegate::setKeyboardParams:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:422"]
  T18["method:KeyboardDelegate::hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:560"]
  S18 -->|calls| T18
  S19["method:KeyboardDelegate::setKeyboardParams:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:422"]
  T19["method:KeyboardDelegate::setTextInputTraits:withParam:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:379"]
  S19 -->|calls| T19
  S20["method:KeyboardDelegate::setKeyboardParams:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:422"]
  T20["method:KeyboardDelegate::setTextInputTraits:withParam:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:379"]
  S20 -->|calls| T20
  S21["method:KeyboardDelegate::setKeyboardParams:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:422"]
  T21["method:KeyboardDelegate::setTextInputTraits:withParam:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:379"]
  S21 -->|calls| T21
  S22["method:KeyboardDelegate::setKeyboardParams:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:422"]
  T22["method:KeyboardDelegate::Instance<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:265"]
  S22 -->|calls| T22
  S23["method:KeyboardDelegate::showUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:488"]
  T23["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S23 -->|calls| T23
  S24["method:KeyboardDelegate::showUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:488"]
  T24["method:KeyboardDelegate::becomeFirstResponder<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:119"]
  S24 -->|calls| T24
  S25["method:KeyboardDelegate::showUI<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:488"]
  T25["function:UnityGetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1060"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 091`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T1["function:VecMagnitude<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:13"]
  S1 -->|calls| T1
  S2["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T2["function:QuatIdentity<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:38"]
  S2 -->|calls| T2
  S3["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T3["function:VecScale<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:32"]
  S3 -->|calls| T3
  S4["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T4["function:VecScale<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:32"]
  S4 -->|calls| T4
  S5["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T5["function:VecDotProduct<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:8"]
  S5 -->|calls| T5
  S6["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T6["function:QuatIdentity<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:38"]
  S6 -->|calls| T6
  S7["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T7["function:VecCrossProduct<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:24"]
  S7 -->|calls| T7
  S8["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T8["function:QuatNormalize<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:78"]
  S8 -->|calls| T8
  S9["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T9["function:QuatMake<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:32"]
  S9 -->|calls| T9
  S10["function:ShowActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:26"]
  T10["function:ShowActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:26"]
  S10 -->|calls| T10
  S11["function:UnityStartActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:41"]
  T11["function:ShowActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:26"]
  S11 -->|calls| T11
  S12["function:UnityStartActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:41"]
  T12["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S12 -->|calls| T12
  S13["function:UnityStopActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:46"]
  T13["function:HideActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:31"]
  S13 -->|calls| T13
  S14["method:KeyboardDelegate::textInputModeDidChange:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:96"]
  T14["method:KeyboardDelegate::setPendingSelectionRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:80"]
  S14 -->|calls| T14
  S15["method:KeyboardDelegate::textInputDone:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:109"]
  T15["method:KeyboardDelegate::hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:560"]
  S15 -->|calls| T15
  S16["method:KeyboardDelegate::textInputCancel:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:127"]
  T16["method:KeyboardDelegate::hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:560"]
  S16 -->|calls| T16
  S17["method:KeyboardDelegate::textInputLostFocus<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:134"]
  T17["method:KeyboardDelegate::hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:560"]
  S17 -->|calls| T17
  S18["method:KeyboardDelegate::keyboardWillShow:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:174"]
  T18["method:KeyboardDelegate::setPendingSelectionRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:80"]
  S18 -->|calls| T18
  S19["method:KeyboardDelegate::keyboardWillShow:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:174"]
  T19["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S19 -->|calls| T19
  S20["method:KeyboardDelegate::keyboardWillShow:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:174"]
  T20["method:KeyboardDelegate::positionInput:x:y:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:584"]
  S20 -->|calls| T20
  S21["method:KeyboardDelegate::keyboardDidShow:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:186"]
  T21["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S21 -->|calls| T21
  S22["method:KeyboardDelegate::keyboardWillHide:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:203"]
  T22["method:KeyboardDelegate::systemHideKeyboard<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:538"]
  S22 -->|calls| T22
  S23["method:KeyboardDelegate::keyboardDidHide:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:218"]
  T23["method:UnityReplayKit::sharedInstance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityReplayKit.mm:127"]
  S23 -->|calls| T23
  S24["method:KeyboardDelegate::keyboardDidChangeFrame:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:232"]
  T24["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S24 -->|calls| T24
  S25["method:KeyboardDelegate::keyboardDidChangeFrame:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:232"]
  T25["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

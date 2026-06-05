# `calls 符号关系 - 024`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:QuatInverse<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:58"]
  T1["function:QuatConjugate<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:53"]
  S1 -->|calls| T1
  S2["function:QuatInverse<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:58"]
  T2["function:QuatNormSquared<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:48"]
  S2 -->|calls| T2
  S3["function:QuatToEuler<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:63"]
  T3["function:VecMake<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:18"]
  S3 -->|calls| T3
  S4["function:QuatNorm<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:73"]
  T4["function:QuatNormSquared<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:48"]
  S4 -->|calls| T4
  S5["function:QuatNormalize<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:78"]
  T5["function:QuatScale<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:43"]
  S5 -->|calls| T5
  S6["function:QuatNormalize<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:78"]
  T6["function:QuatNorm<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:73"]
  S6 -->|calls| T6
  S7["function:QuatDifference<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:83"]
  T7["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:25"]
  S7 -->|calls| T7
  S8["function:QuatDifference<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:83"]
  T8["function:QuatInverse<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:58"]
  S8 -->|calls| T8
  S9["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T9["function:VecMagnitude<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:13"]
  S9 -->|calls| T9
  S10["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T10["function:QuatIdentity<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:38"]
  S10 -->|calls| T10
  S11["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T11["function:VecMagnitude<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:13"]
  S11 -->|calls| T11
  S12["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T12["function:QuatIdentity<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:38"]
  S12 -->|calls| T12
  S13["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T13["function:VecScale<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:32"]
  S13 -->|calls| T13
  S14["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T14["function:VecScale<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:32"]
  S14 -->|calls| T14
  S15["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T15["function:VecDotProduct<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:8"]
  S15 -->|calls| T15
  S16["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T16["function:QuatIdentity<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:38"]
  S16 -->|calls| T16
  S17["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T17["function:VecCrossProduct<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:24"]
  S17 -->|calls| T17
  S18["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T18["function:QuatNormalize<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:78"]
  S18 -->|calls| T18
  S19["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T19["function:QuatMake<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:32"]
  S19 -->|calls| T19
  S20["function:ShowActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:26"]
  T20["function:ShowActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:26"]
  S20 -->|calls| T20
  S21["function:UnityStartActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:41"]
  T21["function:ShowActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:26"]
  S21 -->|calls| T21
  S22["function:UnityStartActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:41"]
  T22["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  S22 -->|calls| T22
  S23["function:UnityStopActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:46"]
  T23["function:HideActivityIndicator<br/>TODO/Unity/xcode_effectTest/Classes/UI/ActivityIndicator.mm:31"]
  S23 -->|calls| T23
  S24["method:KeyboardDelegate::textInputModeDidChange:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:96"]
  T24["method:KeyboardDelegate::setPendingSelectionRequest<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:80"]
  S24 -->|calls| T24
  S25["method:KeyboardDelegate::textInputDone:<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:109"]
  T25["method:KeyboardDelegate::hide<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:560"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

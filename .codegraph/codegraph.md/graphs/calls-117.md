# `calls 符号关系 - 117`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityGetGLView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:606"]
  T1["function:UnityGetUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:605"]
  S1 -->|calls| T1
  S2["function:UnityCurrentOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:609"]
  T2["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S2 -->|calls| T2
  S3["function:UnityInitTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:656"]
  T3["function:InitCrashHandling<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:99"]
  S3 -->|calls| T3
  S4["function:UnityInitTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:656"]
  T4["function:AddNewAPIImplIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:697"]
  S4 -->|calls| T4
  S5["function:UnityInitTrampoline<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:656"]
  T5["function:isDebuggerAttachedToConsole<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:621"]
  S5 -->|calls| T5
  S6["function:VecMagnitude<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:13"]
  T6["function:VecDotProduct<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:8"]
  S6 -->|calls| T6
  S7["function:VecCrossProduct<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:24"]
  T7["function:VecMake<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:18"]
  S7 -->|calls| T7
  S8["function:VecScale<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:32"]
  T8["function:VecMake<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:18"]
  S8 -->|calls| T8
  S9["function:VecNormalize<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:37"]
  T9["function:VecScale<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:32"]
  S9 -->|calls| T9
  S10["function:VecNormalize<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:37"]
  T10["function:VecMagnitude<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:13"]
  S10 -->|calls| T10
  S11["function:UnityReorientHeading<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:58"]
  T11["function:IsCompensatingSensors<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:55"]
  S11 -->|calls| T11
  S12["function:UnityReorientHeading<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:58"]
  T12["function:UnityCurrentOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:609"]
  S12 -->|calls| T12
  S13["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  T13["function:IsCompensatingSensors<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:55"]
  S13 -->|calls| T13
  S14["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  T14["function:UnityCurrentOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:609"]
  S14 -->|calls| T14
  S15["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  T15["function:IsCompensatingSensors<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:55"]
  S15 -->|calls| T15
  S16["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  T16["function:UnityCurrentOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:609"]
  S16 -->|calls| T16
  S17["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  T17["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:17"]
  S17 -->|calls| T17
  S18["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  T18["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:17"]
  S18 -->|calls| T18
  S19["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  T19["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:17"]
  S19 -->|calls| T19
  S20["function:UnityCoreMotionStart<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:176"]
  T20["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S20 -->|calls| T20
  S21["function:UnityCoreMotionStart<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:176"]
  T21["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S21 -->|calls| T21
  S22["function:UnityUpdateAccelerometerData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:230"]
  T22["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S22 -->|calls| T22
  S23["function:UnityUpdateGyroData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:273"]
  T23["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S23 -->|calls| T23
  S24["function:UnityUpdateGyroData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:273"]
  T24["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S24 -->|calls| T24
  S25["function:UnityUpdateGyroData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:273"]
  T25["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

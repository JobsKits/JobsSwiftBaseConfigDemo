# `calls 符号关系 - 051`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  T1["function:UnityCurrentOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:609"]
  S1 -->|calls| T1
  S2["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  T2["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:17"]
  S2 -->|calls| T2
  S3["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  T3["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:17"]
  S3 -->|calls| T3
  S4["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  T4["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:17"]
  S4 -->|calls| T4
  S5["function:UnityCoreMotionStart<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:176"]
  T5["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S5 -->|calls| T5
  S6["function:UnityCoreMotionStart<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:176"]
  T6["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S6 -->|calls| T6
  S7["function:UnityUpdateAccelerometerData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:230"]
  T7["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S7 -->|calls| T7
  S8["function:UnityUpdateGyroData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:273"]
  T8["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S8 -->|calls| T8
  S9["function:UnityUpdateGyroData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:273"]
  T9["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S9 -->|calls| T9
  S10["function:UnityUpdateGyroData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:273"]
  T10["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S10 -->|calls| T10
  S11["function:UnityUpdateGyroData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:273"]
  T11["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S11 -->|calls| T11
  S12["function:UnityUpdateGyroData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:273"]
  T12["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  S12 -->|calls| T12
  S13["function:UnityInitJoysticks<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:396"]
  T13["function:UnitySetAppleTVRemoteAllowRotation<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1096"]
  S13 -->|calls| T13
  S14["function:UnityInitJoysticks<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:396"]
  T14["function:UnitySetAppleTVRemoteReportAbsoluteDpadValues<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1114"]
  S14 -->|calls| T14
  S15["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  T15["function:SetJoystickButtonState<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:448"]
  S15 -->|calls| T15
  S16["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  T16["function:GetButtonPressed<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:391"]
  S16 -->|calls| T16
  S17["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  T17["function:GetButtonValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:386"]
  S17 -->|calls| T17
  S18["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T18["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S18 -->|calls| T18
  S19["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T19["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S19 -->|calls| T19
  S20["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T20["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S20 -->|calls| T20
  S21["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T21["function:SelectPreferedButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:493"]
  S21 -->|calls| T21
  S22["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T22["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S22 -->|calls| T22
  S23["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T23["function:SelectPreferedButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:493"]
  S23 -->|calls| T23
  S24["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T24["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S24 -->|calls| T24
  S25["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T25["function:SelectPreferedButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:493"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

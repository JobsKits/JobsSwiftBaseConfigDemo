# `calls 符号关系 - 053`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T1["function:QuatIdentity<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:38"]
  S1 -->|calls| T1
  S2["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T2["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  S2 -->|calls| T2
  S3["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T3["function:VecMake<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:18"]
  S3 -->|calls| T3
  S4["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T4["function:VecScale<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:32"]
  S4 -->|calls| T4
  S5["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T5["function:QuatToEuler<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:63"]
  S5 -->|calls| T5
  S6["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T6["function:QuatDifference<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:83"]
  S6 -->|calls| T6
  S7["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T7["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  S7 -->|calls| T7
  S8["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T8["function:VecMake<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:18"]
  S8 -->|calls| T8
  S9["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T9["function:ReportJoystickXYZAxes<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:466"]
  S9 -->|calls| T9
  S10["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T10["function:ReportJoystickXYZAxes<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:466"]
  S10 -->|calls| T10
  S11["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T11["function:ReportJoystickXYZAxes<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:466"]
  S11 -->|calls| T11
  S12["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T12["function:ReportJoystickXYZWAxes<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:474"]
  S12 -->|calls| T12
  S13["function:ReportJoystick<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:640"]
  T13["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  S13 -->|calls| T13
  S14["function:ReportJoystick<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:640"]
  T14["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  S14 -->|calls| T14
  S15["function:ReportJoystick<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:640"]
  T15["function:SetJoystickButtonState<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:448"]
  S15 -->|calls| T15
  S16["function:UnityUpdateJoystickData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:709"]
  T16["function:UnityInitJoysticks<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:396"]
  S16 -->|calls| T16
  S17["function:UnityUpdateJoystickData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:709"]
  T17["function:QueryControllerCollection<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:428"]
  S17 -->|calls| T17
  S18["function:UnityUpdateJoystickData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:709"]
  T18["function:ReportJoystick<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:640"]
  S18 -->|calls| T18
  S19["function:UnityUpdateJoystickData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:709"]
  T19["function:ReportFakeRemote<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:667"]
  S19 -->|calls| T19
  S20["function:UnityUpdateJoystickData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:709"]
  T20["function:HandleAggregatedJoystickState<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:433"]
  S20 -->|calls| T20
  S21["function:GetJoystickName<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:741"]
  T21["function:FormatJoystickIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:736"]
  S21 -->|calls| T21
  S22["function:UnityGetJoystickNames<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:761"]
  T22["function:QueryControllerCollection<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:428"]
  S22 -->|calls| T22
  S23["function:UnityGetJoystickNames<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:761"]
  T23["function:GetJoystickName<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:741"]
  S23 -->|calls| T23
  S24["function:UnityGetJoystickNames<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:761"]
  T24["function:FormatJoystickIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:736"]
  S24 -->|calls| T24
  S25["function:GetLocationManager<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:835"]
  T25["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

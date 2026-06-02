# `calls 符号关系 - 119`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T1["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S1 -->|calls| T1
  S2["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T2["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S2 -->|calls| T2
  S3["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T3["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S3 -->|calls| T3
  S4["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T4["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S4 -->|calls| T4
  S5["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T5["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S5 -->|calls| T5
  S6["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T6["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S6 -->|calls| T6
  S7["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T7["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S7 -->|calls| T7
  S8["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T8["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S8 -->|calls| T8
  S9["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T9["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S9 -->|calls| T9
  S10["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T10["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S10 -->|calls| T10
  S11["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T11["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S11 -->|calls| T11
  S12["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T12["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S12 -->|calls| T12
  S13["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T13["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S13 -->|calls| T13
  S14["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T14["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S14 -->|calls| T14
  S15["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T15["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S15 -->|calls| T15
  S16["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T16["function:QuatIdentity<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:38"]
  S16 -->|calls| T16
  S17["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T17["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  S17 -->|calls| T17
  S18["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T18["function:VecMake<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:18"]
  S18 -->|calls| T18
  S19["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T19["function:VecScale<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:32"]
  S19 -->|calls| T19
  S20["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T20["function:QuatToEuler<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:63"]
  S20 -->|calls| T20
  S21["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  T21["function:QuatDifference<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:83"]
  S21 -->|calls| T21
  S22["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T22["function:SimulateAttitudeViaGravityVector<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:585"]
  S22 -->|calls| T22
  S23["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T23["function:VecMake<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:18"]
  S23 -->|calls| T23
  S24["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T24["function:ReportJoystickXYZAxes<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:466"]
  S24 -->|calls| T24
  S25["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T25["function:ReportJoystickXYZAxes<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:466"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 118`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityUpdateGyroData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:273"]
  T1["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S1 -->|calls| T1
  S2["function:UnityUpdateGyroData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:273"]
  T2["function:UnityReorientQuaternion<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:113"]
  S2 -->|calls| T2
  S3["function:UnityInitJoysticks<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:396"]
  T3["function:UnitySetAppleTVRemoteAllowRotation<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1096"]
  S3 -->|calls| T3
  S4["function:UnityInitJoysticks<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:396"]
  T4["function:UnitySetAppleTVRemoteReportAbsoluteDpadValues<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1114"]
  S4 -->|calls| T4
  S5["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  T5["function:SetJoystickButtonState<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:448"]
  S5 -->|calls| T5
  S6["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  T6["function:GetButtonPressed<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:391"]
  S6 -->|calls| T6
  S7["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  T7["function:GetButtonValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:386"]
  S7 -->|calls| T7
  S8["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T8["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S8 -->|calls| T8
  S9["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T9["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S9 -->|calls| T9
  S10["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T10["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S10 -->|calls| T10
  S11["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T11["function:SelectPreferedButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:493"]
  S11 -->|calls| T11
  S12["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T12["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S12 -->|calls| T12
  S13["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T13["function:SelectPreferedButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:493"]
  S13 -->|calls| T13
  S14["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T14["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S14 -->|calls| T14
  S15["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T15["function:SelectPreferedButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:493"]
  S15 -->|calls| T15
  S16["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T16["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S16 -->|calls| T16
  S17["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T17["function:SelectPreferedButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:493"]
  S17 -->|calls| T17
  S18["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T18["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S18 -->|calls| T18
  S19["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T19["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S19 -->|calls| T19
  S20["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T20["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S20 -->|calls| T20
  S21["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T21["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S21 -->|calls| T21
  S22["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T22["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S22 -->|calls| T22
  S23["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T23["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S23 -->|calls| T23
  S24["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T24["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S24 -->|calls| T24
  S25["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T25["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

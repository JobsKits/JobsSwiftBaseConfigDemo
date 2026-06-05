# `calls 符号关系 - 052`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T1["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S1 -->|calls| T1
  S2["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T2["function:SelectPreferedButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:493"]
  S2 -->|calls| T2
  S3["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T3["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S3 -->|calls| T3
  S4["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  T4["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S4 -->|calls| T4
  S5["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
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
  T12["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S12 -->|calls| T12
  S13["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T13["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S13 -->|calls| T13
  S14["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T14["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S14 -->|calls| T14
  S15["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T15["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S15 -->|calls| T15
  S16["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T16["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S16 -->|calls| T16
  S17["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T17["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S17 -->|calls| T17
  S18["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T18["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S18 -->|calls| T18
  S19["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T19["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S19 -->|calls| T19
  S20["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T20["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S20 -->|calls| T20
  S21["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T21["function:ReportJoystickButton<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:460"]
  S21 -->|calls| T21
  S22["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T22["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S22 -->|calls| T22
  S23["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T23["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S23 -->|calls| T23
  S24["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T24["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S24 -->|calls| T24
  S25["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  T25["function:GetAxisValue<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:381"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

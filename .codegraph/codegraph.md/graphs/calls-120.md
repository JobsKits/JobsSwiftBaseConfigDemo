# `calls 符号关系 - 120`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T1["function:ReportJoystickXYZAxes<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:466"]
  S1 -->|calls| T1
  S2["file:TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1"]
  T2["function:ReportJoystickXYZWAxes<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:474"]
  S2 -->|calls| T2
  S3["function:ReportJoystick<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:640"]
  T3["function:ReportJoystickExtended<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:543"]
  S3 -->|calls| T3
  S4["function:ReportJoystick<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:640"]
  T4["function:ReportJoystickMicro<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:501"]
  S4 -->|calls| T4
  S5["function:ReportJoystick<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:640"]
  T5["function:SetJoystickButtonState<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:448"]
  S5 -->|calls| T5
  S6["function:UnityUpdateJoystickData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:709"]
  T6["function:UnityInitJoysticks<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:396"]
  S6 -->|calls| T6
  S7["function:UnityUpdateJoystickData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:709"]
  T7["function:QueryControllerCollection<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:428"]
  S7 -->|calls| T7
  S8["function:UnityUpdateJoystickData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:709"]
  T8["function:ReportJoystick<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:640"]
  S8 -->|calls| T8
  S9["function:UnityUpdateJoystickData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:709"]
  T9["function:ReportFakeRemote<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:667"]
  S9 -->|calls| T9
  S10["function:UnityUpdateJoystickData<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:709"]
  T10["function:HandleAggregatedJoystickState<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:433"]
  S10 -->|calls| T10
  S11["function:GetJoystickName<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:741"]
  T11["function:FormatJoystickIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:736"]
  S11 -->|calls| T11
  S12["function:UnityGetJoystickNames<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:761"]
  T12["function:QueryControllerCollection<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:428"]
  S12 -->|calls| T12
  S13["function:UnityGetJoystickNames<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:761"]
  T13["function:GetJoystickName<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:741"]
  S13 -->|calls| T13
  S14["function:UnityGetJoystickNames<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:761"]
  T14["function:FormatJoystickIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:736"]
  S14 -->|calls| T14
  S15["function:GetLocationManager<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:835"]
  T15["method:KeyboardDelegate::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:329"]
  S15 -->|calls| T15
  S16["function:SetHeadingUpdatesEnabled<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:925"]
  T16["function:IsHeadingAvailable<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:977"]
  S16 -->|calls| T16
  S17["method:LocationServiceDelegate::locationManager:didUpdateHeading:<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1002"]
  T17["function:UnityReorientVector3<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:86"]
  S17 -->|calls| T17
  S18["method:LocationServiceDelegate::locationManager:didUpdateHeading:<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1002"]
  T18["function:UnityReorientHeading<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:58"]
  S18 -->|calls| T18
  S19["method:LocationServiceDelegate::locationManager:didUpdateHeading:<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1002"]
  T19["function:UnityReorientHeading<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:58"]
  S19 -->|calls| T19
  S20["function:QueryMicroController<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1033"]
  T20["function:QueryControllerCollection<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:428"]
  S20 -->|calls| T20
  S21["function:UnityGetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1060"]
  T21["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S21 -->|calls| T21
  S22["function:UnitySetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1071"]
  T22["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S22 -->|calls| T22
  S23["function:UnitySetAppleTVRemoteAllowExitToMenu<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1071"]
  T23["function:UnityGetGLViewController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:604"]
  S23 -->|calls| T23
  S24["function:UnityGetAppleTVRemoteAllowRotation<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1087"]
  T24["function:QueryMicroController<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1033"]
  S24 -->|calls| T24
  S25["function:UnitySetAppleTVRemoteAllowRotation<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1096"]
  T25["function:QueryMicroController<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1033"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

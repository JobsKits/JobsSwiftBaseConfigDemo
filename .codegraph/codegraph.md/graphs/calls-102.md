# `calls 符号关系 - 102`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityAdIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:70"]
  T1["function:QueryASIdentifierManager<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:12"]
  S1 -->|calls| T1
  S2["function:UnityAdIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:70"]
  T2["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S2 -->|calls| T2
  S3["function:UnityAdIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:70"]
  T3["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S3 -->|calls| T3
  S4["function:UnityAdTrackingEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:125"]
  T4["function:QueryAttTrackingAuthorization<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:32"]
  S4 -->|calls| T4
  S5["function:UnityAdTrackingEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:125"]
  T5["function:QueryASIdentifierManager<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:12"]
  S5 -->|calls| T5
  S6["function:UnityVendorIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:146"]
  T6["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S6 -->|calls| T6
  S7["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  T7["function:malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:447"]
  S7 -->|calls| T7
  S8["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  T8["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S8 -->|calls| T8
  S9["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  T9["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S9 -->|calls| T9
  S10["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  T10["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S10 -->|calls| T10
  S11["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  T11["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S11 -->|calls| T11
  S12["function:UnitySystemLanguage<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:229"]
  T12["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S12 -->|calls| T12
  S13["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  T13["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  S13 -->|calls| T13
  S14["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  T14["function:ParseDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:360"]
  S14 -->|calls| T14
  S15["function:UnityDeviceHasCutout<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:426"]
  T15["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  S15 -->|calls| T15
  S16["function:UnityDeviceSupportsUpsideDown<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:444"]
  T16["function:UnityDeviceHasCutout<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:426"]
  S16 -->|calls| T16
  S17["function:UnityDeviceSupportedOrientations<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:449"]
  T17["function:UnityDeviceSupportsUpsideDown<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:444"]
  S17 -->|calls| T17
  S18["function:UnityDeviceIsForceTouchSupported<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:458"]
  T18["function:UnityGetUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:605"]
  S18 -->|calls| T18
  S19["function:UnityDeviceIsStylusTouchSupported<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:463"]
  T19["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  S19 -->|calls| T19
  S20["function:UnityDeviceCanShowWideColor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:475"]
  T20["function:UnityGetUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:605"]
  S20 -->|calls| T20
  S21["function:UnityDeviceDPI<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:480"]
  T21["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  S21 -->|calls| T21
  S22["function:UnityDeviceUniqueIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:608"]
  T22["function:UnityVendorIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:146"]
  S22 -->|calls| T22
  S23["function:GetMainDisplay<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:63"]
  T23["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S23 -->|calls| T23
  S24["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  T24["function:GetMainDisplay<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:63"]
  S24 -->|calls| T24
  S25["method:DisplayConnection::init:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:49"]
  T25["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

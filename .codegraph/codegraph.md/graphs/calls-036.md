# `calls 符号关系 - 036`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UnityDeviceSupportsUpsideDown<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:444"]
  T1["function:UnityDeviceHasCutout<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:426"]
  S1 -->|calls| T1
  S2["function:UnityDeviceSupportedOrientations<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:449"]
  T2["function:UnityDeviceSupportsUpsideDown<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:444"]
  S2 -->|calls| T2
  S3["function:UnityDeviceIsForceTouchSupported<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:458"]
  T3["function:UnityGetUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:605"]
  S3 -->|calls| T3
  S4["function:UnityDeviceIsStylusTouchSupported<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:463"]
  T4["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  S4 -->|calls| T4
  S5["function:UnityDeviceCanShowWideColor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:475"]
  T5["function:UnityGetUnityView<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:605"]
  S5 -->|calls| T5
  S6["function:UnityDeviceDPI<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:480"]
  T6["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  S6 -->|calls| T6
  S7["function:UnityDeviceUniqueIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:608"]
  T7["function:UnityVendorIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:146"]
  S7 -->|calls| T7
  S8["function:GetMainDisplay<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:63"]
  T8["method:DisplayManager::Instance<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:458"]
  S8 -->|calls| T8
  S9["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  T9["function:GetMainDisplay<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:63"]
  S9 -->|calls| T9
  S10["method:DisplayConnection::init:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:49"]
  T10["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S10 -->|calls| T10
  S11["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  T11["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S11 -->|calls| T11
  S12["method:DisplayConnection::createView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:93"]
  T12["method:DisplayConnection::createView:showRightAway:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:98"]
  S12 -->|calls| T12
  S13["method:DisplayConnection::createView:showRightAway:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:98"]
  T13["function:UnityScreenScaleFactor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:706"]
  S13 -->|calls| T13
  S14["method:DisplayConnection::createView:showRightAway:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:98"]
  T14["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S14 -->|calls| T14
  S15["method:DisplayConnection::createView:showRightAway:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:98"]
  T15["method:DisplayConnection::createWithWindow:andView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:84"]
  S15 -->|calls| T15
  S16["method:DisplayConnection::initRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:134"]
  T16["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S16 -->|calls| T16
  S17["method:DisplayConnection::initRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:134"]
  T17["function:UnityGetMetalDevice<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:193"]
  S17 -->|calls| T17
  S18["method:DisplayConnection::initRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:134"]
  T18["function:UnityCommandQueueMaxCommandBufferCountMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:390"]
  S18 -->|calls| T18
  S19["method:DisplayConnection::recreateSurface:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:156"]
  T19["method:DisplayConnection::initRendering<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:134"]
  S19 -->|calls| T19
  S20["method:DisplayConnection::recreateSurface:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:156"]
  T20["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S20 -->|calls| T20
  S21["method:DisplayConnection::recreateSurface:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:156"]
  T21["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S21 -->|calls| T21
  S22["method:DisplayConnection::destroySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:231"]
  T22["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S22 -->|calls| T22
  S23["method:DisplayManager::registerScreen:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:308"]
  T23["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:313"]
  S23 -->|calls| T23
  S24["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:313"]
  T24["method:DisplayManager::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:313"]
  S24 -->|calls| T24
  S25["method:DisplayManager::dealloc<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:342"]
  T25["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

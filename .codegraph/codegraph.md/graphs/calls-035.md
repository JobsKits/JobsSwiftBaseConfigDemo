# `calls 符号关系 - 035`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CameraCaptureDevice::initWithDevice:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:626"]
  T1["method:CameraCaptureDevice::getKind<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:480"]
  S1 -->|calls| T1
  S2["method:CameraCaptureDevice::initWithDevice:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:626"]
  T2["method:CameraCaptureDevice::fillCaptureDeviceResolutions<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:528"]
  S2 -->|calls| T2
  S3["method:CameraCaptureDevice::initCaptureForController:width:height:fps:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:640"]
  T3["method:CameraCaptureDevice::pickPresetFromWidth:height:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:591"]
  S3 -->|calls| T3
  S4["method:CameraCaptureDevice::initCaptureForController:width:height:fps:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:640"]
  T4["method:CameraCaptureDevice::isColorAndDepthCaptureDevice<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:468"]
  S4 -->|calls| T4
  S5["function:UnityEnumVideoCaptureDevices<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:675"]
  T5["method:CameraCaptureDevice::initialized<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:657"]
  S5 -->|calls| T5
  S6["function:UnityEnumVideoCaptureDevices<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:675"]
  T6["method:CameraCaptureDevice::createCameraCaptureDevicesArray<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:662"]
  S6 -->|calls| T6
  S7["function:UnityEnumVideoCaptureDevices<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:675"]
  T7["function:UnityiOS130orNewer<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:690"]
  S7 -->|calls| T7
  S8["function:UnityStopCameraCapture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:753"]
  T8["method:CameraCaptureController::stop<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:384"]
  S8 -->|calls| T8
  S9["function:UnityCameraCaptureVideoRotationDeg<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:778"]
  T9["function:UnityCurrentOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:609"]
  S9 -->|calls| T9
  S10["function:UnityCameraCaptureVerticallyMirrored<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:797"]
  T10["method:CameraCaptureController::isCVTextureFlipped<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:170"]
  S10 -->|calls| T10
  S11["function:UnityAdIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:70"]
  T11["function:QueryASIdentifierManager<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:12"]
  S11 -->|calls| T11
  S12["function:UnityAdIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:70"]
  T12["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S12 -->|calls| T12
  S13["function:UnityAdIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:70"]
  T13["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S13 -->|calls| T13
  S14["function:UnityAdTrackingEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:125"]
  T14["function:QueryAttTrackingAuthorization<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:32"]
  S14 -->|calls| T14
  S15["function:UnityAdTrackingEnabled<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:125"]
  T15["function:QueryASIdentifierManager<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:12"]
  S15 -->|calls| T15
  S16["function:UnityVendorIdentifier<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:146"]
  T16["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S16 -->|calls| T16
  S17["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  T17["function:malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:447"]
  S17 -->|calls| T17
  S18["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  T18["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S18 -->|calls| T18
  S19["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  T19["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S19 -->|calls| T19
  S20["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  T20["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S20 -->|calls| T20
  S21["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  T21["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S21 -->|calls| T21
  S22["function:UnitySystemLanguage<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:229"]
  T22["function:AllocCString<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityInterface.h:411"]
  S22 -->|calls| T22
  S23["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  T23["function:UnityDeviceModel<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:175"]
  S23 -->|calls| T23
  S24["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  T24["function:ParseDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:360"]
  S24 -->|calls| T24
  S25["function:UnityDeviceHasCutout<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:426"]
  T25["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

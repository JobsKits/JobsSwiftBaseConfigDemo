# `calls 符号关系 - 101`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CameraCaptureController::clearColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:252"]
  T1["method:CameraCaptureController::getActiveColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:216"]
  S1 -->|calls| T1
  S2["method:CameraCaptureController::clearColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:252"]
  T2["method:CameraCaptureController::clearColorAndDepthCameraCaptureSession<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:318"]
  S2 -->|calls| T2
  S3["method:CameraCaptureController::findColorAndDepthCameraController:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:266"]
  T3["method:CameraCaptureController::getActiveColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:216"]
  S3 -->|calls| T3
  S4["method:CameraCaptureController::initColorAndDepthCameraCapture:preset:fps:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:276"]
  T4["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S4 -->|calls| T4
  S5["method:CameraCaptureController::initColorAndDepthCameraCapture:preset:fps:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:276"]
  T5["method:CameraCaptureController::initColorAndDepthCameraCaptureSession<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:305"]
  S5 -->|calls| T5
  S6["method:CameraCaptureController::initColorAndDepthCameraCaptureSession<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:305"]
  T6["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S6 -->|calls| T6
  S7["method:CameraCaptureController::dataOutputSynchronizer:didOutputSynchronizedDataCollection:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:329"]
  T7["function:CMVideoSampling_SampleBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:71"]
  S7 -->|calls| T7
  S8["method:CameraCaptureController::dataOutputSynchronizer:didOutputSynchronizedDataCollection:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:329"]
  T8["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  S8 -->|calls| T8
  S9["method:CameraCaptureController::start<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:356"]
  T9["method:CameraCaptureController::clearColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:252"]
  S9 -->|calls| T9
  S10["method:CameraCaptureController::stop<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:384"]
  T10["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S10 -->|calls| T10
  S11["method:CameraCaptureController::stop<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:384"]
  T11["function:CMVideoSampling_Uninitialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:14"]
  S11 -->|calls| T11
  S12["method:CameraCaptureDevice::getKind<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:480"]
  T12["method:CameraCaptureDevice::isColorAndDepthCaptureDevice<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:468"]
  S12 -->|calls| T12
  S13["method:CameraCaptureDevice::getKind<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:480"]
  T13["method:CameraCaptureDevice::isColorAndDepthCaptureDevice<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:468"]
  S13 -->|calls| T13
  S14["method:CameraCaptureDevice::fillCaptureDeviceResolutions<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:528"]
  T14["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S14 -->|calls| T14
  S15["method:CameraCaptureDevice::fillCaptureDeviceResolutions<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:528"]
  T15["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S15 -->|calls| T15
  S16["method:CameraCaptureDevice::initWithDevice:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:626"]
  T16["method:CameraCaptureDevice::getKind<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:480"]
  S16 -->|calls| T16
  S17["method:CameraCaptureDevice::initWithDevice:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:626"]
  T17["method:CameraCaptureDevice::fillCaptureDeviceResolutions<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:528"]
  S17 -->|calls| T17
  S18["method:CameraCaptureDevice::initCaptureForController:width:height:fps:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:640"]
  T18["method:CameraCaptureDevice::pickPresetFromWidth:height:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:591"]
  S18 -->|calls| T18
  S19["method:CameraCaptureDevice::initCaptureForController:width:height:fps:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:640"]
  T19["method:CameraCaptureDevice::isColorAndDepthCaptureDevice<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:468"]
  S19 -->|calls| T19
  S20["function:UnityEnumVideoCaptureDevices<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:675"]
  T20["method:CameraCaptureDevice::initialized<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:657"]
  S20 -->|calls| T20
  S21["function:UnityEnumVideoCaptureDevices<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:675"]
  T21["method:CameraCaptureDevice::createCameraCaptureDevicesArray<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:662"]
  S21 -->|calls| T21
  S22["function:UnityEnumVideoCaptureDevices<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:675"]
  T22["function:UnityiOS130orNewer<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:690"]
  S22 -->|calls| T22
  S23["function:UnityStopCameraCapture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:753"]
  T23["method:CameraCaptureController::stop<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:384"]
  S23 -->|calls| T23
  S24["function:UnityCameraCaptureVideoRotationDeg<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:778"]
  T24["function:UnityCurrentOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:609"]
  S24 -->|calls| T24
  S25["function:UnityCameraCaptureVerticallyMirrored<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:797"]
  T25["method:CameraCaptureController::isCVTextureFlipped<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:170"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

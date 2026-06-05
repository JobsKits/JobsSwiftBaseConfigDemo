# `calls 符号关系 - 034`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CameraCaptureController::setFocusPointWithX:Y:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:182"]
  T1["method:CameraCaptureController::setFocusPoint<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:199"]
  S1 -->|calls| T1
  S2["method:CameraCaptureController::getActiveColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:216"]
  T2["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S2 -->|calls| T2
  S3["method:CameraCaptureController::addColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:225"]
  T3["method:CameraCaptureController::findColorAndDepthCameraController:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:266"]
  S3 -->|calls| T3
  S4["method:CameraCaptureController::addColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:225"]
  T4["method:CameraCaptureController::pause<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:373"]
  S4 -->|calls| T4
  S5["method:CameraCaptureController::addColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:225"]
  T5["method:CameraCaptureController::findColorAndDepthCameraController:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:266"]
  S5 -->|calls| T5
  S6["method:CameraCaptureController::addColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:225"]
  T6["method:CameraCaptureController::clearColorAndDepthCameraCaptureSession<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:318"]
  S6 -->|calls| T6
  S7["method:CameraCaptureController::addColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:225"]
  T7["method:CameraCaptureController::getActiveColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:216"]
  S7 -->|calls| T7
  S8["method:CameraCaptureController::removeColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:239"]
  T8["method:CameraCaptureController::getActiveColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:216"]
  S8 -->|calls| T8
  S9["method:CameraCaptureController::removeColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:239"]
  T9["method:CameraCaptureController::findColorAndDepthCameraController:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:266"]
  S9 -->|calls| T9
  S10["method:CameraCaptureController::removeColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:239"]
  T10["method:CameraCaptureController::initColorAndDepthCameraCaptureSession<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:305"]
  S10 -->|calls| T10
  S11["method:CameraCaptureController::clearColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:252"]
  T11["method:CameraCaptureController::getActiveColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:216"]
  S11 -->|calls| T11
  S12["method:CameraCaptureController::clearColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:252"]
  T12["method:CameraCaptureController::clearColorAndDepthCameraCaptureSession<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:318"]
  S12 -->|calls| T12
  S13["method:CameraCaptureController::findColorAndDepthCameraController:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:266"]
  T13["method:CameraCaptureController::getActiveColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:216"]
  S13 -->|calls| T13
  S14["method:CameraCaptureController::initColorAndDepthCameraCapture:preset:fps:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:276"]
  T14["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S14 -->|calls| T14
  S15["method:CameraCaptureController::initColorAndDepthCameraCapture:preset:fps:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:276"]
  T15["method:CameraCaptureController::initColorAndDepthCameraCaptureSession<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:305"]
  S15 -->|calls| T15
  S16["method:CameraCaptureController::initColorAndDepthCameraCaptureSession<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:305"]
  T16["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S16 -->|calls| T16
  S17["method:CameraCaptureController::dataOutputSynchronizer:didOutputSynchronizedDataCollection:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:329"]
  T17["function:CMVideoSampling_SampleBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:71"]
  S17 -->|calls| T17
  S18["method:CameraCaptureController::dataOutputSynchronizer:didOutputSynchronizedDataCollection:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:329"]
  T18["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  S18 -->|calls| T18
  S19["method:CameraCaptureController::start<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:356"]
  T19["method:CameraCaptureController::clearColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:252"]
  S19 -->|calls| T19
  S20["method:CameraCaptureController::stop<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:384"]
  T20["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S20 -->|calls| T20
  S21["method:CameraCaptureController::stop<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:384"]
  T21["function:CMVideoSampling_Uninitialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:14"]
  S21 -->|calls| T21
  S22["method:CameraCaptureDevice::getKind<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:480"]
  T22["method:CameraCaptureDevice::isColorAndDepthCaptureDevice<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:468"]
  S22 -->|calls| T22
  S23["method:CameraCaptureDevice::getKind<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:480"]
  T23["method:CameraCaptureDevice::isColorAndDepthCaptureDevice<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:468"]
  S23 -->|calls| T23
  S24["method:CameraCaptureDevice::fillCaptureDeviceResolutions<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:528"]
  T24["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S24 -->|calls| T24
  S25["method:CameraCaptureDevice::fillCaptureDeviceResolutions<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:528"]
  T25["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

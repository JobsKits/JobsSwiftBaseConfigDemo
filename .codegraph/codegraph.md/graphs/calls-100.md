# `calls 符号关系 - 100`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:CreateReadableRTFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:77"]
  T1["function:CreateTextureFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:29"]
  S1 -->|calls| T1
  S2["function:IsCVTextureFlipped<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:83"]
  T2["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S2 -->|calls| T2
  S3["function:CreatePixelBufferForCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:94"]
  T3["function:CreatePixelBufferForCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:64"]
  S3 -->|calls| T3
  S4["function:CreateReadableRTFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:99"]
  T4["function:CreatePixelBufferForCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:64"]
  S4 -->|calls| T4
  S5["function:CreateReadableRTFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:99"]
  T5["function:CreateBGRA32TextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:105"]
  S5 -->|calls| T5
  S6["function:CreateBGRA32TextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:105"]
  T6["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S6 -->|calls| T6
  S7["function:CreateBGRA32TextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:105"]
  T7["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S7 -->|calls| T7
  S8["function:CreateHalfFloatTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:126"]
  T8["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S8 -->|calls| T8
  S9["method:CameraCaptureController::initCapture:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:38"]
  T9["function:UnityGetAVCapturePermission<br/>TODO/Unity/xcode_effectTest/Classes/Unity/AVCapture.mm:15"]
  S9 -->|calls| T9
  S10["method:CameraCaptureController::initCapture:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:38"]
  T10["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S10 -->|calls| T10
  S11["method:CameraCaptureController::initCapture:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:38"]
  T11["function:CMVideoSampling_Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:8"]
  S11 -->|calls| T11
  S12["method:CameraCaptureController::initCapture:preset:fps:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:95"]
  T12["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S12 -->|calls| T12
  S13["method:CameraCaptureController::captureOutput:didOutputSampleBuffer:fromConnection:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:122"]
  T13["function:CMVideoSampling_SampleBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:71"]
  S13 -->|calls| T13
  S14["method:CameraCaptureController::capturePixelBufferToMemBuffer:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:128"]
  T14["function:malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:447"]
  S14 -->|calls| T14
  S15["method:CameraCaptureController::isCVTextureFlipped<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:170"]
  T15["function:IsCVTextureFlipped<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:83"]
  S15 -->|calls| T15
  S16["method:CameraCaptureController::setFocusPointWithX:Y:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:182"]
  T16["method:CameraCaptureController::setFocusPoint<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:199"]
  S16 -->|calls| T16
  S17["method:CameraCaptureController::getActiveColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:216"]
  T17["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S17 -->|calls| T17
  S18["method:CameraCaptureController::addColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:225"]
  T18["method:CameraCaptureController::findColorAndDepthCameraController:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:266"]
  S18 -->|calls| T18
  S19["method:CameraCaptureController::addColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:225"]
  T19["method:CameraCaptureController::pause<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:373"]
  S19 -->|calls| T19
  S20["method:CameraCaptureController::addColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:225"]
  T20["method:CameraCaptureController::findColorAndDepthCameraController:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:266"]
  S20 -->|calls| T20
  S21["method:CameraCaptureController::addColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:225"]
  T21["method:CameraCaptureController::clearColorAndDepthCameraCaptureSession<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:318"]
  S21 -->|calls| T21
  S22["method:CameraCaptureController::addColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:225"]
  T22["method:CameraCaptureController::getActiveColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:216"]
  S22 -->|calls| T22
  S23["method:CameraCaptureController::removeColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:239"]
  T23["method:CameraCaptureController::getActiveColorAndDepthCameraControllers<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:216"]
  S23 -->|calls| T23
  S24["method:CameraCaptureController::removeColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:239"]
  T24["method:CameraCaptureController::findColorAndDepthCameraController:isDepth:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:266"]
  S24 -->|calls| T24
  S25["method:CameraCaptureController::removeColorAndDepthCameraController:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:239"]
  T25["method:CameraCaptureController::initColorAndDepthCameraCaptureSession<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:305"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

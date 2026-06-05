# `calls 符号关系 - 033`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:CMVideoSampling_SampleBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:71"]
  T1["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  S1 -->|calls| T1
  S2["function:CMVideoSampling_LastSampledTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:76"]
  T2["function:GetTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:57"]
  S2 -->|calls| T2
  S3["function:CreateCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:7"]
  T3["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S3 -->|calls| T3
  S4["function:CreateCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:7"]
  T4["function:UnityGetMetalDevice<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:193"]
  S4 -->|calls| T4
  S5["function:FlushCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:23"]
  T5["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S5 -->|calls| T5
  S6["function:CreateTextureFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:29"]
  T6["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S6 -->|calls| T6
  S7["function:GetMetalTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:51"]
  T7["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S7 -->|calls| T7
  S8["function:GetTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:57"]
  T8["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S8 -->|calls| T8
  S9["function:GetTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:57"]
  T9["function:GetMetalTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:51"]
  S9 -->|calls| T9
  S10["function:CreateReadableRTFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:77"]
  T10["function:CreatePixelBufferForCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:64"]
  S10 -->|calls| T10
  S11["function:CreateReadableRTFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:77"]
  T11["function:CreateTextureFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:29"]
  S11 -->|calls| T11
  S12["function:IsCVTextureFlipped<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:83"]
  T12["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S12 -->|calls| T12
  S13["function:CreatePixelBufferForCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:94"]
  T13["function:CreatePixelBufferForCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:64"]
  S13 -->|calls| T13
  S14["function:CreateReadableRTFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:99"]
  T14["function:CreatePixelBufferForCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:64"]
  S14 -->|calls| T14
  S15["function:CreateReadableRTFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:99"]
  T15["function:CreateBGRA32TextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:105"]
  S15 -->|calls| T15
  S16["function:CreateBGRA32TextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:105"]
  T16["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S16 -->|calls| T16
  S17["function:CreateBGRA32TextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:105"]
  T17["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S17 -->|calls| T17
  S18["function:CreateHalfFloatTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:126"]
  T18["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S18 -->|calls| T18
  S19["method:CameraCaptureController::initCapture:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:38"]
  T19["function:UnityGetAVCapturePermission<br/>TODO/Unity/xcode_effectTest/Classes/Unity/AVCapture.mm:15"]
  S19 -->|calls| T19
  S20["method:CameraCaptureController::initCapture:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:38"]
  T20["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S20 -->|calls| T20
  S21["method:CameraCaptureController::initCapture:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:38"]
  T21["function:CMVideoSampling_Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:8"]
  S21 -->|calls| T21
  S22["method:CameraCaptureController::initCapture:preset:fps:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:95"]
  T22["method:DisplayConnection::init<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:71"]
  S22 -->|calls| T22
  S23["method:CameraCaptureController::captureOutput:didOutputSampleBuffer:fromConnection:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:122"]
  T23["function:CMVideoSampling_SampleBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:71"]
  S23 -->|calls| T23
  S24["method:CameraCaptureController::capturePixelBufferToMemBuffer:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:128"]
  T24["function:malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:447"]
  S24 -->|calls| T24
  S25["method:CameraCaptureController::isCVTextureFlipped<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:170"]
  T25["function:IsCVTextureFlipped<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:83"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

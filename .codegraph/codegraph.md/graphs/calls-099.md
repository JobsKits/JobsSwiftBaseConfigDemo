# `calls 符号关系 - 099`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityViewControllerBase::viewWillLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:19"]
  T1["method:UnityViewControllerBase::viewWillLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:19"]
  S1 -->|calls| T1
  S2["method:UnityViewControllerBase::viewWillLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:19"]
  T2["method:UnityViewControllerNotificationsDefaultSender::onViewWillLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:50"]
  S2 -->|calls| T2
  S3["method:UnityViewControllerBase::viewDidLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:25"]
  T3["method:UnityViewControllerBase::viewDidLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:25"]
  S3 -->|calls| T3
  S4["method:UnityViewControllerBase::viewDidLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:25"]
  T4["method:UnityViewControllerNotificationsDefaultSender::onViewDidLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:55"]
  S4 -->|calls| T4
  S5["function:AllocUnityViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:79"]
  T5["function:AllocUnityDefaultViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:57"]
  S5 -->|calls| T5
  S6["function:AllocUnityViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:79"]
  T6["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S6 -->|calls| T6
  S7["function:AllocUnityViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:79"]
  T7["function:AllocUnitySingleOrientationViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:63"]
  S7 -->|calls| T7
  S8["function:AllocUnityViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:79"]
  T8["function:AllocUnityDefaultViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:57"]
  S8 -->|calls| T8
  S9["function:UnityGetAVCapturePermission<br/>TODO/Unity/xcode_effectTest/Classes/Unity/AVCapture.mm:15"]
  T9["function:MediaTypeFromEnum<br/>TODO/Unity/xcode_effectTest/Classes/Unity/AVCapture.mm:6"]
  S9 -->|calls| T9
  S10["function:UnityRequestAVCapturePermission<br/>TODO/Unity/xcode_effectTest/Classes/Unity/AVCapture.mm:34"]
  T10["function:MediaTypeFromEnum<br/>TODO/Unity/xcode_effectTest/Classes/Unity/AVCapture.mm:6"]
  S10 -->|calls| T10
  S11["function:CMVideoSampling_Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:8"]
  T11["function:CreateCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:7"]
  S11 -->|calls| T11
  S12["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  T12["function:FlushCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:23"]
  S12 -->|calls| T12
  S13["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  T13["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S13 -->|calls| T13
  S14["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  T14["function:CreateTextureFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:29"]
  S14 -->|calls| T14
  S15["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  T15["function:GetTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:57"]
  S15 -->|calls| T15
  S16["function:CMVideoSampling_SampleBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:71"]
  T16["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  S16 -->|calls| T16
  S17["function:CMVideoSampling_LastSampledTexture<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:76"]
  T17["function:GetTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:57"]
  S17 -->|calls| T17
  S18["function:CreateCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:7"]
  T18["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S18 -->|calls| T18
  S19["function:CreateCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:7"]
  T19["function:UnityGetMetalDevice<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:193"]
  S19 -->|calls| T19
  S20["function:FlushCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:23"]
  T20["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S20 -->|calls| T20
  S21["function:CreateTextureFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:29"]
  T21["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S21 -->|calls| T21
  S22["function:GetMetalTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:51"]
  T22["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S22 -->|calls| T22
  S23["function:GetTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:57"]
  T23["function:UnitySelectedRenderingAPI<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:195"]
  S23 -->|calls| T23
  S24["function:GetTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:57"]
  T24["function:GetMetalTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:51"]
  S24 -->|calls| T24
  S25["function:CreateReadableRTFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:77"]
  T25["function:CreatePixelBufferForCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:64"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

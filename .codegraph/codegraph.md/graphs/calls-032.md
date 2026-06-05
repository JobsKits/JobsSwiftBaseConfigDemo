# `calls 符号关系 - 032`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T1["method:KeyboardDelegate::FinishReorientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:673"]
  S1 -->|calls| T1
  S2["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T2["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S2 -->|calls| T2
  S3["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T3["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  S3 -->|calls| T3
  S4["method:UnityFixedOrientationViewController::initWithOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:207"]
  T4["method:UnityPortraitOnlyViewController::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:250"]
  S4 -->|calls| T4
  S5["method:UnityFixedOrientationViewController::viewWillAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:226"]
  T5["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S5 -->|calls| T5
  S6["method:UnityFixedOrientationViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:232"]
  T6["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S6 -->|calls| T6
  S7["method:UnityFixedOrientationViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:232"]
  T7["method:UnityFixedOrientationViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:232"]
  S7 -->|calls| T7
  S8["function:EnabledAutorotationInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:288"]
  T8["function:UnityDeviceSupportsUpsideDown<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:444"]
  S8 -->|calls| T8
  S9["function:EnabledAutorotationInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:288"]
  T9["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S9 -->|calls| T9
  S10["method:UnityViewControllerBase::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:12"]
  T10["method:UnityViewControllerBase::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:12"]
  S10 -->|calls| T10
  S11["method:UnityViewControllerBase::viewWillLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:19"]
  T11["method:UnityViewControllerBase::viewWillLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:19"]
  S11 -->|calls| T11
  S12["method:UnityViewControllerBase::viewWillLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:19"]
  T12["method:UnityViewControllerNotificationsDefaultSender::onViewWillLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:50"]
  S12 -->|calls| T12
  S13["method:UnityViewControllerBase::viewDidLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:25"]
  T13["method:UnityViewControllerBase::viewDidLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:25"]
  S13 -->|calls| T13
  S14["method:UnityViewControllerBase::viewDidLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:25"]
  T14["method:UnityViewControllerNotificationsDefaultSender::onViewDidLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:55"]
  S14 -->|calls| T14
  S15["function:AllocUnityViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:79"]
  T15["function:AllocUnityDefaultViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:57"]
  S15 -->|calls| T15
  S16["function:AllocUnityViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:79"]
  T16["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S16 -->|calls| T16
  S17["function:AllocUnityViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:79"]
  T17["function:AllocUnitySingleOrientationViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:63"]
  S17 -->|calls| T17
  S18["function:AllocUnityViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:79"]
  T18["function:AllocUnityDefaultViewController<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:57"]
  S18 -->|calls| T18
  S19["function:UnityGetAVCapturePermission<br/>TODO/Unity/xcode_effectTest/Classes/Unity/AVCapture.mm:15"]
  T19["function:MediaTypeFromEnum<br/>TODO/Unity/xcode_effectTest/Classes/Unity/AVCapture.mm:6"]
  S19 -->|calls| T19
  S20["function:UnityRequestAVCapturePermission<br/>TODO/Unity/xcode_effectTest/Classes/Unity/AVCapture.mm:34"]
  T20["function:MediaTypeFromEnum<br/>TODO/Unity/xcode_effectTest/Classes/Unity/AVCapture.mm:6"]
  S20 -->|calls| T20
  S21["function:CMVideoSampling_Initialize<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:8"]
  T21["function:CreateCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:7"]
  S21 -->|calls| T21
  S22["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  T22["function:FlushCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:23"]
  S22 -->|calls| T22
  S23["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  T23["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S23 -->|calls| T23
  S24["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  T24["function:CreateTextureFromCVTextureCache2<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:29"]
  S24 -->|calls| T24
  S25["function:CMVideoSampling_ImageBuffer<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CMVideoSampling.mm:33"]
  T25["function:GetTextureFromCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:57"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

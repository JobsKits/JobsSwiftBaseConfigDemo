# `calls 符号关系 - 031`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GetCutoutToScreenRatio<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:317"]
  T1["function:UnityDeviceHasCutout<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:426"]
  S1 -->|calls| T1
  S2["method:UnityViewControllerBase::prefersStatusBarHidden<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:36"]
  T2["variable:objectForKey<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-threads-mach-helper.c:32"]
  S2 -->|calls| T2
  S3["method:UnityViewControllerBase::preferredStatusBarStyle<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:51"]
  T3["variable:objectForKey<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-threads-mach-helper.c:32"]
  S3 -->|calls| T3
  S4["method:UnityDefaultViewController::readOrientationFromUnity<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:106"]
  T4["function:EnabledAutorotationInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:288"]
  S4 -->|calls| T4
  S5["method:UnityDefaultViewController::readOrientationFromUnity<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:106"]
  T5["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S5 -->|calls| T5
  S6["method:UnityDefaultViewController::initShouldHandleFixedOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:120"]
  T6["method:UnityPortraitOnlyViewController::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:250"]
  S6 -->|calls| T6
  S7["method:UnityDefaultViewController::initShouldHandleFixedOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:120"]
  T7["method:UnityDefaultViewController::readOrientationFromUnity<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:106"]
  S7 -->|calls| T7
  S8["method:UnityDefaultViewController::updateSupportedOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:133"]
  T8["method:UnityDefaultViewController::readOrientationFromUnity<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:106"]
  S8 -->|calls| T8
  S9["method:UnityDefaultViewController::viewWillAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:146"]
  T9["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  S9 -->|calls| T9
  S10["method:UnityDefaultViewController::viewWillAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:146"]
  T10["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S10 -->|calls| T10
  S11["method:UnityDefaultViewController::viewWillAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:146"]
  T11["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S11 -->|calls| T11
  S12["method:UnityDefaultViewController::viewDidAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:153"]
  T12["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  S12 -->|calls| T12
  S13["method:UnityDefaultViewController::viewDidAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:153"]
  T13["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S13 -->|calls| T13
  S14["method:UnityDefaultViewController::viewDidAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:153"]
  T14["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S14 -->|calls| T14
  S15["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T15["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S15 -->|calls| T15
  S16["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T16["function:OrientationAfterTransform<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:104"]
  S16 -->|calls| T16
  S17["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T17["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S17 -->|calls| T17
  S18["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T18["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S18 -->|calls| T18
  S19["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T19["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S19 -->|calls| T19
  S20["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T20["method:UnityDefaultViewController::supportedInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:141"]
  S20 -->|calls| T20
  S21["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T21["method:KeyboardDelegate::StartReorientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:667"]
  S21 -->|calls| T21
  S22["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T22["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S22 -->|calls| T22
  S23["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T23["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S23 -->|calls| T23
  S24["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T24["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S24 -->|calls| T24
  S25["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T25["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

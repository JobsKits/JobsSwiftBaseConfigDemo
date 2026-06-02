# `calls 符号关系 - 098`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityDefaultViewController::viewWillAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:146"]
  T1["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S1 -->|calls| T1
  S2["method:UnityDefaultViewController::viewDidAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:153"]
  T2["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  S2 -->|calls| T2
  S3["method:UnityDefaultViewController::viewDidAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:153"]
  T3["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S3 -->|calls| T3
  S4["method:UnityDefaultViewController::viewDidAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:153"]
  T4["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S4 -->|calls| T4
  S5["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T5["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S5 -->|calls| T5
  S6["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T6["function:OrientationAfterTransform<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:104"]
  S6 -->|calls| T6
  S7["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T7["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S7 -->|calls| T7
  S8["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T8["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S8 -->|calls| T8
  S9["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T9["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S9 -->|calls| T9
  S10["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T10["method:UnityDefaultViewController::supportedInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:141"]
  S10 -->|calls| T10
  S11["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T11["method:KeyboardDelegate::StartReorientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:667"]
  S11 -->|calls| T11
  S12["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T12["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S12 -->|calls| T12
  S13["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T13["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S13 -->|calls| T13
  S14["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T14["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S14 -->|calls| T14
  S15["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T15["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S15 -->|calls| T15
  S16["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T16["method:KeyboardDelegate::FinishReorientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/Keyboard.mm:673"]
  S16 -->|calls| T16
  S17["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T17["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S17 -->|calls| T17
  S18["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  T18["method:UnityDefaultViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:160"]
  S18 -->|calls| T18
  S19["method:UnityFixedOrientationViewController::initWithOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:207"]
  T19["method:UnityPortraitOnlyViewController::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:250"]
  S19 -->|calls| T19
  S20["method:UnityFixedOrientationViewController::viewWillAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:226"]
  T20["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S20 -->|calls| T20
  S21["method:UnityFixedOrientationViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:232"]
  T21["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S21 -->|calls| T21
  S22["method:UnityFixedOrientationViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:232"]
  T22["method:UnityFixedOrientationViewController::viewWillTransitionToSize:withTransitionCoordinator:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:232"]
  S22 -->|calls| T22
  S23["function:EnabledAutorotationInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:288"]
  T23["function:UnityDeviceSupportsUpsideDown<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:444"]
  S23 -->|calls| T23
  S24["function:EnabledAutorotationInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:288"]
  T24["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S24 -->|calls| T24
  S25["method:UnityViewControllerBase::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:12"]
  T25["method:UnityViewControllerBase::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase.mm:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

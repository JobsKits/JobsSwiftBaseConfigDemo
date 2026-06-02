# `calls 符号关系 - 097`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityView::recreateRenderingSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:106"]
  T1["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S1 -->|calls| T1
  S2["method:UnityView::recreateRenderingSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:106"]
  T2["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  S2 -->|calls| T2
  S3["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T3["function:GetMainDisplay<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:63"]
  S3 -->|calls| T3
  S4["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T4["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S4 -->|calls| T4
  S5["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T5["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S5 -->|calls| T5
  S6["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T6["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S6 -->|calls| T6
  S7["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T7["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  S7 -->|calls| T7
  S8["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T8["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S8 -->|calls| T8
  S9["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T9["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  S9 -->|calls| T9
  S10["method:UnityView::recreateGLESSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:207"]
  T10["method:UnityView::recreateRenderingSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:106"]
  S10 -->|calls| T10
  S11["method:UnityView::recreateGLESSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:208"]
  T11["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  S11 -->|calls| T11
  S12["function:ReportSafeAreaChangeForView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:235"]
  T12["function:ComputeSafeArea<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:263"]
  S12 -->|calls| T12
  S13["function:ReportSafeAreaChangeForView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:235"]
  T13["function:UnityDeviceHasCutout<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:426"]
  S13 -->|calls| T13
  S14["function:ReportSafeAreaChangeForView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:235"]
  T14["function:GetCutoutToScreenRatio<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:317"]
  S14 -->|calls| T14
  S15["function:GetCutoutToScreenRatio<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:317"]
  T15["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  S15 -->|calls| T15
  S16["function:GetCutoutToScreenRatio<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:317"]
  T16["function:UnityDeviceHasCutout<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:426"]
  S16 -->|calls| T16
  S17["method:UnityViewControllerBase::prefersStatusBarHidden<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:36"]
  T17["variable:objectForKey<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-threads-mach-helper.c:32"]
  S17 -->|calls| T17
  S18["method:UnityViewControllerBase::preferredStatusBarStyle<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:51"]
  T18["variable:objectForKey<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-threads-mach-helper.c:32"]
  S18 -->|calls| T18
  S19["method:UnityDefaultViewController::readOrientationFromUnity<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:106"]
  T19["function:EnabledAutorotationInterfaceOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:288"]
  S19 -->|calls| T19
  S20["method:UnityDefaultViewController::readOrientationFromUnity<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:106"]
  T20["function:ConvertToIosScreenOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:27"]
  S20 -->|calls| T20
  S21["method:UnityDefaultViewController::initShouldHandleFixedOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:120"]
  T21["method:UnityPortraitOnlyViewController::init<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:250"]
  S21 -->|calls| T21
  S22["method:UnityDefaultViewController::initShouldHandleFixedOrientation:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:120"]
  T22["method:UnityDefaultViewController::readOrientationFromUnity<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:106"]
  S22 -->|calls| T22
  S23["method:UnityDefaultViewController::updateSupportedOrientations<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:133"]
  T23["method:UnityDefaultViewController::readOrientationFromUnity<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:106"]
  S23 -->|calls| T23
  S24["method:UnityDefaultViewController::viewWillAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:146"]
  T24["function:UIViewControllerOrientation<br/>TODO/Unity/xcode_effectTest/Classes/UI/OrientationSupport.mm:93"]
  S24 -->|calls| T24
  S25["method:UnityDefaultViewController::viewWillAppear:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityViewControllerBase+iOS.mm:146"]
  T25["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

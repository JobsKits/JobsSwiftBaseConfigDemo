# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UnityView::pressesBegan:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:49"]
  T1["function:ReportSimulatedRemoteButtonPress<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1142"]
  S1 -->|calls| T1
  S2["method:UnityView::pressesEnded:withEvent:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView+tvOS.mm:55"]
  T2["function:ReportSimulatedRemoteButtonRelease<br/>TODO/Unity/xcode_effectTest/Classes/iPhone_Sensors.mm:1147"]
  S2 -->|calls| T2
  S3["method:UnityView::onUpdateSurfaceSize:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:20"]
  T3["function:ReportSafeAreaChangeForView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:235"]
  S3 -->|calls| T3
  S4["method:UnityView::initWithFrame:scaleFactor:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:54"]
  T4["method:UnityView::initImpl:scaleFactor:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:34"]
  S4 -->|calls| T4
  S5["method:UnityView::initWithFrame:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:60"]
  T5["method:UnityView::initImpl:scaleFactor:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:34"]
  S5 -->|calls| T5
  S6["method:UnityView::initFromMainScreen<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:67"]
  T6["function:UnityScreenScaleFactor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:706"]
  S6 -->|calls| T6
  S7["method:UnityView::initFromMainScreen<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:67"]
  T7["method:UnityView::initImpl:scaleFactor:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:34"]
  S7 -->|calls| T7
  S8["method:UnityView::layoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:86"]
  T8["method:UnityView::layoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:86"]
  S8 -->|calls| T8
  S9["method:UnityView::safeAreaInsetsDidChange<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:101"]
  T9["function:ReportSafeAreaChangeForView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:235"]
  S9 -->|calls| T9
  S10["method:UnityView::recreateRenderingSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:106"]
  T10["function:UnityScreenScaleFactor<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.mm:706"]
  S10 -->|calls| T10
  S11["method:UnityView::recreateRenderingSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:106"]
  T11["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S11 -->|calls| T11
  S12["method:UnityView::recreateRenderingSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:106"]
  T12["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  S12 -->|calls| T12
  S13["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T13["function:GetMainDisplay<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:63"]
  S13 -->|calls| T13
  S14["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T14["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S14 -->|calls| T14
  S15["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T15["function:GetMainDisplaySurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DisplayManager.h:68"]
  S15 -->|calls| T15
  S16["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T16["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S16 -->|calls| T16
  S17["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T17["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  S17 -->|calls| T17
  S18["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T18["function:GetAppController<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:38"]
  S18 -->|calls| T18
  S19["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  T19["function:UnityRepaint<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController+Rendering.mm:208"]
  S19 -->|calls| T19
  S20["method:UnityView::recreateGLESSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:207"]
  T20["method:UnityView::recreateRenderingSurfaceIfNeeded<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:106"]
  S20 -->|calls| T20
  S21["method:UnityView::recreateGLESSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:208"]
  T21["method:UnityView::recreateRenderingSurface<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:143"]
  S21 -->|calls| T21
  S22["function:ReportSafeAreaChangeForView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:235"]
  T22["function:ComputeSafeArea<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:263"]
  S22 -->|calls| T22
  S23["function:ReportSafeAreaChangeForView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:235"]
  T23["function:UnityDeviceHasCutout<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:426"]
  S23 -->|calls| T23
  S24["function:ReportSafeAreaChangeForView<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:235"]
  T24["function:GetCutoutToScreenRatio<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:317"]
  S24 -->|calls| T24
  S25["function:GetCutoutToScreenRatio<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityView.mm:317"]
  T25["function:UnityDeviceGeneration<br/>TODO/Unity/xcode_effectTest/Classes/Unity/DeviceSettings.mm:413"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

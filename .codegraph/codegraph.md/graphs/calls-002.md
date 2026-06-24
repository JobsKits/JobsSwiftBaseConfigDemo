# `calls 符号关系 - 002`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:FlutterWindow::OnCreate<br/>my_flutter/windows/runner/flutter_window.cpp:12"]
  T1["function:RegisterPlugins<br/>my_flutter/windows/flutter/generated_plugin_registrant.cc:10"]
  S1 -->|calls| T1
  S2["function:FlutterWindow::OnDestroy<br/>my_flutter/windows/runner/flutter_window.cpp:42"]
  T2["function:Win32Window::OnDestroy<br/>my_flutter/windows/runner/win32_window.cpp:271"]
  S2 -->|calls| T2
  S3["function:FlutterWindow::MessageHandler<br/>my_flutter/windows/runner/flutter_window.cpp:50"]
  T3["function:Win32Window::MessageHandler<br/>my_flutter/windows/runner/win32_window.cpp:176"]
  S3 -->|calls| T3
  S4["function:APIENTRY wWinMain<br/>my_flutter/windows/runner/main.cpp:8"]
  T4["function:CreateAndAttachConsole<br/>my_flutter/windows/runner/utils.cpp:10"]
  S4 -->|calls| T4
  S5["function:APIENTRY wWinMain<br/>my_flutter/windows/runner/main.cpp:8"]
  T5["function:GetCommandLineArguments<br/>my_flutter/windows/runner/utils.cpp:24"]
  S5 -->|calls| T5
  S6["function:GetCommandLineArguments<br/>my_flutter/windows/runner/utils.cpp:24"]
  T6["function:Utf8FromUtf16<br/>my_flutter/windows/runner/utils.cpp:44"]
  S6 -->|calls| T6
  S7["file:my_flutter/windows/runner/utils.h<br/>my_flutter/windows/runner/utils.h:1"]
  T7["function:Utf8FromUtf16<br/>my_flutter/windows/runner/utils.cpp:44"]
  S7 -->|calls| T7
  S8["file:my_flutter/windows/runner/utils.h<br/>my_flutter/windows/runner/utils.h:1"]
  T8["function:GetCommandLineArguments<br/>my_flutter/windows/runner/utils.cpp:24"]
  S8 -->|calls| T8
  S9["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T9["method:WindowClassRegistrar::GetInstance<br/>my_flutter/windows/runner/win32_window.cpp:64"]
  S9 -->|calls| T9
  S10["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T10["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S10 -->|calls| T10
  S11["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T11["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S11 -->|calls| T11
  S12["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T12["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S12 -->|calls| T12
  S13["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T13["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S13 -->|calls| T13
  S14["function:CALLBACK Win32Window::WndProc<br/>my_flutter/windows/runner/win32_window.cpp:157"]
  T14["function:EnableFullDpiSupportIfAvailable<br/>my_flutter/windows/runner/win32_window.cpp:42"]
  S14 -->|calls| T14
  S15["function:Win32Window::Destroy<br/>my_flutter/windows/runner/win32_window.cpp:224"]
  T15["method:WindowClassRegistrar::GetInstance<br/>my_flutter/windows/runner/win32_window.cpp:64"]
  S15 -->|calls| T15
  S16["function:ASButtonNodeResolveHorizontalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:16"]
  T16["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S16 -->|calls| T16
  S17["function:ASButtonNodeResolveHorizontalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:16"]
  T17["function:alignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:58"]
  S17 -->|calls| T17
  S18["function:ASButtonNodeResolveVerticalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:24"]
  T18["function:alignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:58"]
  S18 -->|calls| T18
  S19["function:ASButtonNodeResolveVerticalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:24"]
  T19["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S19 -->|calls| T19
  S20["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T20["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S20 -->|calls| T20
  S21["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T21["method:ASLayoutElementStyle::yogaNodeCreateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:778"]
  S21 -->|calls| T21
  S22["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T22["function:ASButtonNodeResolveHorizontalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:16"]
  S22 -->|calls| T22
  S23["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T23["function:ASButtonNodeResolveVerticalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:24"]
  S23 -->|calls| T23
  S24["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T24["function:ASEdgeInsetsMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S24 -->|calls| T24
  S25["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T25["function:ASEdgeInsetsMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

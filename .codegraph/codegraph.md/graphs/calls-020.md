# `calls 符号关系 - 020`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_FlutterPageState::requestId<br/>my_flutter/lib/main.dart:105"]
  T1["method:BinaryFloatingPoint::toString<br/>JobsByPods/JobsSwiftFoundation@Pods/BinaryFloatingPoint.swift:13"]
  S1 -->|calls| T1
  S2["method:_FlutterPageState::initState<br/>my_flutter/lib/main.dart:108"]
  T2["method:_FlutterPageState::initState<br/>my_flutter/lib/main.dart:108"]
  S2 -->|calls| T2
  S3["method:_FlutterPageState::initState<br/>my_flutter/lib/main.dart:108"]
  T3["method:BinaryFloatingPoint::toString<br/>JobsByPods/JobsSwiftFoundation@Pods/BinaryFloatingPoint.swift:13"]
  S3 -->|calls| T3
  S4["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  T4["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  S4 -->|calls| T4
  S5["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  T5["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  S5 -->|calls| T5
  S6["function:main<br/>my_flutter/linux/runner/main.cc:3"]
  T6["function:my_application_new<br/>my_flutter/linux/runner/my_application.cc:138"]
  S6 -->|calls| T6
  S7["function:my_application_activate<br/>my_flutter/linux/runner/my_application.cc:23"]
  T7["function:fl_register_plugins<br/>my_flutter/linux/flutter/generated_plugin_registrant.cc:10"]
  S7 -->|calls| T7
  S8["method:MainFlutterWindow::awakeFromNib<br/>my_flutter/macos/Runner/MainFlutterWindow.swift:5"]
  T8["function:RegisterGeneratedPlugins<br/>my_flutter/macos/Flutter/GeneratedPluginRegistrant.swift:9"]
  S8 -->|calls| T8
  S9["method:MainFlutterWindow::awakeFromNib<br/>my_flutter/macos/Runner/MainFlutterWindow.swift:5"]
  T9["method:MainFlutterWindow::awakeFromNib<br/>my_flutter/macos/Runner/MainFlutterWindow.swift:5"]
  S9 -->|calls| T9
  S10["function:FlutterWindow::OnCreate<br/>my_flutter/windows/runner/flutter_window.cpp:12"]
  T10["function:Win32Window::OnCreate<br/>my_flutter/windows/runner/win32_window.cpp:266"]
  S10 -->|calls| T10
  S11["function:FlutterWindow::OnCreate<br/>my_flutter/windows/runner/flutter_window.cpp:12"]
  T11["function:RegisterPlugins<br/>my_flutter/windows/flutter/generated_plugin_registrant.cc:10"]
  S11 -->|calls| T11
  S12["function:FlutterWindow::OnDestroy<br/>my_flutter/windows/runner/flutter_window.cpp:42"]
  T12["function:Win32Window::OnDestroy<br/>my_flutter/windows/runner/win32_window.cpp:271"]
  S12 -->|calls| T12
  S13["function:FlutterWindow::MessageHandler<br/>my_flutter/windows/runner/flutter_window.cpp:50"]
  T13["function:Win32Window::MessageHandler<br/>my_flutter/windows/runner/win32_window.cpp:176"]
  S13 -->|calls| T13
  S14["function:APIENTRY wWinMain<br/>my_flutter/windows/runner/main.cpp:8"]
  T14["function:CreateAndAttachConsole<br/>my_flutter/windows/runner/utils.cpp:10"]
  S14 -->|calls| T14
  S15["function:APIENTRY wWinMain<br/>my_flutter/windows/runner/main.cpp:8"]
  T15["function:GetCommandLineArguments<br/>my_flutter/windows/runner/utils.cpp:24"]
  S15 -->|calls| T15
  S16["function:GetCommandLineArguments<br/>my_flutter/windows/runner/utils.cpp:24"]
  T16["function:Utf8FromUtf16<br/>my_flutter/windows/runner/utils.cpp:44"]
  S16 -->|calls| T16
  S17["file:my_flutter/windows/runner/utils.h<br/>my_flutter/windows/runner/utils.h:1"]
  T17["function:Utf8FromUtf16<br/>my_flutter/windows/runner/utils.cpp:44"]
  S17 -->|calls| T17
  S18["file:my_flutter/windows/runner/utils.h<br/>my_flutter/windows/runner/utils.h:1"]
  T18["function:GetCommandLineArguments<br/>my_flutter/windows/runner/utils.cpp:24"]
  S18 -->|calls| T18
  S19["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T19["method:WindowClassRegistrar::GetInstance<br/>my_flutter/windows/runner/win32_window.cpp:64"]
  S19 -->|calls| T19
  S20["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T20["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S20 -->|calls| T20
  S21["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T21["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S21 -->|calls| T21
  S22["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T22["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S22 -->|calls| T22
  S23["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T23["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S23 -->|calls| T23
  S24["function:CALLBACK Win32Window::WndProc<br/>my_flutter/windows/runner/win32_window.cpp:157"]
  T24["function:EnableFullDpiSupportIfAvailable<br/>my_flutter/windows/runner/win32_window.cpp:42"]
  S24 -->|calls| T24
  S25["function:Win32Window::Destroy<br/>my_flutter/windows/runner/win32_window.cpp:224"]
  T25["method:WindowClassRegistrar::GetInstance<br/>my_flutter/windows/runner/win32_window.cpp:64"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

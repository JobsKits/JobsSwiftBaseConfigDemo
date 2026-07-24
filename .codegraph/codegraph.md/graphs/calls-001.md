# `calls 符号关系 - 001`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:install_all_flutter_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:17"]
  T1["function:install_flutter_engine_pod<br/>my_flutter/.ios/Flutter/podhelper.rb:43"]
  S1 -->|calls| T1
  S2["function:install_all_flutter_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:17"]
  T2["function:install_flutter_plugin_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:60"]
  S2 -->|calls| T2
  S3["function:install_all_flutter_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:17"]
  T3["function:install_flutter_application_pod<br/>my_flutter/.ios/Flutter/podhelper.rb:80"]
  S3 -->|calls| T3
  S4["method:AppDelegate::application<br/>my_flutter/ios/Runner/AppDelegate.swift:6"]
  T4["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S4 -->|calls| T4
  S5["method:AppDelegate::application<br/>my_flutter/ios/Runner/AppDelegate.swift:6"]
  T5["method:AppDelegate::application<br/>my_flutter/ios/Runner/AppDelegate.swift:6"]
  S5 -->|calls| T5
  S6["function:main<br/>my_flutter/lib/main.dart:8"]
  T6["function:_argsFromInitialRoute<br/>my_flutter/lib/main.dart:80"]
  S6 -->|calls| T6
  S7["function:main<br/>my_flutter/lib/main.dart:8"]
  T7["function:_asMap<br/>my_flutter/lib/main.dart:73"]
  S7 -->|calls| T7
  S8["method:_FlutterPageState::initState<br/>my_flutter/lib/main.dart:108"]
  T8["method:_FlutterPageState::initState<br/>my_flutter/lib/main.dart:108"]
  S8 -->|calls| T8
  S9["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  T9["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  S9 -->|calls| T9
  S10["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  T10["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  S10 -->|calls| T10
  S11["function:main<br/>my_flutter/linux/runner/main.cc:3"]
  T11["function:my_application_new<br/>my_flutter/linux/runner/my_application.cc:138"]
  S11 -->|calls| T11
  S12["function:my_application_activate<br/>my_flutter/linux/runner/my_application.cc:23"]
  T12["function:fl_register_plugins<br/>my_flutter/linux/flutter/generated_plugin_registrant.cc:10"]
  S12 -->|calls| T12
  S13["method:MainFlutterWindow::awakeFromNib<br/>my_flutter/macos/Runner/MainFlutterWindow.swift:5"]
  T13["function:RegisterGeneratedPlugins<br/>my_flutter/macos/Flutter/GeneratedPluginRegistrant.swift:9"]
  S13 -->|calls| T13
  S14["method:MainFlutterWindow::awakeFromNib<br/>my_flutter/macos/Runner/MainFlutterWindow.swift:5"]
  T14["method:MainFlutterWindow::awakeFromNib<br/>my_flutter/macos/Runner/MainFlutterWindow.swift:5"]
  S14 -->|calls| T14
  S15["function:FlutterWindow::OnCreate<br/>my_flutter/windows/runner/flutter_window.cpp:12"]
  T15["function:Win32Window::OnCreate<br/>my_flutter/windows/runner/win32_window.cpp:266"]
  S15 -->|calls| T15
  S16["function:FlutterWindow::OnCreate<br/>my_flutter/windows/runner/flutter_window.cpp:12"]
  T16["function:RegisterPlugins<br/>my_flutter/windows/flutter/generated_plugin_registrant.cc:10"]
  S16 -->|calls| T16
  S17["function:FlutterWindow::OnDestroy<br/>my_flutter/windows/runner/flutter_window.cpp:42"]
  T17["function:Win32Window::OnDestroy<br/>my_flutter/windows/runner/win32_window.cpp:271"]
  S17 -->|calls| T17
  S18["function:FlutterWindow::MessageHandler<br/>my_flutter/windows/runner/flutter_window.cpp:50"]
  T18["function:Win32Window::MessageHandler<br/>my_flutter/windows/runner/win32_window.cpp:176"]
  S18 -->|calls| T18
  S19["function:APIENTRY wWinMain<br/>my_flutter/windows/runner/main.cpp:8"]
  T19["function:CreateAndAttachConsole<br/>my_flutter/windows/runner/utils.cpp:10"]
  S19 -->|calls| T19
  S20["function:APIENTRY wWinMain<br/>my_flutter/windows/runner/main.cpp:8"]
  T20["function:GetCommandLineArguments<br/>my_flutter/windows/runner/utils.cpp:24"]
  S20 -->|calls| T20
  S21["function:GetCommandLineArguments<br/>my_flutter/windows/runner/utils.cpp:24"]
  T21["function:Utf8FromUtf16<br/>my_flutter/windows/runner/utils.cpp:44"]
  S21 -->|calls| T21
  S22["file:my_flutter/windows/runner/utils.h<br/>my_flutter/windows/runner/utils.h:1"]
  T22["function:Utf8FromUtf16<br/>my_flutter/windows/runner/utils.cpp:44"]
  S22 -->|calls| T22
  S23["file:my_flutter/windows/runner/utils.h<br/>my_flutter/windows/runner/utils.h:1"]
  T23["function:GetCommandLineArguments<br/>my_flutter/windows/runner/utils.cpp:24"]
  S23 -->|calls| T23
  S24["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T24["method:WindowClassRegistrar::GetInstance<br/>my_flutter/windows/runner/win32_window.cpp:64"]
  S24 -->|calls| T24
  S25["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T25["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

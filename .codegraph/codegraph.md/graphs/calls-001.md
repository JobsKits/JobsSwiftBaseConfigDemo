# `calls 符号关系 - 001`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:AFService<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:13"]
  T1["method:AFService::uploadAvatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:63"]
  S1 -->|calls| T1
  S2["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T2["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S2 -->|calls| T2
  S3["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T3["method:APIService::refreshToken<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:100"]
  S3 -->|calls| T3
  S4["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T4["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S4 -->|calls| T4
  S5["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  T5["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S5 -->|calls| T5
  S6["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T6["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S6 -->|calls| T6
  S7["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T7["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S7 -->|calls| T7
  S8["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T8["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S8 -->|calls| T8
  S9["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T9["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S9 -->|calls| T9
  S10["struct:UserDefault<br/>TODO/UserDefault.swift:47"]
  T10["method:UserDefaults::isPlistSafeType<br/>TODO/UserDefault.swift:111"]
  S10 -->|calls| T10
  S11["function:install_all_flutter_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:17"]
  T11["function:install_flutter_engine_pod<br/>my_flutter/.ios/Flutter/podhelper.rb:43"]
  S11 -->|calls| T11
  S12["function:install_all_flutter_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:17"]
  T12["function:install_flutter_plugin_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:60"]
  S12 -->|calls| T12
  S13["function:install_all_flutter_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:17"]
  T13["function:install_flutter_application_pod<br/>my_flutter/.ios/Flutter/podhelper.rb:80"]
  S13 -->|calls| T13
  S14["method:AppDelegate::application<br/>my_flutter/ios/Runner/AppDelegate.swift:6"]
  T14["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S14 -->|calls| T14
  S15["method:AppDelegate::application<br/>my_flutter/ios/Runner/AppDelegate.swift:6"]
  T15["method:AppDelegate::application<br/>my_flutter/ios/Runner/AppDelegate.swift:6"]
  S15 -->|calls| T15
  S16["function:main<br/>my_flutter/lib/main.dart:8"]
  T16["function:_argsFromInitialRoute<br/>my_flutter/lib/main.dart:80"]
  S16 -->|calls| T16
  S17["function:main<br/>my_flutter/lib/main.dart:8"]
  T17["function:_asMap<br/>my_flutter/lib/main.dart:73"]
  S17 -->|calls| T17
  S18["method:_FlutterPageState::initState<br/>my_flutter/lib/main.dart:108"]
  T18["method:_FlutterPageState::initState<br/>my_flutter/lib/main.dart:108"]
  S18 -->|calls| T18
  S19["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  T19["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  S19 -->|calls| T19
  S20["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  T20["method:_FlutterPageState::dispose<br/>my_flutter/lib/main.dart:116"]
  S20 -->|calls| T20
  S21["function:main<br/>my_flutter/linux/runner/main.cc:3"]
  T21["function:my_application_new<br/>my_flutter/linux/runner/my_application.cc:138"]
  S21 -->|calls| T21
  S22["function:my_application_activate<br/>my_flutter/linux/runner/my_application.cc:23"]
  T22["function:fl_register_plugins<br/>my_flutter/linux/flutter/generated_plugin_registrant.cc:10"]
  S22 -->|calls| T22
  S23["method:MainFlutterWindow::awakeFromNib<br/>my_flutter/macos/Runner/MainFlutterWindow.swift:5"]
  T23["function:RegisterGeneratedPlugins<br/>my_flutter/macos/Flutter/GeneratedPluginRegistrant.swift:9"]
  S23 -->|calls| T23
  S24["method:MainFlutterWindow::awakeFromNib<br/>my_flutter/macos/Runner/MainFlutterWindow.swift:5"]
  T24["method:MainFlutterWindow::awakeFromNib<br/>my_flutter/macos/Runner/MainFlutterWindow.swift:5"]
  S24 -->|calls| T24
  S25["function:FlutterWindow::OnCreate<br/>my_flutter/windows/runner/flutter_window.cpp:12"]
  T25["function:Win32Window::OnCreate<br/>my_flutter/windows/runner/win32_window.cpp:266"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

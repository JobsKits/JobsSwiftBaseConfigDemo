# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T1["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S1 -->|calls| T1
  S2["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T2["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S2 -->|calls| T2
  S3["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T3["method:DemoService::uploadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:63"]
  S3 -->|calls| T3
  S4["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T4["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S4 -->|calls| T4
  S5["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T5["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S5 -->|calls| T5
  S6["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T6["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S6 -->|calls| T6
  S7["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T7["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S7 -->|calls| T7
  S8["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T8["method:APIService::refreshToken<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:100"]
  S8 -->|calls| T8
  S9["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T9["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S9 -->|calls| T9
  S10["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  T10["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S10 -->|calls| T10
  S11["method:CurlLoggerPlugin::willSend<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/Plugins.swift:20"]
  T11["method:URLRequest::cURLDescription<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/Plugins.swift:31"]
  S11 -->|calls| T11
  S12["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T12["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S12 -->|calls| T12
  S13["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T13["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S13 -->|calls| T13
  S14["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T14["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S14 -->|calls| T14
  S15["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T15["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S15 -->|calls| T15
  S16["method:WalletLayout::prepare<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@钱包卡片效果/Other/WalletLayout.swift:55"]
  T16["method:WalletLayout::prepare<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@钱包卡片效果/Other/WalletLayout.swift:55"]
  S16 -->|calls| T16
  S17["struct:UserDefault<br/>TODO/UserDefault.swift:47"]
  T17["method:UserDefaults::isPlistSafeType<br/>TODO/UserDefault.swift:111"]
  S17 -->|calls| T17
  S18["function:install_all_flutter_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:17"]
  T18["function:install_flutter_engine_pod<br/>my_flutter/.ios/Flutter/podhelper.rb:43"]
  S18 -->|calls| T18
  S19["function:install_all_flutter_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:17"]
  T19["function:install_flutter_plugin_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:60"]
  S19 -->|calls| T19
  S20["function:install_all_flutter_pods<br/>my_flutter/.ios/Flutter/podhelper.rb:17"]
  T20["function:install_flutter_application_pod<br/>my_flutter/.ios/Flutter/podhelper.rb:80"]
  S20 -->|calls| T20
  S21["file:my_flutter/android/app/build.gradle.kts<br/>my_flutter/android/app/build.gradle.kts:1"]
  T21["method:BinaryFloatingPoint::toString<br/>JobsByPods/JobsSwiftFoundation@Pods/BinaryFloatingPoint.swift:13"]
  S21 -->|calls| T21
  S22["method:AppDelegate::application<br/>my_flutter/ios/Runner/AppDelegate.swift:6"]
  T22["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S22 -->|calls| T22
  S23["method:AppDelegate::application<br/>my_flutter/ios/Runner/AppDelegate.swift:6"]
  T23["method:AppDelegate::application<br/>my_flutter/ios/Runner/AppDelegate.swift:6"]
  S23 -->|calls| T23
  S24["function:main<br/>my_flutter/lib/main.dart:8"]
  T24["function:_argsFromInitialRoute<br/>my_flutter/lib/main.dart:80"]
  S24 -->|calls| T24
  S25["function:main<br/>my_flutter/lib/main.dart:8"]
  T25["function:_asMap<br/>my_flutter/lib/main.dart:73"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T1["function:String::normalizeToSupportedLproj::pick<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:53"]
  S1 -->|calls| T1
  S2["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T2["function:String::normalizeToSupportedLproj::pick<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:53"]
  S2 -->|calls| T2
  S3["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T3["function:String::normalizeToSupportedLproj::pick<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:53"]
  S3 -->|calls| T3
  S4["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T4["function:String::normalizeToSupportedLproj::pick<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:53"]
  S4 -->|calls| T4
  S5["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T5["function:String::normalizeToSupportedLproj::pick<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:53"]
  S5 -->|calls| T5
  S6["function:resolveLanguageCode<br/>JobsByPods/Jobsl10n@Pods/Jobsl10n.swift:18"]
  T6["function:loadLanguageMode<br/>JobsByPods/Jobsl10n@Pods/Jobsl10n.swift:27"]
  S6 -->|calls| T6
  S7["class:LanguageManager<br/>JobsByPods/Jobsl10n@Pods/LanguageManager.swift:11"]
  T7["function:resolveLanguageCode<br/>JobsByPods/Jobsl10n@Pods/Jobsl10n.swift:18"]
  S7 -->|calls| T7
  S8["class:AFService<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:13"]
  T8["method:AFService::uploadAvatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:63"]
  S8 -->|calls| T8
  S9["method:AFService::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:57"]
  T9["method:JobsEncodingRule::validate<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:34"]
  S9 -->|calls| T9
  S10["method:AFService::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:57"]
  T10["method:UnityURLRequest::requestForTask:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:39"]
  S10 -->|calls| T10
  S11["method:AFService::uploadAvatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:63"]
  T11["method:JobsEncodingRule::validate<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:34"]
  S11 -->|calls| T11
  S12["method:AFService::download<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:76"]
  T12["method:JobsEncodingRule::validate<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:34"]
  S12 -->|calls| T12
  S13["method:AFService::publisherString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:90"]
  T13["method:JobsEncodingRule::validate<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:34"]
  S13 -->|calls| T13
  S14["method:AFService::publisherString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:90"]
  T14["method:UnityURLRequest::requestForTask:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:39"]
  S14 -->|calls| T14
  S15["method:TokenRetryInterceptor::retry<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:116"]
  T15["method:JobsMemoryCache::removeAll<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:57"]
  S15 -->|calls| T15
  S16["method:TokenRetryInterceptor::retry<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:116"]
  T16["function:unlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:120"]
  S16 -->|calls| T16
  S17["method:DemoService::loadCatalog<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:27"]
  T17["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:46"]
  S17 -->|calls| T17
  S18["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  T18["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:46"]
  S18 -->|calls| T18
  S19["method:DemoService::uploadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:63"]
  T19["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:13"]
  S19 -->|calls| T19
  S20["method:DemoService::downloadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:87"]
  T20["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  S20 -->|calls| T20
  S21["method:DemoService::downloadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:87"]
  T21["method:DemoService::mimeTypeByFileName<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:125"]
  S21 -->|calls| T21
  S22["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  T22["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S22 -->|calls| T22
  S23["method:DemoService::mimeTypeByFileName<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:125"]
  T23["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S23 -->|calls| T23
  S24["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T24["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S24 -->|calls| T24
  S25["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T25["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

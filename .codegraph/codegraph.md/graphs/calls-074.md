# `calls 符号关系 - 074`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:loadLanguageMode<br/>JobsByPods/Jobsl10n@Pods/Jobsl10n.swift:27"]
  T1["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S1 -->|calls| T1
  S2["class:LanguageManager<br/>JobsByPods/Jobsl10n@Pods/LanguageManager.swift:11"]
  T2["function:resolveLanguageCode<br/>JobsByPods/Jobsl10n@Pods/Jobsl10n.swift:18"]
  S2 -->|calls| T2
  S3["method:LanguageManager::switchTo<br/>JobsByPods/Jobsl10n@Pods/LanguageManager.swift:33"]
  T3["method:Bundle::setLanguageBundle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:33"]
  S3 -->|calls| T3
  S4["method:LanguageManager::switchTo<br/>JobsByPods/Jobsl10n@Pods/LanguageManager.swift:33"]
  T4["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:196"]
  S4 -->|calls| T4
  S5["method:LanguageManager::followSystemLanguage<br/>JobsByPods/Jobsl10n@Pods/LanguageManager.swift:47"]
  T5["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:196"]
  S5 -->|calls| T5
  S6["method:TRAutoRefresh::Marker::pack<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:24"]
  T6["variable:threadDictionary<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-threads-mach-helper.c:32"]
  S6 -->|calls| T6
  S7["method:TRAutoRefresh::ensureObserver<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:75"]
  T7["method:TRAutoRefresh::refreshAll<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:107"]
  S7 -->|calls| T7
  S8["method:TRAutoRefresh::register<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:87"]
  T8["method:TRAutoRefresh::ensureObserver<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:75"]
  S8 -->|calls| T8
  S9["method:TRAutoRefresh::register<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:87"]
  T9["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S9 -->|calls| T9
  S10["method:TRAutoRefresh::refreshAll<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:107"]
  T10["method:TRLang::bundle<br/>JobsByPods/Jobsl10n@Pods/TRLang.swift:16"]
  S10 -->|calls| T10
  S11["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  T11["method:TRAutoRefresh::Marker::consume<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:33"]
  S11 -->|calls| T11
  S12["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  T12["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S12 -->|calls| T12
  S13["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  T13["method:TRAutoRefresh::register<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:87"]
  S13 -->|calls| T13
  S14["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  T14["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S14 -->|calls| T14
  S15["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  T15["method:TRAutoRefresh::Marker::consume<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:33"]
  S15 -->|calls| T15
  S16["method:AFLogger::requestDidResume<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFLogger.swift:30"]
  T16["method:URLRequest::cURLDescription<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/Plugins.swift:31"]
  S16 -->|calls| T16
  S17["function:jobs_encodeJSONObject<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:12"]
  T17["function:jobs_jsonValue<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:34"]
  S17 -->|calls| T17
  S18["function:jobs_encodeJSONObject<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:12"]
  T18["variable:obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/il2cpp-api-functions.h:206"]
  S18 -->|calls| T18
  S19["function:jobs_encodeJSONObject<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:12"]
  T19["function:jobs_jsonValue<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:34"]
  S19 -->|calls| T19
  S20["function:jobs_encodeJSONObject<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:12"]
  T20["variable:obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/il2cpp-api-functions.h:206"]
  S20 -->|calls| T20
  S21["function:jobs_jsonValue<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:34"]
  T21["function:jobs_jsonValue<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:34"]
  S21 -->|calls| T21
  S22["function:jobs_jsonValue<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:34"]
  T22["function:jobs_jsonValue<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:34"]
  S22 -->|calls| T22
  S23["function:asURLRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:124"]
  T23["function:jobs_encodeJSONObject<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:12"]
  S23 -->|calls| T23
  S24["function:asURLRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:124"]
  T24["function:jobs_encodeJSONObject<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFRoute.swift:12"]
  S24 -->|calls| T24
  S25["class:AFService<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:13"]
  T25["method:AFService::uploadAvatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:63"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

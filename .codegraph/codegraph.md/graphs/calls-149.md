# `calls 符号关系 - 149`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDefaultAgent::makeCacheKey<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:271"]
  T1["method:JobsCacheKey::make<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:18"]
  S1 -->|calls| T1
  S2["method:JobsDefaultAgent::loadCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:282"]
  T2["method:JobsMemoryCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:38"]
  S2 -->|calls| T2
  S3["method:JobsDefaultAgent::loadCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:282"]
  T3["method:JobsDiskCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:73"]
  S3 -->|calls| T3
  S4["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  T4["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  S4 -->|calls| T4
  S5["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  T5["method:EmptyEventObserver::didReceive<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:29"]
  S5 -->|calls| T5
  S6["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  T6["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S6 -->|calls| T6
  S7["method:JobsDefaultAgent::storeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:309"]
  T7["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S7 -->|calls| T7
  S8["method:JobsDefaultAgent::storeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:309"]
  T8["method:JobsDiskCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:87"]
  S8 -->|calls| T8
  S9["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  T9["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S9 -->|calls| T9
  S10["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  T10["method:JobsDefaultAgent::decodePlain<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:345"]
  S10 -->|calls| T10
  S11["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  T11["method:JobsDefaultAgent::decodeWithEnvelope<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:356"]
  S11 -->|calls| T11
  S12["method:JobsDefaultAgent::decodePlain<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:345"]
  T12["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S12 -->|calls| T12
  S13["method:JobsDefaultAgent::decodeWithEnvelope<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:356"]
  T13["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S13 -->|calls| T13
  S14["method:JobsDefaultAgent::logStart<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:377"]
  T14["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S14 -->|calls| T14
  S15["method:JobsDefaultAgent::logSuccess<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:388"]
  T15["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S15 -->|calls| T15
  S16["method:JobsAgent::send<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:14"]
  T16["method:JobsAgent::send<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:14"]
  S16 -->|calls| T16
  S17["method:JobsAgent::send<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:14"]
  T17["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S17 -->|calls| T17
  S18["method:JobsAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:37"]
  T18["method:JobsAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:37"]
  S18 -->|calls| T18
  S19["method:JobsAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:37"]
  T19["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S19 -->|calls| T19
  S20["method:JobsAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:37"]
  T20["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S20 -->|calls| T20
  S21["method:JobsAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:37"]
  T21["method:JobsButtonNumberAnimRunner::finish<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:637"]
  S21 -->|calls| T21
  S22["method:JobsAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:37"]
  T22["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S22 -->|calls| T22
  S23["method:JobsBatch::concurrent<br/>JobsByPods/JobsNetworking@Pods/Async/JobsBatch.swift:13"]
  T23["method:JobsWorkflow::concurrent<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:31"]
  S23 -->|calls| T23
  S24["method:JobsBatch::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsBatch.swift:20"]
  T24["method:JobsWorkflow::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:77"]
  S24 -->|calls| T24
  S25["method:JobsDownloadCapable::download<br/>JobsByPods/JobsNetworking@Pods/Async/JobsDownload+Async.swift:14"]
  T25["method:JobsDownloadCapable::download<br/>JobsByPods/JobsNetworking@Pods/Async/JobsDownload+Async.swift:14"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

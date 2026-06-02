# `calls 符号关系 - 038`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T1["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S1 -->|calls| T1
  S2["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T2["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S2 -->|calls| T2
  S3["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T3["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S3 -->|calls| T3
  S4["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T4["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S4 -->|calls| T4
  S5["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T5["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S5 -->|calls| T5
  S6["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T6["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S6 -->|calls| T6
  S7["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S7 -->|calls| T7
  S8["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T8["method:Dictionary::normalizedJSONObject<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:23"]
  S8 -->|calls| T8
  S9["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T9["method:Dictionary::normalizedJSONObject<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:23"]
  S9 -->|calls| T9
  S10["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T10["method:Dictionary::normalizedJSONObject<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:23"]
  S10 -->|calls| T10
  S11["method:JobsDefaultAgent::makeCacheKey<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:271"]
  T11["method:JobsCacheKey::make<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:18"]
  S11 -->|calls| T11
  S12["method:JobsDefaultAgent::loadCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:282"]
  T12["method:JobsMemoryCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:38"]
  S12 -->|calls| T12
  S13["method:JobsDefaultAgent::loadCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:282"]
  T13["method:JobsDiskCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:73"]
  S13 -->|calls| T13
  S14["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  T14["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  S14 -->|calls| T14
  S15["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  T15["method:EmptyEventObserver::didReceive<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:29"]
  S15 -->|calls| T15
  S16["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  T16["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S16 -->|calls| T16
  S17["method:JobsDefaultAgent::storeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:309"]
  T17["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S17 -->|calls| T17
  S18["method:JobsDefaultAgent::storeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:309"]
  T18["method:JobsDiskCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:87"]
  S18 -->|calls| T18
  S19["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  T19["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S19 -->|calls| T19
  S20["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  T20["method:JobsDefaultAgent::decodePlain<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:345"]
  S20 -->|calls| T20
  S21["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  T21["method:JobsDefaultAgent::decodeWithEnvelope<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:356"]
  S21 -->|calls| T21
  S22["method:JobsDefaultAgent::decodePlain<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:345"]
  T22["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S22 -->|calls| T22
  S23["method:JobsDefaultAgent::decodeWithEnvelope<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:356"]
  T23["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S23 -->|calls| T23
  S24["method:JobsDefaultAgent::logStart<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:377"]
  T24["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S24 -->|calls| T24
  S25["method:JobsDefaultAgent::logSuccess<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:388"]
  T25["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

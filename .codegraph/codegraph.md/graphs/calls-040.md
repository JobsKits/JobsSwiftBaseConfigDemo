# `calls 符号关系 - 040`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDiskCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:87"]
  T1["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  S1 -->|calls| T1
  S2["method:JobsDiskCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:87"]
  T2["method:JSONValue::encode<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:992"]
  S2 -->|calls| T2
  S3["method:JobsDiskCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:87"]
  T3["method:Atomic::write<br/>TODO/TaskCenterComponent/Schedule/Atomic.swift:36"]
  S3 -->|calls| T3
  S4["method:JobsDiskCache::remove<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:95"]
  T4["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  S4 -->|calls| T4
  S5["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  T5["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S5 -->|calls| T5
  S6["struct:APIResponse<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:13"]
  T6["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S6 -->|calls| T6
  S7["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:24"]
  T7["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S7 -->|calls| T7
  S8["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:49"]
  T8["method:JobsError::describe<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:75"]
  S8 -->|calls| T8
  S9["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:49"]
  T9["method:JobsError::describe<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:75"]
  S9 -->|calls| T9
  S10["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:49"]
  T10["method:JobsError::describe<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:75"]
  S10 -->|calls| T10
  S11["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:49"]
  T11["method:JobsError::describe<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:75"]
  S11 -->|calls| T11
  S12["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T12["method:JobsRequestToken::setCancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:18"]
  S12 -->|calls| T12
  S13["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T13["method:AlamofireClient::cancel<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:222"]
  S13 -->|calls| T13
  S14["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T14["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S14 -->|calls| T14
  S15["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T15["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S15 -->|calls| T15
  S16["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T16["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S16 -->|calls| T16
  S17["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T17["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S17 -->|calls| T17
  S18["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T18["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S18 -->|calls| T18
  S19["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T19["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S19 -->|calls| T19
  S20["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T20["method:AlamofireClient::download<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:127"]
  S20 -->|calls| T20
  S21["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T21["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S21 -->|calls| T21
  S22["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T22["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S22 -->|calls| T22
  S23["function:example<br/>JobsByPods/JobsNetworking@Pods/Examples/Usage.swift:16"]
  T23["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  S23 -->|calls| T23
  S24["function:example<br/>JobsByPods/JobsNetworking@Pods/Examples/Usage.swift:16"]
  T24["method:JobsWorkflow::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:77"]
  S24 -->|calls| T24
  S25["method:Dictionary::normalizedJSONObject<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:23"]
  T25["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

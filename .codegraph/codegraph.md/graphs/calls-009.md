# `calls 符号关系 - 009`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  T1["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  S1 -->|calls| T1
  S2["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  T2["method:EmptyEventObserver::didReceive<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:29"]
  S2 -->|calls| T2
  S3["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  T3["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S3 -->|calls| T3
  S4["method:JobsDefaultAgent::storeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:309"]
  T4["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S4 -->|calls| T4
  S5["method:JobsDefaultAgent::storeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:309"]
  T5["method:JobsDiskCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:87"]
  S5 -->|calls| T5
  S6["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  T6["method:JobsDefaultAgent::decodePlain<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:345"]
  S6 -->|calls| T6
  S7["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  T7["method:JobsDefaultAgent::decodeWithEnvelope<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:356"]
  S7 -->|calls| T7
  S8["method:JobsDefaultAgent::logStart<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:377"]
  T8["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S8 -->|calls| T8
  S9["method:JobsDefaultAgent::logSuccess<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:388"]
  T9["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S9 -->|calls| T9
  S10["method:JobsAgent::send<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:14"]
  T10["method:JobsAgent::send<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:14"]
  S10 -->|calls| T10
  S11["method:JobsAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:37"]
  T11["method:JobsAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:37"]
  S11 -->|calls| T11
  S12["method:JobsBatch::concurrent<br/>JobsByPods/JobsNetworking@Pods/Async/JobsBatch.swift:13"]
  T12["method:JobsWorkflow::concurrent<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:31"]
  S12 -->|calls| T12
  S13["method:JobsBatch::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsBatch.swift:20"]
  T13["method:JobsWorkflow::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:77"]
  S13 -->|calls| T13
  S14["method:JobsDownloadCapable::download<br/>JobsByPods/JobsNetworking@Pods/Async/JobsDownload+Async.swift:14"]
  T14["method:JobsDownloadCapable::download<br/>JobsByPods/JobsNetworking@Pods/Async/JobsDownload+Async.swift:14"]
  S14 -->|calls| T14
  S15["method:JobsUploadCapable::upload<br/>JobsByPods/JobsNetworking@Pods/Async/JobsUpload+Async.swift:14"]
  T15["method:JobsUploadCapable::upload<br/>JobsByPods/JobsNetworking@Pods/Async/JobsUpload+Async.swift:14"]
  S15 -->|calls| T15
  S16["method:JobsWorkflow::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:89"]
  T16["method:JobsWorkflow::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:89"]
  S16 -->|calls| T16
  S17["method:JobsCacheKey::make<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:18"]
  T17["method:JobsCacheKey::canonicalString<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:32"]
  S17 -->|calls| T17
  S18["method:JobsCacheKey::make<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:18"]
  T18["method:JobsCacheKey::canonicalString<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:32"]
  S18 -->|calls| T18
  S19["method:JobsCacheKey::canonicalString<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:32"]
  T19["method:JobsCacheKey::stringify<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:40"]
  S19 -->|calls| T19
  S20["method:JobsCacheKey::stringify<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:40"]
  T20["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  S20 -->|calls| T20
  S21["method:JobsDiskCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:73"]
  T21["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  S21 -->|calls| T21
  S22["method:JobsDiskCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:87"]
  T22["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  S22 -->|calls| T22
  S23["method:JobsDiskCache::remove<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:95"]
  T23["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  S23 -->|calls| T23
  S24["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  T24["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S24 -->|calls| T24
  S25["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:49"]
  T25["method:JobsError::describe<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:75"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

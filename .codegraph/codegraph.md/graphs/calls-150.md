# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDownloadCapable::download<br/>JobsByPods/JobsNetworking@Pods/Async/JobsDownload+Async.swift:14"]
  T1["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S1 -->|calls| T1
  S2["method:JobsUploadCapable::upload<br/>JobsByPods/JobsNetworking@Pods/Async/JobsUpload+Async.swift:14"]
  T2["method:JobsUploadCapable::upload<br/>JobsByPods/JobsNetworking@Pods/Async/JobsUpload+Async.swift:14"]
  S2 -->|calls| T2
  S3["method:JobsUploadCapable::upload<br/>JobsByPods/JobsNetworking@Pods/Async/JobsUpload+Async.swift:14"]
  T3["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S3 -->|calls| T3
  S4["method:JobsWorkflow::concurrent<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:31"]
  T4["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S4 -->|calls| T4
  S5["method:JobsWorkflow::concurrent<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:31"]
  T5["method:JobsTaskManager::task<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:57"]
  S5 -->|calls| T5
  S6["method:JobsWorkflow::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:77"]
  T6["method:ScrollDecelerator::step<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@抽奖轮盘/LuckyWheelStruct.swift:23"]
  S6 -->|calls| T6
  S7["method:JobsWorkflow::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:89"]
  T7["method:JobsWorkflow::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:89"]
  S7 -->|calls| T7
  S8["method:JobsCacheKey::make<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:18"]
  T8["method:JobsCacheKey::canonicalString<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:32"]
  S8 -->|calls| T8
  S9["method:JobsCacheKey::make<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:18"]
  T9["method:JobsCacheKey::canonicalString<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:32"]
  S9 -->|calls| T9
  S10["method:JobsCacheKey::canonicalString<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:32"]
  T10["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S10 -->|calls| T10
  S11["method:JobsCacheKey::canonicalString<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:32"]
  T11["method:JobsCacheKey::stringify<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:40"]
  S11 -->|calls| T11
  S12["method:JobsCacheKey::stringify<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:40"]
  T12["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  S12 -->|calls| T12
  S13["method:JobsMemoryCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:38"]
  T13["method:JobsNotiTokenBag::store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:100"]
  S13 -->|calls| T13
  S14["method:JobsMemoryCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:38"]
  T14["method:JobsNotiTokenBag::store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:100"]
  S14 -->|calls| T14
  S15["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  T15["method:JobsNotiTokenBag::store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:100"]
  S15 -->|calls| T15
  S16["method:JobsMemoryCache::remove<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:52"]
  T16["method:JobsNotiTokenBag::store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:100"]
  S16 -->|calls| T16
  S17["method:JobsDiskCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:73"]
  T17["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  S17 -->|calls| T17
  S18["method:JobsDiskCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:73"]
  T18["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S18 -->|calls| T18
  S19["method:JobsDiskCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:87"]
  T19["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  S19 -->|calls| T19
  S20["method:JobsDiskCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:87"]
  T20["method:JSONValue::encode<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:992"]
  S20 -->|calls| T20
  S21["method:JobsDiskCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:87"]
  T21["method:Atomic::write<br/>TODO/TaskCenterComponent/Schedule/Atomic.swift:36"]
  S21 -->|calls| T21
  S22["method:JobsDiskCache::remove<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:95"]
  T22["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  S22 -->|calls| T22
  S23["method:JobsDiskCache::fileURL<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:106"]
  T23["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S23 -->|calls| T23
  S24["struct:APIResponse<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:13"]
  T24["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S24 -->|calls| T24
  S25["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:24"]
  T25["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

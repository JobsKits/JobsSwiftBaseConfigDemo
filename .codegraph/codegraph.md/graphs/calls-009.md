# `calls 符号关系 - 009`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T1["method:JobsDefaultAgent::logStart<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:377"]
  S1 -->|calls| T1
  S2["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T2["method:EmptyEventObserver::willSend<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:28"]
  S2 -->|calls| T2
  S3["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T3["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  S3 -->|calls| T3
  S4["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T4["method:EmptyEventObserver::didReceive<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:29"]
  S4 -->|calls| T4
  S5["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T5["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  S5 -->|calls| T5
  S6["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T6["method:JobsDefaultAgent::storeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:309"]
  S6 -->|calls| T6
  S7["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T7["method:JobsDefaultAgent::logSuccess<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:388"]
  S7 -->|calls| T7
  S8["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T8["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  S8 -->|calls| T8
  S9["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T9["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  S9 -->|calls| T9
  S10["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T10["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  S10 -->|calls| T10
  S11["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  T11["method:JobsRetryPolicy::decision<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsRetryPolicy.swift:66"]
  S11 -->|calls| T11
  S12["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  T12["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S12 -->|calls| T12
  S13["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  T13["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  S13 -->|calls| T13
  S14["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  T14["method:EmptyEventObserver::didFail<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:30"]
  S14 -->|calls| T14
  S15["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  T15["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S15 -->|calls| T15
  S16["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T16["method:JobsEncodingRule::encoding<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:24"]
  S16 -->|calls| T16
  S17["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T17["method:JobsEncodingRule::validate<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:34"]
  S17 -->|calls| T17
  S18["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T18["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S18 -->|calls| T18
  S19["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T19["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S19 -->|calls| T19
  S20["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T20["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S20 -->|calls| T20
  S21["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T21["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S21 -->|calls| T21
  S22["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T22["method:Dictionary::normalizedJSONObject<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:23"]
  S22 -->|calls| T22
  S23["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T23["method:Dictionary::normalizedJSONObject<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:23"]
  S23 -->|calls| T23
  S24["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T24["method:Dictionary::normalizedJSONObject<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:23"]
  S24 -->|calls| T24
  S25["method:JobsDefaultAgent::makeCacheKey<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:271"]
  T25["method:JobsCacheKey::make<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

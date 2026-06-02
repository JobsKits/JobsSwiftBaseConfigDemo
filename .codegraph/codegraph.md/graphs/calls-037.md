# `calls 符号关系 - 037`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T1["method:JobsDefaultAgent::loadCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:282"]
  S1 -->|calls| T1
  S2["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T2["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  S2 -->|calls| T2
  S3["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T3["method:JobsDefaultAgent::loadCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:282"]
  S3 -->|calls| T3
  S4["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T4["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  S4 -->|calls| T4
  S5["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T5["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  S5 -->|calls| T5
  S6["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T6["method:JobsDefaultAgent::loadCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:282"]
  S6 -->|calls| T6
  S7["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T7["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  S7 -->|calls| T7
  S8["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T8["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  S8 -->|calls| T8
  S9["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T9["method:JobsDefaultAgent::logStart<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:377"]
  S9 -->|calls| T9
  S10["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T10["method:EmptyEventObserver::willSend<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:28"]
  S10 -->|calls| T10
  S11["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T11["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  S11 -->|calls| T11
  S12["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T12["method:EmptyEventObserver::didReceive<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:29"]
  S12 -->|calls| T12
  S13["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T13["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  S13 -->|calls| T13
  S14["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T14["method:JobsDefaultAgent::storeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:309"]
  S14 -->|calls| T14
  S15["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T15["method:JobsDefaultAgent::logSuccess<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:388"]
  S15 -->|calls| T15
  S16["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T16["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  S16 -->|calls| T16
  S17["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T17["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  S17 -->|calls| T17
  S18["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  T18["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  S18 -->|calls| T18
  S19["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  T19["method:JobsRetryPolicy::decision<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsRetryPolicy.swift:66"]
  S19 -->|calls| T19
  S20["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  T20["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S20 -->|calls| T20
  S21["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  T21["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  S21 -->|calls| T21
  S22["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  T22["method:EmptyEventObserver::didFail<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:30"]
  S22 -->|calls| T22
  S23["method:JobsDefaultAgent::handle<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:163"]
  T23["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S23 -->|calls| T23
  S24["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T24["method:JobsEncodingRule::encoding<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:24"]
  S24 -->|calls| T24
  S25["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  T25["method:JobsEncodingRule::validate<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:34"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 008`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T1["method:UnityURLRequest::requestForTask:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:39"]
  S1 -->|calls| T1
  S2["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T2["method:UnityURLRequest::requestForTask:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:39"]
  S2 -->|calls| T2
  S3["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T3["method:AlamofireClient::remember<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:229"]
  S3 -->|calls| T3
  S4["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T4["method:AlamofireClient::forget<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:235"]
  S4 -->|calls| T4
  S5["method:AlamofireClient::download<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:127"]
  T5["method:AlamofireClient::remember<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:229"]
  S5 -->|calls| T5
  S6["method:AlamofireClient::download<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:127"]
  T6["method:AlamofireClient::forget<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:235"]
  S6 -->|calls| T6
  S7["method:AlamofireClient::uploadMultipart<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:170"]
  T7["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  S7 -->|calls| T7
  S8["method:AlamofireClient::uploadMultipart<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:170"]
  T8["method:AlamofireClient::remember<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:229"]
  S8 -->|calls| T8
  S9["method:AlamofireClient::uploadMultipart<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:170"]
  T9["method:AlamofireClient::forget<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:235"]
  S9 -->|calls| T9
  S10["method:AlamofireClient::cancel<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:222"]
  T10["method:JobsRequestToken::cancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:24"]
  S10 -->|calls| T10
  S11["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:46"]
  T11["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  S11 -->|calls| T11
  S12["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  T12["method:JobsRequestToken::setCancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:18"]
  S12 -->|calls| T12
  S13["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  T13["method:AlamofireClient::cancel<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:222"]
  S13 -->|calls| T13
  S14["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  T14["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  S14 -->|calls| T14
  S15["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T15["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  S15 -->|calls| T15
  S16["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T16["method:JobsDefaultAgent::makeCacheKey<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:271"]
  S16 -->|calls| T16
  S17["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T17["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  S17 -->|calls| T17
  S18["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T18["method:JobsDefaultAgent::loadCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:282"]
  S18 -->|calls| T18
  S19["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T19["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  S19 -->|calls| T19
  S20["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T20["method:JobsDefaultAgent::loadCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:282"]
  S20 -->|calls| T20
  S21["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T21["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  S21 -->|calls| T21
  S22["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T22["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  S22 -->|calls| T22
  S23["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T23["method:JobsDefaultAgent::loadCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:282"]
  S23 -->|calls| T23
  S24["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T24["method:JobsDefaultAgent::decodeCache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:286"]
  S24 -->|calls| T24
  S25["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T25["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

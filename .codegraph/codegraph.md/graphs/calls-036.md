# `calls 符号关系 - 036`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T1["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S1 -->|calls| T1
  S2["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T2["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S2 -->|calls| T2
  S3["method:JobsMakeLocalNotification::triggerLocalNotification<br/>JobsByPods/JobsLocalNotification@Pods/JobsMakeLocalNotification.swift:14"]
  T3["method:JobsTaskCenter::add<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:34"]
  S3 -->|calls| T3
  S4["method:JobsMakeLocalNotification::triggerLocalNotification<br/>JobsByPods/JobsLocalNotification@Pods/JobsMakeLocalNotification.swift:14"]
  T4["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S4 -->|calls| T4
  S5["method:JobsMakeLocalNotification::triggerLocalNotification<br/>JobsByPods/JobsLocalNotification@Pods/JobsMakeLocalNotification.swift:14"]
  T5["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S5 -->|calls| T5
  S6["method:JobsSwiftMessageToast::show<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarTools.swift:18"]
  T6["method:JobsSwiftMessageToast::show<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarTools.swift:18"]
  S6 -->|calls| T6
  S7["method:JobsAgent::promise<br/>JobsByPods/JobsNetworking@Pods/Adapters/PromiseKit/JobsAgent+PromiseKit.swift:14"]
  T7["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:46"]
  S7 -->|calls| T7
  S8["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T8["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S8 -->|calls| T8
  S9["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T9["method:UnityURLRequest::requestForTask:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:39"]
  S9 -->|calls| T9
  S10["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T10["method:UnityURLRequest::requestForTask:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:39"]
  S10 -->|calls| T10
  S11["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T11["method:AlamofireClient::remember<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:229"]
  S11 -->|calls| T11
  S12["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T12["method:AlamofireClient::forget<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:235"]
  S12 -->|calls| T12
  S13["method:AlamofireClient::download<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:127"]
  T13["method:AlamofireClient::remember<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:229"]
  S13 -->|calls| T13
  S14["method:AlamofireClient::download<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:127"]
  T14["method:AlamofireClient::forget<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:235"]
  S14 -->|calls| T14
  S15["method:AlamofireClient::uploadMultipart<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:170"]
  T15["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  S15 -->|calls| T15
  S16["method:AlamofireClient::uploadMultipart<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:170"]
  T16["method:AlamofireClient::remember<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:229"]
  S16 -->|calls| T16
  S17["method:AlamofireClient::uploadMultipart<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:170"]
  T17["method:AlamofireClient::forget<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:235"]
  S17 -->|calls| T17
  S18["method:AlamofireClient::cancel<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:222"]
  T18["method:JobsRequestToken::cancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:24"]
  S18 -->|calls| T18
  S19["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:46"]
  T19["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  S19 -->|calls| T19
  S20["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  T20["method:JobsRequestToken::setCancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:18"]
  S20 -->|calls| T20
  S21["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  T21["method:AlamofireClient::cancel<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:222"]
  S21 -->|calls| T21
  S22["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  T22["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  S22 -->|calls| T22
  S23["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T23["method:JobsDefaultAgent::prepareRequest<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:204"]
  S23 -->|calls| T23
  S24["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T24["method:JobsDefaultAgent::makeCacheKey<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:271"]
  S24 -->|calls| T24
  S25["method:JobsDefaultAgent::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:71"]
  T25["method:JobsDefaultAgent::fetchNetwork<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:116"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

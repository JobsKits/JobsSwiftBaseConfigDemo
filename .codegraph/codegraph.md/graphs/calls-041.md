# `calls 符号关系 - 041`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  T1["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  S1 -->|calls| T1
  S2["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  T2["method:Dictionary::normalizedJSONObject<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:23"]
  S2 -->|calls| T2
  S3["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  T3["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  S3 -->|calls| T3
  S4["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  T4["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S4 -->|calls| T4
  S5["struct:JobsLogger<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:18"]
  T5["enum_member:TextFormatStrategy::uppercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:18"]
  S5 -->|calls| T5
  S6["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T6["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S6 -->|calls| T6
  S7["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T7["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S7 -->|calls| T7
  S8["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T8["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  S8 -->|calls| T8
  S9["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T9["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S9 -->|calls| T9
  S10["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T10["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  S10 -->|calls| T10
  S11["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T11["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  S11 -->|calls| T11
  S12["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T12["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  S12 -->|calls| T12
  S13["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:13"]
  T13["method:JobsRequestToken::setCancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:18"]
  S13 -->|calls| T13
  S14["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:13"]
  T14["method:AlamofireClient::cancel<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:222"]
  S14 -->|calls| T14
  S15["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:13"]
  T15["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  S15 -->|calls| T15
  S16["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T16["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S16 -->|calls| T16
  S17["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T17["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S17 -->|calls| T17
  S18["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T18["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S18 -->|calls| T18
  S19["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T19["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S19 -->|calls| T19
  S20["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T20["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S20 -->|calls| T20
  S21["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T21["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S21 -->|calls| T21
  S22["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T22["method:AlamofireClient::uploadMultipart<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:170"]
  S22 -->|calls| T22
  S23["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T23["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  S23 -->|calls| T23
  S24["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T24["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  S24 -->|calls| T24
  S25["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T25["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

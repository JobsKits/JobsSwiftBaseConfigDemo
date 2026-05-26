# `calls 符号关系 - 151`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:49"]
  T1["method:JobsError::describe<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:75"]
  S1 -->|calls| T1
  S2["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:49"]
  T2["method:JobsError::describe<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:75"]
  S2 -->|calls| T2
  S3["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:49"]
  T3["method:JobsError::describe<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:75"]
  S3 -->|calls| T3
  S4["class:JobsError<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:49"]
  T4["method:JobsError::describe<br/>JobsByPods/JobsNetworking@Pods/Core/JobsError.swift:75"]
  S4 -->|calls| T4
  S5["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T5["method:JobsRequestToken::setCancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:18"]
  S5 -->|calls| T5
  S6["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T6["method:AlamofireClient::cancel<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:222"]
  S6 -->|calls| T6
  S7["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T7["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S7 -->|calls| T7
  S8["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T8["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S8 -->|calls| T8
  S9["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T9["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S9 -->|calls| T9
  S10["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T10["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S10 -->|calls| T10
  S11["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T11["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S11 -->|calls| T11
  S12["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T12["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S12 -->|calls| T12
  S13["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T13["method:AlamofireClient::download<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:127"]
  S13 -->|calls| T13
  S14["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T14["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S14 -->|calls| T14
  S15["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  T15["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S15 -->|calls| T15
  S16["function:example<br/>JobsByPods/JobsNetworking@Pods/Examples/Usage.swift:16"]
  T16["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  S16 -->|calls| T16
  S17["function:example<br/>JobsByPods/JobsNetworking@Pods/Examples/Usage.swift:16"]
  T17["method:JobsWorkflow::chain<br/>JobsByPods/JobsNetworking@Pods/Async/JobsWorkflow.swift:77"]
  S17 -->|calls| T17
  S18["method:Dictionary::normalizedJSONObject<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:23"]
  T18["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  S18 -->|calls| T18
  S19["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  T19["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  S19 -->|calls| T19
  S20["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  T20["method:Dictionary::normalizedJSONObject<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:23"]
  S20 -->|calls| T20
  S21["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  T21["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  S21 -->|calls| T21
  S22["method:JobsValueNormalizer::normalize<br/>JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:31"]
  T22["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S22 -->|calls| T22
  S23["struct:JobsLogger<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:18"]
  T23["enum_member:TextFormatStrategy::uppercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:18"]
  S23 -->|calls| T23
  S24["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T24["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S24 -->|calls| T24
  S25["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T25["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

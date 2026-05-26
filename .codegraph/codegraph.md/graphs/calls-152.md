# `calls 符号关系 - 152`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T1["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  S1 -->|calls| T1
  S2["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T2["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S2 -->|calls| T2
  S3["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T3["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  S3 -->|calls| T3
  S4["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T4["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  S4 -->|calls| T4
  S5["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  T5["method:JobsValue::stringify<br/>JobsByPods/JobsNetworking@Pods/Types/AnySendable+Network.swift:16"]
  S5 -->|calls| T5
  S6["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:13"]
  T6["method:JobsRequestToken::setCancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:18"]
  S6 -->|calls| T6
  S7["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:13"]
  T7["method:AlamofireClient::cancel<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:222"]
  S7 -->|calls| T7
  S8["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:13"]
  T8["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  S8 -->|calls| T8
  S9["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T9["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S9 -->|calls| T9
  S10["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T10["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S10 -->|calls| T10
  S11["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T11["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S11 -->|calls| T11
  S12["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T12["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S12 -->|calls| T12
  S13["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T13["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S13 -->|calls| T13
  S14["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T14["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S14 -->|calls| T14
  S15["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T15["method:AlamofireClient::uploadMultipart<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:170"]
  S15 -->|calls| T15
  S16["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T16["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  S16 -->|calls| T16
  S17["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T17["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  S17 -->|calls| T17
  S18["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T18["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  S18 -->|calls| T18
  S19["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T19["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  S19 -->|calls| T19
  S20["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  T20["method:JobsRetryPolicy::decision<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsRetryPolicy.swift:66"]
  S20 -->|calls| T20
  S21["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  T21["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  S21 -->|calls| T21
  S22["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T22["method:JobsProgressBar::stopAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:451"]
  S22 -->|calls| T22
  S23["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T23["method:JobsProgressBar::stopAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:451"]
  S23 -->|calls| T23
  S24["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T24["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  S24 -->|calls| T24
  S25["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T25["method:JobsProgressBar::stopAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:451"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

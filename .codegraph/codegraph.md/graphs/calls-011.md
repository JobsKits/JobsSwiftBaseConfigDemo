# `calls 符号关系 - 011`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:13"]
  T1["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  S1 -->|calls| T1
  S2["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T2["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S2 -->|calls| T2
  S3["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T3["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S3 -->|calls| T3
  S4["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T4["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S4 -->|calls| T4
  S5["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T5["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S5 -->|calls| T5
  S6["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T6["method:AlamofireClient::uploadMultipart<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:170"]
  S6 -->|calls| T6
  S7["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T7["method:JobsDefaultAgent::validateAndDecode<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:321"]
  S7 -->|calls| T7
  S8["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T8["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  S8 -->|calls| T8
  S9["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T9["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  S9 -->|calls| T9
  S10["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T10["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  S10 -->|calls| T10
  S11["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  T11["method:JobsRetryPolicy::decision<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsRetryPolicy.swift:66"]
  S11 -->|calls| T11
  S12["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  T12["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  S12 -->|calls| T12
  S13["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  T13["method:JobsCor::resolveUIColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:18"]
  S13 -->|calls| T13
  S14["method:JobsCor::dynamic15<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:35"]
  T14["method:JobsCor::resolveUIColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:18"]
  S14 -->|calls| T14
  S15["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T15["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S15 -->|calls| T15
  S16["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T16["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S16 -->|calls| T16
  S17["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T17["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S17 -->|calls| T17
  S18["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T18["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S18 -->|calls| T18
  S19["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T19["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S19 -->|calls| T19
  S20["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T20["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S20 -->|calls| T20
  S21["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T21["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S21 -->|calls| T21
  S22["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T22["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S22 -->|calls| T22
  S23["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T23["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S23 -->|calls| T23
  S24["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T24["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S24 -->|calls| T24
  S25["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T25["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

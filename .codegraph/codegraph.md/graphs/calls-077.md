# `calls 符号关系 - 077`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T1["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S1 -->|calls| T1
  S2["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T2["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S2 -->|calls| T2
  S3["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T3["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S3 -->|calls| T3
  S4["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T4["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S4 -->|calls| T4
  S5["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T5["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S5 -->|calls| T5
  S6["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T6["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S6 -->|calls| T6
  S7["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T7["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S7 -->|calls| T7
  S8["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T8["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S8 -->|calls| T8
  S9["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T9["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S9 -->|calls| T9
  S10["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T10["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S10 -->|calls| T10
  S11["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T11["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S11 -->|calls| T11
  S12["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T12["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S12 -->|calls| T12
  S13["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T13["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S13 -->|calls| T13
  S14["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T14["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S14 -->|calls| T14
  S15["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T15["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S15 -->|calls| T15
  S16["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T16["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S16 -->|calls| T16
  S17["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T17["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S17 -->|calls| T17
  S18["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T18["method:DemoService::uploadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:63"]
  S18 -->|calls| T18
  S19["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T19["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S19 -->|calls| T19
  S20["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T20["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S20 -->|calls| T20
  S21["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T21["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S21 -->|calls| T21
  S22["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T22["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S22 -->|calls| T22
  S23["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T23["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S23 -->|calls| T23
  S24["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T24["method:APIService::refreshToken<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:100"]
  S24 -->|calls| T24
  S25["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T25["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

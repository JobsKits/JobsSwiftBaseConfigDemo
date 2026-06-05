# `calls 符号关系 - 020`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T1["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S1 -->|calls| T1
  S2["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T2["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S2 -->|calls| T2
  S3["method:JobsNetworkingDownloadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDownloadDemoVC.swift:20"]
  T3["method:DemoService::downloadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:87"]
  S3 -->|calls| T3
  S4["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T4["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S4 -->|calls| T4
  S5["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T5["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S5 -->|calls| T5
  S6["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T6["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S6 -->|calls| T6
  S7["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T7["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S7 -->|calls| T7
  S8["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T8["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S8 -->|calls| T8
  S9["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T9["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S9 -->|calls| T9
  S10["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T10["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S10 -->|calls| T10
  S11["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T11["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S11 -->|calls| T11
  S12["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T12["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S12 -->|calls| T12
  S13["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T13["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S13 -->|calls| T13
  S14["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T14["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S14 -->|calls| T14
  S15["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T15["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S15 -->|calls| T15
  S16["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T16["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S16 -->|calls| T16
  S17["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T17["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S17 -->|calls| T17
  S18["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T18["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S18 -->|calls| T18
  S19["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T19["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S19 -->|calls| T19
  S20["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T20["method:DemoService::uploadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:63"]
  S20 -->|calls| T20
  S21["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T21["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S21 -->|calls| T21
  S22["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T22["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S22 -->|calls| T22
  S23["method:JobsNetworkingUploadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingUploadDemoVC.swift:20"]
  T23["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S23 -->|calls| T23
  S24["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T24["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S24 -->|calls| T24
  S25["method:APIService::requestWithAutoRefresh<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:83"]
  T25["method:APIService::refreshToken<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/APIService.swift:100"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

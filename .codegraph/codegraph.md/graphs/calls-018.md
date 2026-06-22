# `calls 符号关系 - 018`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  T1["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:46"]
  S1 -->|calls| T1
  S2["method:DemoService::uploadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:63"]
  T2["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:13"]
  S2 -->|calls| T2
  S3["method:DemoService::downloadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:87"]
  T3["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  S3 -->|calls| T3
  S4["method:DemoService::downloadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:87"]
  T4["method:DemoService::mimeTypeByFileName<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:125"]
  S4 -->|calls| T4
  S5["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  T5["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S5 -->|calls| T5
  S6["method:DemoService::mimeTypeByFileName<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:125"]
  T6["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S6 -->|calls| T6
  S7["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T7["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S7 -->|calls| T7
  S8["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T8["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S8 -->|calls| T8
  S9["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T9["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S9 -->|calls| T9
  S10["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T10["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S10 -->|calls| T10
  S11["method:JobsNetworkingDownloadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDownloadDemoVC.swift:20"]
  T11["method:DemoService::downloadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:87"]
  S11 -->|calls| T11
  S12["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T12["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S12 -->|calls| T12
  S13["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T13["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S13 -->|calls| T13
  S14["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T14["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S14 -->|calls| T14
  S15["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T15["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S15 -->|calls| T15
  S16["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T16["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S16 -->|calls| T16
  S17["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T17["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S17 -->|calls| T17
  S18["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T18["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S18 -->|calls| T18
  S19["method:JobsNetworkingPatchDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPatchDemoVC.swift:31"]
  T19["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S19 -->|calls| T19
  S20["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T20["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S20 -->|calls| T20
  S21["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T21["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S21 -->|calls| T21
  S22["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T22["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S22 -->|calls| T22
  S23["method:JobsNetworkingPostDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPostDemoVC.swift:55"]
  T23["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S23 -->|calls| T23
  S24["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T24["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S24 -->|calls| T24
  S25["method:JobsNetworkingPutDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingPutDemoVC.swift:31"]
  T25["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

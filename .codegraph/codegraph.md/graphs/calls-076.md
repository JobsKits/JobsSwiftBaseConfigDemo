# `calls 符号关系 - 076`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:ManDB<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@FMDB/ManDB.swift:12"]
  T1["method:ManDB::createTableIfNeeded<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@FMDB/ManDB.swift:23"]
  S1 -->|calls| T1
  S2["method:ManDB::fetchAll<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@FMDB/ManDB.swift:51"]
  T2["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S2 -->|calls| T2
  S3["method:ManDB::fetchAll<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@FMDB/ManDB.swift:51"]
  T3["method:UserDefaults::int<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:28"]
  S3 -->|calls| T3
  S4["method:ManDB::fetchAll<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@FMDB/ManDB.swift:51"]
  T4["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S4 -->|calls| T4
  S5["enum:MethodType<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Models/MethodType.swift:11"]
  T5["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S5 -->|calls| T5
  S6["method:DemoService::loadCatalog<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:27"]
  T6["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:46"]
  S6 -->|calls| T6
  S7["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  T7["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:46"]
  S7 -->|calls| T7
  S8["method:DemoService::uploadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:63"]
  T8["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:13"]
  S8 -->|calls| T8
  S9["method:DemoService::downloadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:87"]
  T9["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:13"]
  S9 -->|calls| T9
  S10["method:DemoService::downloadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:87"]
  T10["method:DemoService::mimeTypeByFileName<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:125"]
  S10 -->|calls| T10
  S11["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  T11["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S11 -->|calls| T11
  S12["method:DemoService::mimeTypeByFileName<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:125"]
  T12["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S12 -->|calls| T12
  S13["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T13["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S13 -->|calls| T13
  S14["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T14["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S14 -->|calls| T14
  S15["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T15["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S15 -->|calls| T15
  S16["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T16["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S16 -->|calls| T16
  S17["method:JobsNetworkingDeleteDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDeleteDemoVC.swift:21"]
  T17["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S17 -->|calls| T17
  S18["method:JobsNetworkingDownloadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDownloadDemoVC.swift:20"]
  T18["method:DemoService::downloadDemo<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:87"]
  S18 -->|calls| T18
  S19["method:JobsNetworkingDownloadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDownloadDemoVC.swift:20"]
  T19["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S19 -->|calls| T19
  S20["method:JobsNetworkingDownloadDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingDownloadDemoVC.swift:20"]
  T20["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S20 -->|calls| T20
  S21["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T21["method:DemoService::requestData<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:41"]
  S21 -->|calls| T21
  S22["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T22["method:DemoService::prettyJSONString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:112"]
  S22 -->|calls| T22
  S23["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T23["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S23 -->|calls| T23
  S24["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T24["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S24 -->|calls| T24
  S25["method:JobsNetworkingGetDemoVC::performRequest<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/VCs/SubVCs/JobsNetworkingGetDemoVC.swift:21"]
  T25["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

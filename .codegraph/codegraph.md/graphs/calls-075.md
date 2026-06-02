# `calls 符号关系 - 075`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:AFService::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:57"]
  T1["method:JobsEncodingRule::validate<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:34"]
  S1 -->|calls| T1
  S2["method:AFService::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:57"]
  T2["method:UnityURLRequest::requestForTask:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:39"]
  S2 -->|calls| T2
  S3["method:AFService::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:57"]
  T3["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S3 -->|calls| T3
  S4["method:AFService::uploadAvatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:63"]
  T4["method:JobsEncodingRule::validate<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:34"]
  S4 -->|calls| T4
  S5["method:AFService::uploadAvatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:63"]
  T5["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S5 -->|calls| T5
  S6["method:AFService::download<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:76"]
  T6["method:JobsEncodingRule::validate<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:34"]
  S6 -->|calls| T6
  S7["method:AFService::download<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:76"]
  T7["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S7 -->|calls| T7
  S8["method:AFService::download<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:76"]
  T8["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S8 -->|calls| T8
  S9["method:AFService::publisherString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:90"]
  T9["method:Bag::value<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:70"]
  S9 -->|calls| T9
  S10["method:AFService::publisherString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:90"]
  T10["method:JobsEncodingRule::validate<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:34"]
  S10 -->|calls| T10
  S11["method:AFService::publisherString<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:90"]
  T11["method:UnityURLRequest::requestForTask:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:39"]
  S11 -->|calls| T11
  S12["method:TokenRetryInterceptor::adapt<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:107"]
  T12["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S12 -->|calls| T12
  S13["method:TokenRetryInterceptor::adapt<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:107"]
  T13["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S13 -->|calls| T13
  S14["method:TokenRetryInterceptor::retry<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:116"]
  T14["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S14 -->|calls| T14
  S15["method:TokenRetryInterceptor::retry<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:116"]
  T15["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S15 -->|calls| T15
  S16["method:TokenRetryInterceptor::retry<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:116"]
  T16["method:JobsMemoryCache::removeAll<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:57"]
  S16 -->|calls| T16
  S17["method:TokenRetryInterceptor::retry<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:116"]
  T17["function:unlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:120"]
  S17 -->|calls| T17
  S18["method:TokenRetryInterceptor::retry<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Alamofire/AFService.swift:116"]
  T18["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S18 -->|calls| T18
  S19["method:FeedModel::loadAll<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/FeedModel.swift:40"]
  T19["method:DemoService::decode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsNetworking本地模拟数据/Services/DemoService.swift:121"]
  S19 -->|calls| T19
  S20["method:FeedModel::loadAll<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/FeedModel.swift:40"]
  T20["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S20 -->|calls| T20
  S21["method:FeedModel::page<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/FeedModel.swift:56"]
  T21["method:TextValidateStrategy::all<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:104"]
  S21 -->|calls| T21
  S22["method:ImageLoader::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/ImageLoader.swift:15"]
  T22["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  S22 -->|calls| T22
  S23["class:PlayerCenterImpl<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/PlayerCenter.swift:19"]
  T23["import:BMPlayer<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/PlayerCenter.swift:18"]
  S23 -->|calls| T23
  S24["class:PlayerCenterImpl<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/PlayerCenter.swift:19"]
  T24["method:PlayerCenterImpl::pause<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/PlayerCenter.swift:42"]
  S24 -->|calls| T24
  S25["method:PlayerCenterImpl::play<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/PlayerCenter.swift:35"]
  T25["method:PlayerCenterImpl::play<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/PlayerCenter.swift:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

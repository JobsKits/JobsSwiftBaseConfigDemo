# `calls 符号关系 - 078`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  T1["method:MoyaProvider::request<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/MoyaProvider+Async.swift:14"]
  S1 -->|calls| T1
  S2["method:CurlLoggerPlugin::willSend<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/Plugins.swift:20"]
  T2["method:URLRequest::cURLDescription<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/Plugins.swift:31"]
  S2 -->|calls| T2
  S3["method:URLRequest::cURLDescription<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Moya/Plugins.swift:31"]
  T3["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S3 -->|calls| T3
  S4["class:CardNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:20"]
  T4["method:CardNode::textNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:189"]
  S4 -->|calls| T4
  S5["class:CardNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:20"]
  T5["method:CardNode::textNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:189"]
  S5 -->|calls| T5
  S6["class:CardNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:20"]
  T6["method:CardNode::textNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:189"]
  S6 -->|calls| T6
  S7["class:CardNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:20"]
  T7["method:CardNode::textNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:189"]
  S7 -->|calls| T7
  S8["class:CardNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:20"]
  T8["method:CardNode::textNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:189"]
  S8 -->|calls| T8
  S9["class:CardNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:20"]
  T9["method:CardNode::textNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:189"]
  S9 -->|calls| T9
  S10["class:CardNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:20"]
  T10["method:CardNode::textNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:189"]
  S10 -->|calls| T10
  S11["class:CardNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:20"]
  T11["method:CardNode::textNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:189"]
  S11 -->|calls| T11
  S12["class:CardNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:20"]
  T12["method:CardNode::textNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:189"]
  S12 -->|calls| T12
  S13["class:CardNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:20"]
  T13["method:CardNode::textNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:189"]
  S13 -->|calls| T13
  S14["class:KitchenSinkNode<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:218"]
  T14["method:KitchenSinkNode::buildsCards<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:253"]
  S14 -->|calls| T14
  S15["method:KitchenSinkNode::didLoad<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:235"]
  T15["method:KitchenSinkNode::didLoad<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:235"]
  S15 -->|calls| T15
  S16["method:KitchenSinkNode::buildsCards<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:253"]
  T16["method:KitchenSinkNode::update<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:266"]
  S16 -->|calls| T16
  S17["method:KitchenSinkNode::update<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:266"]
  T17["method:KitchenSinkNode::buildsCards<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@Texture/Demo@ASDisplayNode.swift:253"]
  S17 -->|calls| T17
  S18["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T18["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S18 -->|calls| T18
  S19["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T19["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S19 -->|calls| T19
  S20["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T20["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S20 -->|calls| T20
  S21["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T21["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S21 -->|calls| T21
  S22["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T22["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S22 -->|calls| T22
  S23["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T23["function:MomentPost::makeSample::avatar<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:45"]
  S23 -->|calls| T23
  S24["method:MomentPost::makeSample<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@UIKIit朋友圈ByGKPhotoBrowser/Model/ModelByUIKit朋友圈.swift:42"]
  T24["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S24 -->|calls| T24
  S25["class:DemoDB<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@WCDB/DemoDB.swift:13"]
  T25["method:JobsSwiftTimerManager::create<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 186`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:jobsGetMainWindowBefore13<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:25"]
  T1["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:79"]
  S1 -->|calls| T1
  S2["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:33"]
  T2["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:126"]
  S2 -->|calls| T2
  S3["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:33"]
  T3["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:144"]
  S3 -->|calls| T3
  S4["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:41"]
  T4["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:126"]
  S4 -->|calls| T4
  S5["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:41"]
  T5["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:144"]
  S5 -->|calls| T5
  S6["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:53"]
  T6["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:126"]
  S6 -->|calls| T6
  S7["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:53"]
  T7["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:165"]
  S7 -->|calls| T7
  S8["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:53"]
  T8["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:82"]
  S8 -->|calls| T8
  S9["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:68"]
  T9["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:126"]
  S9 -->|calls| T9
  S10["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:68"]
  T10["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:165"]
  S10 -->|calls| T10
  S11["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:68"]
  T11["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:82"]
  S11 -->|calls| T11
  S12["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:82"]
  T12["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:82"]
  S12 -->|calls| T12
  S13["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:82"]
  T13["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:82"]
  S13 -->|calls| T13
  S14["property:UIApplication::jobsSafeAreaInsets<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:108"]
  T14["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:33"]
  S14 -->|calls| T14
  S15["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:126"]
  T15["function:UIApplication::bestWindowScene::rank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:127"]
  S15 -->|calls| T15
  S16["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:126"]
  T16["function:UIApplication::bestWindowScene::rank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:127"]
  S16 -->|calls| T16
  S17["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:144"]
  T17["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S17 -->|calls| T17
  S18["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:144"]
  T18["method:OrderedDictionary::sorted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:468"]
  S18 -->|calls| T18
  S19["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:144"]
  T19["function:UIApplication::bestWindow::windowRank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:152"]
  S19 -->|calls| T19
  S20["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:144"]
  T20["function:UIApplication::bestWindow::windowRank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:152"]
  S20 -->|calls| T20
  S21["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:165"]
  T21["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:144"]
  S21 -->|calls| T21
  S22["method:JobsIconfontLoadToken::cancel<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:81"]
  T22["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S22 -->|calls| T22
  S23["method:JobsIconfontLoadToken::cancel<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:81"]
  T23["field:JobsIconfontLoadToken::onCancel<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:73"]
  S23 -->|calls| T23
  S24["class:JobsIconfontLoadToken<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:72"]
  T24["method:JobsIconfontLoadToken::cancel<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:81"]
  S24 -->|calls| T24
  S25["class:JobsIconfont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:97"]
  T25["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 016`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfiguration.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfiguration.h:1"]
  T1["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfiguration.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfiguration.h:1"]
  T2["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfiguration.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfiguration.h:1"]
  T3["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S3 -->|calls| T3
  S4["method:ASConfiguration::initWithDictionary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfiguration.mm:15"]
  T4["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S4 -->|calls| T4
  S5["method:ASConfiguration::initWithDictionary:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfiguration.mm:15"]
  T5["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  S5 -->|calls| T5
  S6["function:ASConfigurationManagerGet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  T6["method:ASConfigurationManager::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  S6 -->|calls| T6
  S7["method:ASConfigurationManager::defaultConfiguration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:31"]
  T7["method:ASConfigurationManager::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  S7 -->|calls| T7
  S8["method:ASConfigurationManager::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  T8["method:ASConfigurationManager::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  S8 -->|calls| T8
  S9["method:ASConfigurationManager::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  T9["variable:copy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:29"]
  S9 -->|calls| T9
  S10["method:ASConfigurationManager::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  T10["method:ASConfiguration::textureConfiguration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfiguration.mm:48"]
  S10 -->|calls| T10
  S11["method:ASConfigurationManager::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  T11["method:ASConfigurationManager::defaultConfiguration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:31"]
  S11 -->|calls| T11
  S12["method:ASConfigurationManager::test_resetWithConfiguration:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:93"]
  T12["function:ASConfigurationManagerGet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S12 -->|calls| T12
  S13["method:ASConfigurationManager::test_resetWithConfiguration:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:93"]
  T13["method:ASConfigurationManager::defaultConfiguration<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:31"]
  S13 -->|calls| T13
  S14["function:_ASActivateExperimentalFeature<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:102"]
  T14["function:ASConfigurationManagerGet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S14 -->|calls| T14
  S15["function:ASNotifyInitialized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:107"]
  T15["function:ASConfigurationManagerGet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.h:1"]
  T16["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.h:1"]
  T17["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.h:1"]
  T18["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.h:1"]
  T19["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.h:1"]
  T20["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S20 -->|calls| T20
  S21["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  T21["method:ASControlNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S21 -->|calls| T21
  S22["method:ASControlNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:95"]
  T22["method:ASControlNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:95"]
  S22 -->|calls| T22
  S23["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:114"]
  T23["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S23 -->|calls| T23
  S24["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T24["method:ASControlNode::beginTrackingWithTouch:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:491"]
  S24 -->|calls| T24
  S25["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T25["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

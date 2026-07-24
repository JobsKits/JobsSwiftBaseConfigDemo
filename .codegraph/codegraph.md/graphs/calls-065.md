# `calls 符号关系 - 065`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.h:1"]
  T1["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.h:1"]
  T2["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S2 -->|calls| T2
  S3["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:62"]
  T3["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S3 -->|calls| T3
  S4["method:ASTextNodeRendererKey::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:71"]
  T4["function:ASHashBytes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S4 -->|calls| T4
  S5["function:sharedRendererCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:101"]
  T5["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S5 -->|calls| T5
  S6["function:_rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:118"]
  T6["function:sharedRendererCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:101"]
  S6 -->|calls| T6
  S7["function:_rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:118"]
  T7["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:62"]
  S7 -->|calls| T7
  S8["function:_rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:118"]
  T8["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:62"]
  S8 -->|calls| T8
  S9["function:rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:135"]
  T9["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:62"]
  S9 -->|calls| T9
  S10["function:rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:135"]
  T10["function:_rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:118"]
  S10 -->|calls| T10
  S11["function:rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:135"]
  T11["function:_rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:118"]
  S11 -->|calls| T11
  S12["method:ASTextNodeDrawParameter::initWithRendererAttributes:backgroundColor:textContainerInsets:contentScale:opaque:bounds:traitCollection:willDisplayNodeContentWithRenderingContext:didDisplayNodeContentWithRenderingContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:168"]
  T12["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S12 -->|calls| T12
  S13["method:ASTextNodeDrawParameter::rendererForBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:193"]
  T13["function:rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:135"]
  S13 -->|calls| T13
  S14["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T14["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S14 -->|calls| T14
  S15["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T15["method:ASTextNode::shadowOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1264"]
  S15 -->|calls| T15
  S16["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T16["method:ASTextNode::shadowColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1242"]
  S16 -->|calls| T16
  S17["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T17["method:ASTextNode::shadowOpacity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1276"]
  S17 -->|calls| T17
  S18["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T18["method:ASTextNode::shadowRadius<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1288"]
  S18 -->|calls| T18
  S19["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T19["function:ASTextNode::DefaultLinkAttributeNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:243"]
  S19 -->|calls| T19
  S20["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T20["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S20 -->|calls| T20
  S21["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T21["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S21 -->|calls| T21
  S22["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T22["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:303"]
  S22 -->|calls| T22
  S23["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T23["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S23 -->|calls| T23
  S24["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T24["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:322"]
  S24 -->|calls| T24
  S25["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T25["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:303"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

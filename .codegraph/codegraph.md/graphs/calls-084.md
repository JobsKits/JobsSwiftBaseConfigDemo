# `calls 符号关系 - 084`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:sharedRendererCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:101"]
  T1["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S1 -->|calls| T1
  S2["function:_rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:118"]
  T2["function:sharedRendererCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:101"]
  S2 -->|calls| T2
  S3["function:_rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:118"]
  T3["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:62"]
  S3 -->|calls| T3
  S4["function:_rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:118"]
  T4["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:62"]
  S4 -->|calls| T4
  S5["function:rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:135"]
  T5["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:62"]
  S5 -->|calls| T5
  S6["function:rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:135"]
  T6["function:_rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:118"]
  S6 -->|calls| T6
  S7["function:rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:135"]
  T7["function:_rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:118"]
  S7 -->|calls| T7
  S8["method:ASTextNodeDrawParameter::initWithRendererAttributes:backgroundColor:textContainerInsets:contentScale:opaque:bounds:traitCollection:willDisplayNodeContentWithRenderingContext:didDisplayNodeContentWithRenderingContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:168"]
  T8["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S8 -->|calls| T8
  S9["method:ASTextNodeDrawParameter::rendererForBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:193"]
  T9["function:rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:135"]
  S9 -->|calls| T9
  S10["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T10["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S10 -->|calls| T10
  S11["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T11["method:ASTextNode::shadowOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1264"]
  S11 -->|calls| T11
  S12["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T12["method:ASTextNode::shadowColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1242"]
  S12 -->|calls| T12
  S13["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T13["method:ASTextNode::shadowOpacity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1276"]
  S13 -->|calls| T13
  S14["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T14["method:ASTextNode::shadowRadius<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1288"]
  S14 -->|calls| T14
  S15["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T15["function:ASTextNode::DefaultLinkAttributeNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:243"]
  S15 -->|calls| T15
  S16["method:ASTextNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T16["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S16 -->|calls| T16
  S17["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T17["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S17 -->|calls| T17
  S18["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T18["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:303"]
  S18 -->|calls| T18
  S19["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T19["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S19 -->|calls| T19
  S20["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T20["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:322"]
  S20 -->|calls| T20
  S21["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T21["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:303"]
  S21 -->|calls| T21
  S22["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T22["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S22 -->|calls| T22
  S23["method:ASTextNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:334"]
  T23["method:ASTextNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:334"]
  S23 -->|calls| T23
  S24["method:ASTextNode::_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:372"]
  T24["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S24 -->|calls| T24
  S25["method:ASTextNode::_locked_rendererWithBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:390"]
  T25["function:rendererForAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:135"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

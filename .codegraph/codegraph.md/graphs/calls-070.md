# `calls 符号关系 - 070`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T1["method:Mutex::Mutex<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S1 -->|calls| T1
  S2["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T2["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S2 -->|calls| T2
  S3["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T3["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S3 -->|calls| T3
  S4["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T4["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S4 -->|calls| T4
  S5["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T5["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S5 -->|calls| T5
  S6["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T6["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S6 -->|calls| T6
  S7["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T7["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T8["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S8 -->|calls| T8
  S9["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T9["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S9 -->|calls| T9
  S10["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T10["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S10 -->|calls| T10
  S11["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T11["method:ASTextNode::shadowOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1264"]
  S11 -->|calls| T11
  S12["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T12["method:ASTextNode::shadowColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1242"]
  S12 -->|calls| T12
  S13["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T13["method:ASTextNode::shadowOpacity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1276"]
  S13 -->|calls| T13
  S14["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T14["method:ASTextNode::shadowRadius<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1288"]
  S14 -->|calls| T14
  S15["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T15["function:DefaultLinkAttributeNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:178"]
  S15 -->|calls| T15
  S16["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T16["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S16 -->|calls| T16
  S17["function:propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T17["function:propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  S17 -->|calls| T17
  S18["function:propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T18["function:_plainStringForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S18 -->|calls| T18
  S19["function:propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T19["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S19 -->|calls| T19
  S20["function:propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T20["function:propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  S20 -->|calls| T20
  S21["function:propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T21["function:_plainStringForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S21 -->|calls| T21
  S22["function:propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T22["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S22 -->|calls| T22
  S23["function:didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  T23["function:didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  S23 -->|calls| T23
  S24["function:setTextContainerInset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:315"]
  T24["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S24 -->|calls| T24
  S25["function:calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T25["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

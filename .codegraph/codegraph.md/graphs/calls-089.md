# `calls 符号关系 - 089`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T1["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S1 -->|calls| T1
  S2["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T2["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S2 -->|calls| T2
  S3["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T3["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T4["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S4 -->|calls| T4
  S5["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T5["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S5 -->|calls| T5
  S6["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T6["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S6 -->|calls| T6
  S7["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T7["method:ASTextNode::shadowOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1264"]
  S7 -->|calls| T7
  S8["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T8["method:ASTextNode::shadowColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1242"]
  S8 -->|calls| T8
  S9["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T9["method:ASTextNode::shadowOpacity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1276"]
  S9 -->|calls| T9
  S10["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T10["method:ASTextNode::shadowRadius<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1288"]
  S10 -->|calls| T10
  S11["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T11["function:DefaultLinkAttributeNames<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:178"]
  S11 -->|calls| T11
  S12["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T12["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S12 -->|calls| T12
  S13["function:propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T13["function:propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  S13 -->|calls| T13
  S14["function:propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T14["function:_plainStringForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S14 -->|calls| T14
  S15["function:propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T15["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S15 -->|calls| T15
  S16["function:propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T16["function:propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  S16 -->|calls| T16
  S17["function:propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T17["function:_plainStringForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S17 -->|calls| T17
  S18["function:propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T18["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S18 -->|calls| T18
  S19["function:didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  T19["function:didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  S19 -->|calls| T19
  S20["function:setTextContainerInset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:315"]
  T20["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S20 -->|calls| T20
  S21["function:calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T21["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S21 -->|calls| T21
  S22["function:calculateSizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T22["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S22 -->|calls| T22
  S23["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T23["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S23 -->|calls| T23
  S24["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T24["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S24 -->|calls| T24
  S25["function:setAttributedText:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T25["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 039`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:88"]
  T1["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:88"]
  S1 -->|calls| T1
  S2["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:88"]
  T2["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  S2 -->|calls| T2
  S3["method:ASDefaultImageDownloader::setDefaultDownloaderProvider:cacheProvider:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:93"]
  T3["method:ASDefaultImageDownloader::setDefaultDownloaderProvider:cacheProvider:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:93"]
  S3 -->|calls| T3
  S4["method:ASDefaultImageDownloader::setDefaultDownloaderProvider:cacheProvider:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:93"]
  T4["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T5["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T6["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T7["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T8["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T9["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T10["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::closestViewController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Convenience.mm:17"]
  T11["function:ASFindClosestViewOfLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:266"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::closestViewController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Convenience.mm:17"]
  T12["method:UIResponder::asdk_responderChainEnumerator<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:40"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::style:propertyDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:30"]
  T13["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::style<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:51"]
  T14["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  T15["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::layoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:83"]
  T16["method:ASDisplayNode::layoutThatFits:parentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:88"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::layoutThatFits:parentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:88"]
  T17["method:ASDisplayNode::_isLayoutTransitionInvalid<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:564"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::layoutThatFits:parentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:88"]
  T18["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::layoutThatFits:parentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:88"]
  T19["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::layoutThatFits:parentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:88"]
  T20["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::setPrimitiveTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:132"]
  T21["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::setPrimitiveTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:132"]
  T22["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::asciiArtString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:151"]
  T23["method:ASDisplayNode::asciiArtName<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:156"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::constrainedSizeForCalculatedLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:202"]
  T24["method:ASDisplayNode::_locked_constrainedSizeForCalculatedLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:208"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T25["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

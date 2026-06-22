# `calls 符号关系 - 092`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T1["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T2["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T3["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T4["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T5["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T6["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T7["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T8["function:DefaultTruncationAttributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1278"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T9["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T10["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T11["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T12["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T13["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T14["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T15["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T16["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T17["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T18["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T19["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T20["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T21["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S21 -->|calls| T21
  S22["method:ASVideoNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:97"]
  T22["method:ASVideoNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:97"]
  S22 -->|calls| T22
  S23["method:ASVideoNode::initWithCache:downloader:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:97"]
  T23["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S23 -->|calls| T23
  S24["method:ASVideoNode::constructPlayerNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:114"]
  T24["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S24 -->|calls| T24
  S25["method:ASVideoNode::constructPlayerItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoNode.mm:126"]
  T25["method:ASVideoPlayerNode::asset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:191"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

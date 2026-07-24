# `calls 符号关系 - 038`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T1["function:ASDisplayNodeFindFirstSubnode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:231"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T2["variable:BOOL<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASEqualityHelpers.h:16"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T3["function:ASDisplayNodeFindFirstSubnodeOfClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:236"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T4["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T5["function:ASDisplayNodeDefaultTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:316"]
  S5 -->|calls| T5
  S6["function:ASPerformMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:17"]
  T6["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S6 -->|calls| T6
  S7["function:ASPerformMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:17"]
  T7["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S7 -->|calls| T7
  S8["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T8["function:ASLayerToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S8 -->|calls| T8
  S9["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T9["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S9 -->|calls| T9
  S10["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T10["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S10 -->|calls| T10
  S11["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T11["variable:copy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:29"]
  S11 -->|calls| T11
  S12["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T12["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S12 -->|calls| T12
  S13["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T13["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S13 -->|calls| T13
  S14["function:ASDisplayNodePerformBlockOnEveryNodeBFS<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:113"]
  T14["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S14 -->|calls| T14
  S15["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  T15["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S15 -->|calls| T15
  S16["function:ASDisplayNodeFindFirstSupernode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:139"]
  T16["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S16 -->|calls| T16
  S17["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  T17["function:ASLayerToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S17 -->|calls| T17
  S18["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  T18["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  S18 -->|calls| T18
  S19["function:ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:170"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["function:ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:170"]
  T20["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  S20 -->|calls| T20
  S21["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  T21["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S21 -->|calls| T21
  S22["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  T22["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  S22 -->|calls| T22
  S23["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  T24["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  S24 -->|calls| T24
  S25["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  T25["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

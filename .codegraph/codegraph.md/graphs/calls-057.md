# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T1["function:ASDisplayNodeDefaultTintColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:316"]
  S1 -->|calls| T1
  S2["function:ASPerformMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:17"]
  T2["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S2 -->|calls| T2
  S3["function:ASPerformMainThreadDeallocation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:17"]
  T3["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S3 -->|calls| T3
  S4["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T4["function:ASLayerToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S4 -->|calls| T4
  S5["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T5["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S5 -->|calls| T5
  S6["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T6["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S6 -->|calls| T6
  S7["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T7["variable:copy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:29"]
  S7 -->|calls| T7
  S8["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T8["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S8 -->|calls| T8
  S9["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T9["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S9 -->|calls| T9
  S10["function:ASDisplayNodePerformBlockOnEveryNodeBFS<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:113"]
  T10["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S10 -->|calls| T10
  S11["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  T11["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S11 -->|calls| T11
  S12["function:ASDisplayNodeFindFirstSupernode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:139"]
  T12["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S12 -->|calls| T12
  S13["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  T13["function:ASLayerToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S13 -->|calls| T13
  S14["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  T14["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  S14 -->|calls| T14
  S15["function:ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:170"]
  T15["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S15 -->|calls| T15
  S16["function:ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:170"]
  T16["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  S16 -->|calls| T16
  S17["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  T17["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S17 -->|calls| T17
  S18["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  T18["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  S18 -->|calls| T18
  S19["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  T20["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  S20 -->|calls| T20
  S21["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  T21["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  S21 -->|calls| T21
  S22["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  T22["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S22 -->|calls| T22
  S23["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  T23["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S23 -->|calls| T23
  S24["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  T24["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S24 -->|calls| T24
  S25["function:ASDisplayNodeFindFirstSubnode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:231"]
  T25["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

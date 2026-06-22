# `calls 符号关系 - 148`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T1["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T2["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T3["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S3 -->|calls| T3
  S4["function:changes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:723"]
  T4["function:ASHierarchyChangeTypeIsFinal<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:35"]
  S4 -->|calls| T4
  S5["function:changes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:723"]
  T5["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S5 -->|calls| T5
  S6["function:changes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:723"]
  T6["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S6 -->|calls| T6
  S7["function:changes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:723"]
  T7["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S7 -->|calls| T7
  S8["function:changes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:791"]
  T8["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S8 -->|calls| T8
  S9["function:changes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:802"]
  T9["method:NSIndexSet::as_smallDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:68"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T10["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T11["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T12["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T13["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T14["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T15["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S15 -->|calls| T15
  S16["function:changes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:866"]
  T16["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T17["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T18["function:ASHierarchyChangeTypeIsFinal<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:35"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T19["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T20["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S20 -->|calls| T20
  S21["function:changes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:972"]
  T21["method:NSIndexSet::as_smallDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:68"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T22["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T23["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T24["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T25["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

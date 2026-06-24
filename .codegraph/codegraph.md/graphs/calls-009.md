# `calls 符号关系 - 009`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionNode::allowsMultipleSelection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:577"]
  T1["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S1 -->|calls| T1
  S2["method:ASCollectionNode::setAlwaysBounceVertical:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:586"]
  T2["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S2 -->|calls| T2
  S3["method:ASCollectionNode::alwaysBounceVertical<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:596"]
  T3["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S3 -->|calls| T3
  S4["method:ASCollectionNode::setAlwaysBounceHorizontal:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:605"]
  T4["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S4 -->|calls| T4
  S5["method:ASCollectionNode::alwaysBounceHorizontal<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:615"]
  T5["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S5 -->|calls| T5
  S6["method:ASCollectionNode::setShowsVerticalScrollIndicator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:624"]
  T6["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S6 -->|calls| T6
  S7["method:ASCollectionNode::showsVerticalScrollIndicator<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:634"]
  T7["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S7 -->|calls| T7
  S8["method:ASCollectionNode::setShowsHorizontalScrollIndicator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:643"]
  T8["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S8 -->|calls| T8
  S9["method:ASCollectionNode::showsHorizontalScrollIndicator<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:653"]
  T9["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S9 -->|calls| T9
  S10["method:ASCollectionNode::setPagingEnabled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:663"]
  T10["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S10 -->|calls| T10
  S11["method:ASCollectionNode::isPagingEnabled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:674"]
  T11["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S11 -->|calls| T11
  S12["method:ASCollectionNode::setCollectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:684"]
  T12["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S12 -->|calls| T12
  S13["method:ASCollectionNode::collectionViewLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:695"]
  T13["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S13 -->|calls| T13
  S14["method:ASCollectionNode::setContentInset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:704"]
  T14["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S14 -->|calls| T14
  S15["method:ASCollectionNode::contentInset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:714"]
  T15["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S15 -->|calls| T15
  S16["method:ASCollectionNode::setContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:723"]
  T16["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S16 -->|calls| T16
  S17["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  T17["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S17 -->|calls| T17
  S18["method:ASCollectionNode::contentOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:739"]
  T18["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S18 -->|calls| T18
  S19["method:ASCollectionNode::cellLayoutMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:784"]
  T19["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S19 -->|calls| T19
  S20["method:ASCollectionNode::setCellLayoutMode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:793"]
  T20["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S20 -->|calls| T20
  S21["method:ASCollectionNode::tuningParametersForRangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:804"]
  T21["method:ASCollectionNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:814"]
  S21 -->|calls| T21
  S22["method:ASCollectionNode::setTuningParameters:forRangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:809"]
  T22["method:ASCollectionNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:823"]
  S22 -->|calls| T22
  S23["method:ASCollectionNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:814"]
  T23["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S23 -->|calls| T23
  S24["method:ASCollectionNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:823"]
  T24["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S24 -->|calls| T24
  S25["method:ASCollectionNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:885"]
  T25["method:ASCollectionNode::reloadData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1063"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

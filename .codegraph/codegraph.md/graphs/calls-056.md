# `calls 符号关系 - 056`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableNode::setContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:324"]
  T1["method:ASTableNode::setContentOffset:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:329"]
  S1 -->|calls| T1
  S2["method:ASTableNode::setDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:396"]
  T2["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S2 -->|calls| T2
  S3["method:ASTableNode::setDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:396"]
  T3["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S3 -->|calls| T3
  S4["method:ASTableNode::delegate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:414"]
  T4["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S4 -->|calls| T4
  S5["method:ASTableNode::setDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:423"]
  T5["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S5 -->|calls| T5
  S6["method:ASTableNode::setDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:423"]
  T6["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S6 -->|calls| T6
  S7["method:ASTableNode::dataSource<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:441"]
  T7["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S7 -->|calls| T7
  S8["method:ASTableNode::setAllowsSelection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:451"]
  T8["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S8 -->|calls| T8
  S9["method:ASTableNode::allowsSelection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:461"]
  T9["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S9 -->|calls| T9
  S10["method:ASTableNode::setAllowsSelectionDuringEditing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:470"]
  T10["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S10 -->|calls| T10
  S11["method:ASTableNode::allowsSelectionDuringEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:480"]
  T11["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S11 -->|calls| T11
  S12["method:ASTableNode::setAllowsMultipleSelection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:489"]
  T12["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S12 -->|calls| T12
  S13["method:ASTableNode::allowsMultipleSelection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:499"]
  T13["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S13 -->|calls| T13
  S14["method:ASTableNode::setAllowsMultipleSelectionDuringEditing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:508"]
  T14["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S14 -->|calls| T14
  S15["method:ASTableNode::allowsMultipleSelectionDuringEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:518"]
  T15["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S15 -->|calls| T15
  S16["method:ASTableNode::updateCurrentRangeWithMode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:539"]
  T16["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S16 -->|calls| T16
  S17["method:ASTableNode::tuningParametersForRangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:555"]
  T17["method:ASTableNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:565"]
  S17 -->|calls| T17
  S18["method:ASTableNode::setTuningParameters:forRangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:560"]
  T18["method:ASTableNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:574"]
  S18 -->|calls| T18
  S19["method:ASTableNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:565"]
  T19["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S19 -->|calls| T19
  S20["method:ASTableNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:574"]
  T20["method:ASTableNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S20 -->|calls| T20
  S21["method:ASTableNode::numberOfRowsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:638"]
  T21["method:ASTableNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:628"]
  S21 -->|calls| T21
  S22["method:ASTableNode::numberOfSections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:645"]
  T22["method:ASTableNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:628"]
  S22 -->|calls| T22
  S23["method:ASTableNode::nodeForRowAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:663"]
  T23["method:ASTableNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:628"]
  S23 -->|calls| T23
  S24["method:ASTableNode::indexPathsForVisibleRows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:729"]
  T24["method:ASTableNode::visibleNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:652"]
  S24 -->|calls| T24
  S25["method:ASTableNode::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:744"]
  T25["variable:completion<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

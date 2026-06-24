# `calls 符号关系 - 122`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMutableElementMap::removeAllElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:66"]
  T1["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S1 -->|calls| T1
  S2["method:ASMutableElementMap::removeAllElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:66"]
  T2["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S2 -->|calls| T2
  S3["method:ASMutableElementMap::insertEmptySectionsOfItemsAtIndexes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:77"]
  T3["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S3 -->|calls| T3
  S4["method:ASMutableElementMap::insertElement:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:84"]
  T4["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S4 -->|calls| T4
  S5["method:ASMutableElementMap::migrateSupplementaryElementsWithSectionMapping:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:99"]
  T5["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S5 -->|calls| T5
  S6["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  T6["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S6 -->|calls| T6
  S7["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  T7["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S7 -->|calls| T7
  S8["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  T8["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S8 -->|calls| T8
  S9["method:ASPendingStateController::registerNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:52"]
  T9["method:ASPendingStateController::scheduleFlushIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:81"]
  S9 -->|calls| T9
  S10["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  T10["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S10 -->|calls| T10
  S11["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  T11["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S11 -->|calls| T11
  S12["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  T12["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S12 -->|calls| T12
  S13["method:ASPendingStateController::scheduleFlushIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:81"]
  T13["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  S13 -->|calls| T13
  S14["method:ASResponderChainEnumerator::initWithResponder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:17"]
  T14["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S14 -->|calls| T14
  S15["method:ASSection::initWithSectionID:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASSection.mm:15"]
  T15["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T16["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T17["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T18["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T19["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T20["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T21["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T22["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T23["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T24["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["method:ASTip::initWithNode:kind:format:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTip.mm:18"]
  T25["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

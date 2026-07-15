# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T1["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["method:ASLayoutTransition::initWithNode:pendingLayout:previousLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:66"]
  T2["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S2 -->|calls| T2
  S3["method:ASLayoutTransition::isSynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:81"]
  T3["function:ASLayoutCanTransitionAsynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:29"]
  S3 -->|calls| T3
  S4["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  T4["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  S4 -->|calls| T4
  S5["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T5["function:if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S5 -->|calls| T5
  S6["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T6["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S6 -->|calls| T6
  S7["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T7["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S7 -->|calls| T7
  S8["class:ASLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:54"]
  T8["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S8 -->|calls| T8
  S9["class:ASLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:54"]
  T9["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S9 -->|calls| T9
  S10["method:ASLayoutTransition::transitionContext:constrainedSizeForKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:236"]
  T10["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S10 -->|calls| T10
  S11["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  T11["function:ASLayoutTransition::findNodesInLayoutAtIndexesWithFilteredNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:265"]
  S11 -->|calls| T11
  S12["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  T12["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S12 -->|calls| T12
  S13["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  T13["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  S13 -->|calls| T13
  S14["method:ASMutableElementMap::copyWithZone:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:36"]
  T14["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  S14 -->|calls| T14
  S15["method:ASMutableElementMap::removeAllSections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:41"]
  T15["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S15 -->|calls| T15
  S16["method:ASMutableElementMap::removeItemsAtIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:51"]
  T16["function:ASDeleteElementsInTwoDimensionalArrayAtIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:33"]
  S16 -->|calls| T16
  S17["method:ASMutableElementMap::removeAllElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:66"]
  T17["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S17 -->|calls| T17
  S18["method:ASMutableElementMap::removeAllElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:66"]
  T18["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S18 -->|calls| T18
  S19["method:ASMutableElementMap::insertEmptySectionsOfItemsAtIndexes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:77"]
  T19["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S19 -->|calls| T19
  S20["method:ASMutableElementMap::insertElement:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:84"]
  T20["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S20 -->|calls| T20
  S21["method:ASMutableElementMap::migrateSupplementaryElementsWithSectionMapping:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:99"]
  T21["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S21 -->|calls| T21
  S22["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  T22["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S22 -->|calls| T22
  S23["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  T23["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S23 -->|calls| T23
  S24["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  T24["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S24 -->|calls| T24
  S25["method:ASPendingStateController::registerNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:52"]
  T25["method:ASPendingStateController::scheduleFlushIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:81"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASLayoutTransition::initWithNode:pendingLayout:previousLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:66"]
  T1["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S1 -->|calls| T1
  S2["method:ASLayoutTransition::isSynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:81"]
  T2["function:ASLayoutCanTransitionAsynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:29"]
  S2 -->|calls| T2
  S3["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  T3["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  S3 -->|calls| T3
  S4["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T4["function:if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S4 -->|calls| T4
  S5["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T5["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S5 -->|calls| T5
  S6["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T6["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S6 -->|calls| T6
  S7["class:ASLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:54"]
  T7["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S7 -->|calls| T7
  S8["class:ASLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:54"]
  T8["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S8 -->|calls| T8
  S9["method:ASLayoutTransition::transitionContext:constrainedSizeForKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:236"]
  T9["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S9 -->|calls| T9
  S10["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  T10["function:ASLayoutTransition::findNodesInLayoutAtIndexesWithFilteredNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:265"]
  S10 -->|calls| T10
  S11["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  T11["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S11 -->|calls| T11
  S12["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  T12["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  S12 -->|calls| T12
  S13["method:ASMutableElementMap::copyWithZone:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:36"]
  T13["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  S13 -->|calls| T13
  S14["method:ASMutableElementMap::removeAllSections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:41"]
  T14["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S14 -->|calls| T14
  S15["method:ASMutableElementMap::removeItemsAtIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:51"]
  T15["function:ASDeleteElementsInTwoDimensionalArrayAtIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:33"]
  S15 -->|calls| T15
  S16["method:ASMutableElementMap::removeAllElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:66"]
  T16["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S16 -->|calls| T16
  S17["method:ASMutableElementMap::removeAllElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:66"]
  T17["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S17 -->|calls| T17
  S18["method:ASMutableElementMap::insertEmptySectionsOfItemsAtIndexes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:77"]
  T18["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S18 -->|calls| T18
  S19["method:ASMutableElementMap::insertElement:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:84"]
  T19["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S19 -->|calls| T19
  S20["method:ASMutableElementMap::migrateSupplementaryElementsWithSectionMapping:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:99"]
  T20["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S20 -->|calls| T20
  S21["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  T21["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S21 -->|calls| T21
  S22["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  T22["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S22 -->|calls| T22
  S23["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  T23["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S23 -->|calls| T23
  S24["method:ASPendingStateController::registerNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:52"]
  T24["method:ASPendingStateController::scheduleFlushIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:81"]
  S24 -->|calls| T24
  S25["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  T25["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

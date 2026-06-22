# `calls 符号关系 - 104`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T1["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S1 -->|calls| T1
  S2["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T2["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S2 -->|calls| T2
  S3["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T3["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S3 -->|calls| T3
  S4["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T4["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S4 -->|calls| T4
  S5["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T5["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  S5 -->|calls| T5
  S6["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  T6["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  S6 -->|calls| T6
  S7["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  T7["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  S7 -->|calls| T7
  S8["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  T8["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S8 -->|calls| T8
  S9["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  T9["method:ASCollectionElement::initWithNodeModel:nodeBlock:supplementaryElementKind:constrainedSize:owningNode:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionElement.mm:26"]
  S9 -->|calls| T9
  S10["method:ASDataController::onDidFinishProcessingUpdates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:505"]
  T10["method:ASDataController::isProcessingUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:499"]
  S10 -->|calls| T10
  S11["method:ASDataController::onDidFinishProcessingUpdates:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:505"]
  T11["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S11 -->|calls| T11
  S12["method:ASDataController::onDidFinishSynchronizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:529"]
  T12["method:ASDataController::isSynchronized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:525"]
  S12 -->|calls| T12
  S13["method:ASDataController::onDidFinishSynchronizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:529"]
  T13["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S13 -->|calls| T13
  S14["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T14["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S14 -->|calls| T14
  S15["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T15["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S15 -->|calls| T15
  S16["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T16["function:ASViewToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S16 -->|calls| T16
  S17["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T17["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S17 -->|calls| T17
  S18["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T18["function:ASViewToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S18 -->|calls| T18
  S19["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T19["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S19 -->|calls| T19
  S20["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T20["function:ASViewToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S20 -->|calls| T20
  S21["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T21["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S21 -->|calls| T21
  S22["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T22["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S22 -->|calls| T22
  S23["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T23["method:ASDataController::invalidateDataSourceItemCounts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:432"]
  S23 -->|calls| T23
  S24["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T24["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S24 -->|calls| T24
  S25["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T25["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 086`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDataController::onDidFinishSynchronizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:529"]
  T1["method:ASDataController::isSynchronized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:525"]
  S1 -->|calls| T1
  S2["method:ASDataController::onDidFinishSynchronizing:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:529"]
  T2["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S2 -->|calls| T2
  S3["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T3["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S3 -->|calls| T3
  S4["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T4["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S4 -->|calls| T4
  S5["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T5["function:ASViewToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S5 -->|calls| T5
  S6["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T6["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S6 -->|calls| T6
  S7["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T7["function:ASViewToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S7 -->|calls| T7
  S8["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T8["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S8 -->|calls| T8
  S9["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T9["function:ASViewToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S9 -->|calls| T9
  S10["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T10["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S10 -->|calls| T10
  S11["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T11["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S11 -->|calls| T11
  S12["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T12["method:ASDataController::invalidateDataSourceItemCounts<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:432"]
  S12 -->|calls| T12
  S13["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T13["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S13 -->|calls| T13
  S14["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T14["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  S14 -->|calls| T14
  S15["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T15["method:ASDataController::_updateElementsInMap:changeSet:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:760"]
  S15 -->|calls| T15
  S16["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T16["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S16 -->|calls| T16
  S17["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T17["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S17 -->|calls| T17
  S18["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T18["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  S18 -->|calls| T18
  S19["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T19["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S19 -->|calls| T19
  S20["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T20["method:ASMutableElementMap::removeAllSections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:41"]
  S20 -->|calls| T20
  S21["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T21["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S21 -->|calls| T21
  S22["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T22["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S22 -->|calls| T22
  S23["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T23["method:ASDataController::_insertSectionsIntoMap:indexes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:742"]
  S23 -->|calls| T23
  S24["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T24["method:ASDataController::_insertSectionsIntoMap:indexes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:742"]
  S24 -->|calls| T24
  S25["method:ASDataController::_insertSectionsIntoMap:indexes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:742"]
  T25["method:ASSection::initWithSectionID:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASSection.mm:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

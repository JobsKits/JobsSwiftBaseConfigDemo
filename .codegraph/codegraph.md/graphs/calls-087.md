# `calls 符号关系 - 087`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDataController::relayoutNodes:nodesSizeChanged:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:841"]
  T1["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S1 -->|calls| T1
  S2["method:ASDataController::relayoutNodes:nodesSizeChanged:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:841"]
  T2["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  S2 -->|calls| T2
  S3["method:ASDataController::relayoutAllNodesWithInvalidationBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:875"]
  T3["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  S3 -->|calls| T3
  S4["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T4["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  S4 -->|calls| T4
  S5["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T5["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S5 -->|calls| T5
  S6["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T6["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S6 -->|calls| T6
  S7["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T7["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  S7 -->|calls| T7
  S8["method:ASDataController::environmentDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:937"]
  T8["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S8 -->|calls| T8
  S9["method:ASDataController::clearData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  T9["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S9 -->|calls| T9
  S10["method:ASDataController::clearData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  T10["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S10 -->|calls| T10
  S11["method:ASTableViewProxy::modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:78"]
  T11["method:ASDelegateProxy::_modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:260"]
  S11 -->|calls| T11
  S12["method:ASTableViewProxy::indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:82"]
  T12["method:ASDelegateProxy::_indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:264"]
  S12 -->|calls| T12
  S13["method:ASCollectionViewProxy::modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:146"]
  T13["method:ASDelegateProxy::_modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:260"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewProxy::indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:150"]
  T14["method:ASDelegateProxy::_indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:264"]
  S14 -->|calls| T14
  S15["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  T15["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T16["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T17["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T18["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T19["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T20["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["method:ASElementMap::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:34"]
  T21["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  S21 -->|calls| T21
  S22["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  T22["method:ASElementMap::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:34"]
  S22 -->|calls| T22
  S23["method:ASElementMap::itemIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:74"]
  T23["function:ASIndexPathsForTwoDimensionalArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:66"]
  S23 -->|calls| T23
  S24["method:ASElementMap::itemElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:79"]
  T24["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S24 -->|calls| T24
  S25["method:ASElementMap::numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:94"]
  T25["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

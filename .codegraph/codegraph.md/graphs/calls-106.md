# `calls 符号关系 - 106`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T1["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S1 -->|calls| T1
  S2["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T2["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S2 -->|calls| T2
  S3["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T3["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  S3 -->|calls| T3
  S4["method:ASDataController::environmentDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:937"]
  T4["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S4 -->|calls| T4
  S5["method:ASDataController::clearData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  T5["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S5 -->|calls| T5
  S6["method:ASDataController::clearData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  T6["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S6 -->|calls| T6
  S7["method:ASTableViewProxy::modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:78"]
  T7["method:ASDelegateProxy::_modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:260"]
  S7 -->|calls| T7
  S8["method:ASTableViewProxy::indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:82"]
  T8["method:ASDelegateProxy::_indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:264"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewProxy::modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:146"]
  T9["method:ASDelegateProxy::_modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:260"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewProxy::indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:150"]
  T10["method:ASDelegateProxy::_indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:264"]
  S10 -->|calls| T10
  S11["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  T11["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T12["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T13["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T14["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T15["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T16["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["method:ASElementMap::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:34"]
  T17["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  S17 -->|calls| T17
  S18["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  T18["method:ASElementMap::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:34"]
  S18 -->|calls| T18
  S19["method:ASElementMap::itemIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:74"]
  T19["function:ASIndexPathsForTwoDimensionalArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:66"]
  S19 -->|calls| T19
  S20["method:ASElementMap::itemElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:79"]
  T20["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S20 -->|calls| T20
  S21["method:ASElementMap::numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:94"]
  T21["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S21 -->|calls| T21
  S22["method:ASElementMap::contextForSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:103"]
  T22["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S22 -->|calls| T22
  S23["method:ASElementMap::elementForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:126"]
  T23["method:ASElementMap::itemIndexPathIsValid:assert:item:section:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:251"]
  S23 -->|calls| T23
  S24["method:ASElementMap::elementForLayoutAttributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:141"]
  T24["method:ASElementMap::supplementaryElementOfKind:atIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:136"]
  S24 -->|calls| T24
  S25["method:ASElementMap::convertIndexPath:fromMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:156"]
  T25["method:ASElementMap::convertSection:fromMap:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:169"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

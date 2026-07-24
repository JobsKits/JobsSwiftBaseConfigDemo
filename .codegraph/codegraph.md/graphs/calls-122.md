# `calls 符号关系 - 122`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  T1["method:ASPendingStateController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S1 -->|calls| T1
  S2["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  T2["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S2 -->|calls| T2
  S3["method:ASPendingStateController::scheduleFlushIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:81"]
  T3["method:ASPendingStateController::flush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  S3 -->|calls| T3
  S4["method:ASResponderChainEnumerator::initWithResponder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:17"]
  T4["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S4 -->|calls| T4
  S5["method:ASSection::initWithSectionID:context:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASSection.mm:15"]
  T5["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T6["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T7["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T8["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T9["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T10["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T11["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T12["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T13["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T14["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["method:ASTip::initWithNode:kind:format:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTip.mm:18"]
  T15["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S15 -->|calls| T15
  S16["method:ASTipNode::initWithTip:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipNode.mm:16"]
  T16["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S16 -->|calls| T16
  S17["method:ASTipNode::initWithTip:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipNode.mm:16"]
  T17["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipProvider.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipProvider.h:1"]
  T18["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipProvider.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipProvider.h:1"]
  T19["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["method:ASTipsController::shared<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:48"]
  T20["method:ASTipsController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  S20 -->|calls| T20
  S21["method:ASTipsController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  T21["method:ASTipsController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  S21 -->|calls| T21
  S22["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T22["method:ASDisplayNode::enableTips<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Tips.mm:26"]
  S22 -->|calls| T22
  S23["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T23["function:ASFindWindowOfLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S23 -->|calls| T23
  S24["method:ASTipsController::windowDidBecomeVisibleWithNotification:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:89"]
  T24["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S24 -->|calls| T24
  S25["method:ASTipsController::runLoopDidTick<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:114"]
  T25["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

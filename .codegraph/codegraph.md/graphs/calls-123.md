# `calls 符号关系 - 123`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTipNode::initWithTip:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipNode.mm:16"]
  T1["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S1 -->|calls| T1
  S2["method:ASTipNode::initWithTip:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipNode.mm:16"]
  T2["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipProvider.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipProvider.h:1"]
  T3["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipProvider.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipProvider.h:1"]
  T4["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S4 -->|calls| T4
  S5["method:ASTipsController::shared<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:48"]
  T5["method:ASTipsController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  S5 -->|calls| T5
  S6["method:ASTipsController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  T6["method:ASTipsController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  S6 -->|calls| T6
  S7["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T7["method:ASDisplayNode::enableTips<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Tips.mm:26"]
  S7 -->|calls| T7
  S8["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T8["function:ASFindWindowOfLayer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S8 -->|calls| T8
  S9["method:ASTipsController::windowDidBecomeVisibleWithNotification:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:89"]
  T9["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S9 -->|calls| T9
  S10["method:ASTipsController::runLoopDidTick<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:114"]
  T10["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S10 -->|calls| T10
  S11["method:ASTipsController::createTipWindowIfNeededWithFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:151"]
  T11["method:ASTipsController::setupRunLoopObserver<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:167"]
  S11 -->|calls| T11
  S12["method:ASTipsController::setupRunLoopObserver<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:167"]
  T12["method:ASTipsController::runLoopDidTick<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:114"]
  S12 -->|calls| T12
  S13["method:ASTipsWindow::initWithFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:24"]
  T13["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S13 -->|calls| T13
  S14["method:ASTipsWindow::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:45"]
  T14["method:ASTipsWindow::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:45"]
  S14 -->|calls| T14
  S15["method:ASTipsWindow::didTapTipNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:63"]
  T15["method:ASDisplayNode::tipDisplayBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Tips.mm:41"]
  S15 -->|calls| T15
  S16["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  T16["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T17["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T18["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S18 -->|calls| T18
  S19["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  T19["method:ASWeakMap::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S19 -->|calls| T19
  S20["method:ASWeakMap::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  T20["method:ASWeakMap::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S20 -->|calls| T20
  S21["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  T21["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  S21 -->|calls| T21
  S22["function:compareCrossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T22["function:crossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S22 -->|calls| T22
  S23["function:compareCrossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T23["function:crossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S23 -->|calls| T23
  S24["function:directionSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T24["function:directionSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S24 -->|calls| T24
  S25["function:directionSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T25["function:directionSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

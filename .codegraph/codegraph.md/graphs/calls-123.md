# `calls 符号关系 - 123`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTipsController::createTipWindowIfNeededWithFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:151"]
  T1["method:ASTipsController::setupRunLoopObserver<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:167"]
  S1 -->|calls| T1
  S2["method:ASTipsController::setupRunLoopObserver<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:167"]
  T2["method:ASTipsController::runLoopDidTick<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsController.mm:114"]
  S2 -->|calls| T2
  S3["method:ASTipsWindow::initWithFrame:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:24"]
  T3["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S3 -->|calls| T3
  S4["method:ASTipsWindow::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:45"]
  T4["method:ASTipsWindow::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:45"]
  S4 -->|calls| T4
  S5["method:ASTipsWindow::didTapTipNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:63"]
  T5["method:ASDisplayNode::tipDisplayBlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Tips.mm:41"]
  S5 -->|calls| T5
  S6["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  T6["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T7["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T8["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S8 -->|calls| T8
  S9["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  T9["method:ASWeakMap::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S9 -->|calls| T9
  S10["method:ASWeakMap::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  T10["method:ASWeakMap::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S10 -->|calls| T10
  S11["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  T11["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  S11 -->|calls| T11
  S12["function:compareCrossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T12["function:crossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S12 -->|calls| T12
  S13["function:compareCrossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T13["function:crossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S13 -->|calls| T13
  S14["function:directionSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T14["function:directionSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S14 -->|calls| T14
  S15["function:directionSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T15["function:directionSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S15 -->|calls| T15
  S16["function:crossOffsetForItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T16["function:alignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:58"]
  S16 -->|calls| T16
  S17["function:crossOffsetForItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T17["function:crossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S17 -->|calls| T17
  S18["function:crossOffsetForItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T18["function:ASFloorPixelValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S18 -->|calls| T18
  S19["function:crossOffsetForItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T19["function:crossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S19 -->|calls| T19
  S20["function:positionItemsInLine<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T20["function:directionPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S20 -->|calls| T20
  S21["function:positionItemsInLine<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T21["function:if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S21 -->|calls| T21
  S22["function:positionItemsInLine<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T22["function:directionPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S22 -->|calls| T22
  S23["function:positionItemsInLine<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T23["function:directionPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S23 -->|calls| T23
  S24["function:positionItemsInLine<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T24["function:crossOffsetForItem<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  S24 -->|calls| T24
  S25["function:positionItemsInLine<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T25["function:directionPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

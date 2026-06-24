# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T1["function:_ASSizeFitWithAspectRatio<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:26"]
  S1 -->|calls| T1
  S2["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T2["function:_ASSizeFillWithAspectRatio<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:16"]
  S2 -->|calls| T2
  S3["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T3["function:_ASSizeFillWithAspectRatio<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:16"]
  S3 -->|calls| T3
  S4["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T4["function:_ASSizeFitWithAspectRatio<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:26"]
  S4 -->|calls| T4
  S5["method:ASLayerBackingTipProvider::tipForNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayerBackingTipProvider.mm:22"]
  T5["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S5 -->|calls| T5
  S6["method:ASLayerBackingTipProvider::tipForNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayerBackingTipProvider.mm:22"]
  T6["method:ASTip::initWithNode:kind:format:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTip.mm:18"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T7["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T8["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T9["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T10["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["method:ASLayoutTransition::initWithNode:pendingLayout:previousLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:66"]
  T11["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S11 -->|calls| T11
  S12["method:ASLayoutTransition::isSynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:81"]
  T12["function:ASLayoutCanTransitionAsynchronous<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:29"]
  S12 -->|calls| T12
  S13["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  T13["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  S13 -->|calls| T13
  S14["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T14["function:if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S14 -->|calls| T14
  S15["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T15["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S15 -->|calls| T15
  S16["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T16["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S16 -->|calls| T16
  S17["class:ASLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:54"]
  T17["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S17 -->|calls| T17
  S18["class:ASLayoutTransition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:54"]
  T18["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S18 -->|calls| T18
  S19["method:ASLayoutTransition::transitionContext:constrainedSizeForKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:236"]
  T19["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S19 -->|calls| T19
  S20["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  T20["function:ASLayoutTransition::findNodesInLayoutAtIndexesWithFilteredNodes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:265"]
  S20 -->|calls| T20
  S21["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  T21["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S21 -->|calls| T21
  S22["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  T22["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  S22 -->|calls| T22
  S23["method:ASMutableElementMap::copyWithZone:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:36"]
  T23["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  S23 -->|calls| T23
  S24["method:ASMutableElementMap::removeAllSections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:41"]
  T24["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S24 -->|calls| T24
  S25["method:ASMutableElementMap::removeItemsAtIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:51"]
  T25["function:ASDeleteElementsInTwoDimensionalArrayAtIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
